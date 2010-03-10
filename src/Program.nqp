# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::ProgramExit
	is Exception::Wrapper {
}

# Provides a conventional framework for program execution. 
module Program;

has @!argv;
has $!exit_marshaller;
has $!start_marshaller;
has $!executable_name;
has $!exit_value;
has $!program_name;
has $!stderr;
has $!stdin;
has $!stdout;

our $_Instance;

INIT {
	Kakapo::depends_on( <Library> );
	
	$_Instance := my $undef;
}

sub _initload() {
	extends( Library );		# FIXME: Refactor queue stuff out of library, and share.
	has(<	@!argv
		$!exit_marshaller
		$!start_marshaller
		$!executable_name
		$!exit_value
		$!program_name
		$!stderr
		$!stdin
		$!stdout
	>);
	
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

sub global_at_exit(*@pos, *%named) {
	instance().at_exit(|@pos, |%named);
}

sub global_at_start(*@pos, *%named) {
	instance().at_start(|@pos, |%named);
}

method _init_obj(*@pos, *%named) {
	@!argv := @!argv;
	$!executable_name := $!executable_name;
	$!exit_marshaller :=ComponentMarshaller.new(:name('exit'));
	$!exit_value := 0;
	$!program_name := $!program_name;
	$!start_marshaller :=ComponentMarshaller.new(:name('start'));
	
	#super(|@pos, |%named);
	self._init_args(|@pos, |%named);
}

method from_parrot($ignored?) {
	my $interp := pir::getinterp__P();
	
	@!argv := $interp[2];		# IGLOBALS_ARGV_LIST = 2
	$!executable_name := $interp[9];	# IGLOBALS_EXECUTABLE = 9
	$!program_name := @!argv.shift;
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

method main(*@argv) {
	my &main := pir::get_hll_global__PS('main');
	
	&main := pir::get_hll_global__PS('MAIN')
		if pir::isnull(&main);
		
	if pir::isnull(&main) {
		die("You must override the '.main' method of your program class.");
	}
	
	&main(@argv);
}

method run( :@argv ) {
	self.argv( @argv )
		if @argv;

	my %save_fh := swap_handles( :stderr($!stderr), :stdin($!stdin), :stdout($!stdout));

	try {
		self.do_start;
		self.main(|@!argv);
		
		CATCH {
			if $!.type == Exception::ProgramExit.type {
				$!exit_value := $!.payload;
			}
			else {
				$!.rethrow;
			}
		}
	};

	# TODO: Maybe differentiate between _exit and exit in the exception?
	self.do_exit;
	
	swap_handles(|%save_fh);

	self.exit_program($!exit_value);
}

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
