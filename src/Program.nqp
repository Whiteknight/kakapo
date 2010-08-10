# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::ProgramExit
	is Exception::Wrapper {
}

# Provides a conventional framework for program execution.
class Program;

has @!argv;
has $!executable_name;
has $!exit_marshaller;
has $!exit_value;
has %!handles;
has &!main;
has $!program_name;
has $!start_marshaller;

our $_Instance;

INIT {
	Kakapo::depends_on( <Library FileSystem> );
	$_Instance := my $undef;
}

sub _initload() {
	auto_accessors(:private);

	# Initialize global contextual vars:
	my $config := pir::getinterp__P()[8];
	pir::set_hll_global__vSP( <%VM>, $config );

	my $instance := FileSystem.instance;
	pir::set_hll_global__vSP( <$FileSystem>, $instance);

	Global::inject_root_symbol( Program::global_at_exit, :as('at_exit') );
	Global::inject_root_symbol( Program::global_at_start, :as('at_start') );

	Global::inject_root_symbol( Program::exit );
	Global::inject_root_symbol( Program::_exit );
}

our method at_exit($sub, $name?, :$namespace = Parrot::caller_namespace(), :@requires) {
	$!exit_marshaller.add_call($sub, $name, :namespace($namespace), :requires(@requires));
}

our method at_start($sub, $name?, :$namespace = Parrot::caller_namespace(), :@requires) {
	$!start_marshaller.add_call($sub, $name, :namespace($namespace), :requires(@requires));
}

our method do_exit() {
	$!exit_marshaller.process_queue(self);
}

our method do_start() {
	$!start_marshaller.process_queue(self);
}

sub exit($status = 0) {
	Exception::ProgramExit.new(
		:exit_code($status),
		:message("exit($status)"),
		:payload($status)
	).throw;
}

sub _exit($status = 1) {
	pir::exit($status);
}

our method exit_program($status = 0) {
	$!exit_value := $status;
}

our method set_main(&new_value) {
	&!main := &new_value;
}

sub global_at_exit(*@pos, *%named) {
	instance().at_exit(|@pos, |%named);
}

sub global_at_start(*@pos, *%named) {
	instance().at_start(|@pos, |%named);
}

our method _init_obj(*@pos, *%named) {
	@!argv := @!argv;
	$!executable_name := $!executable_name;
	$!exit_marshaller :=ComponentMarshaller.new(:name('exit'));
	$!exit_value := 0;
	$!program_name := $!program_name;
	$!start_marshaller :=ComponentMarshaller.new(:name('start'));

	#super(|@pos, |%named);
	self._init_args(|@pos, |%named);
}

our method from_parrot($ignored?) {
	my $interp := pir::getinterp__P();

	@!argv := $interp[2];		# IGLOBALS_ARGV_LIST = 2
	$!executable_name := $interp[9];	# IGLOBALS_EXECUTABLE = 9
	$!program_name := @!argv.shift;
}

our method get_main() {
	&!main;
}

sub instance(*@new) {	# Use *@new to allow passing undef (simplifies testing)
	if @new.elems {
		my $old := $_Instance;

		if $old.defined
			&& (! $old.exit_marshaller.is_empty || ! $old.start_marshaller.is_empty) {
			die( "A previously-registered Program instance has unprocessed marshalling queues." );
		}

		$_Instance := @new[0];
	}
	else {
		die( "No Program::instance set yet" )
			unless $_Instance.defined;

		$_Instance;
	}
}

our method main(*@argv) {
	my &main := self.get_main;

	unless &main.defined {
		&main := pir::get_hll_global__PS('main');
		&main := pir::get_hll_global__PS('MAIN')
			if pir::isnull(&main);
	}

	if pir::isnull(&main) {
		die( "Could not find a main() to run. Override main() on this class, or call set_main()" );
	}

	&main(@argv);
}

our method run( :@argv ) {
	if @argv {
		self.program_name: @argv.shift;
		self.argv: @argv;
	}

	my @*ARGS := self.argv;
	my $*PROGRAM_NAME := self.program_name;

	my $*ERR;
	my $*IN;
	my $*OUT;

	my %saved_std := self.save_std_handles;
	my %new_std := %!handles.merge: %saved_std, into => Hash.new;

	self.set_std_handles: %new_std;

	try {
		self.do_start;
		self.main;

		CATCH {
			if $!.type == Exception::ProgramExit.type {
				$!.handled: 1;
				$!exit_value := $!.payload;
			}
			else {
				$!.rethrow;
			}
		}
	};

	# TODO: Maybe differentiate between _exit and exit in the exception?
	self.do_exit;

	self.set_std_handles: %saved_std;
	self.exit_program($!exit_value);
}

our method save_std_handles() {
	my %handles;

	%handles<stderr>	:= pir::getstderr__P();
	%handles<stdin>	:= pir::getstdin__P();
	%handles<stdout> := pir::getstdout__P();

	%handles;
}

our method set_std_handles(%handles) {

	pir::setstderr__vP(%handles<stderr>);
	$*ERR := %handles<stderr>;

	pir::setstdin__vP(%handles<stdin>);
	$*IN := %handles<stdin>;

	pir::setstdout__vP(%handles<stdout>);
	$*OUT := %handles<stdout>;

	self;
}

# NB: Use pir::defined because Handles are PMCs (and hard to wrap!)
our method stderr($value?)		{ pir::defined($value) ?? (%!handles<stderr> := $value) !! %!handles<stderr> }
our method stdin($value?)		{ pir::defined($value) ?? (%!handles<stdin> := $value) !! %!handles<stdin> }
our method stdout($value?)		{ pir::defined($value) ?? (%!handles<stdout> := $value) !! %!handles<stdout> }

sub swap_handles(*%handles) {
	my %save_handles;

	if pir::defined( %handles<stderr> ) {
		%save_handles<stderr> := pir::getstderr__P();
		pir::setstderr( %handles<stderr> );
	}

	if pir::defined( %handles<stdin> ) {
		%save_handles<stdin> := pir::getstdin__P();
		pir::setstdin( %handles<stdin> );
	}

	if pir::defined( %handles<stdout> ) {
		%save_handles<stdout> := pir::getstdout__P();
		pir::setstdout( %handles<stdout> );
	}

	%save_handles;
}
