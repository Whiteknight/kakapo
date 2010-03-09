# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::ProgramExit
	is Exception::Wrapper {
}

# Provides a conventional framework for program execution. 
module Program;

has @!argv;
has $!at_exit_queue;
has $!at_start_queue;
has $!exit_value;
has $!stderr;
has $!stdin;
has $!stdout;


INIT {
	Kakapo::depends_on( <Library> );
}

sub _initload() {
	extends( Library );		# FIXME: Refactor queue stuff out of library, and share.
	has(<	@!argv
		$!at_exit_queue
		$!at_start_queue
		$!exit_value
		$!stderr
		$!stdin
		$!stdout
	>);
	
	Global::inject_root_symbol( Program::exit );
}

our method at_exit(*@pos, *%named) {
	self.add_call($!at_exit_queue, |@pos, |%named);
}

our method at_start(*@pos, *%named) {
	self.add_call($!at_start_queue, |@pos, |%named);
}

our method do_exit() {
	self.process_queue($!at_exit_queue, :name('exit'));
	
	my $code := $!exit_value;
	pir::exit($code);
}

our method do_start() {
	self.process_queue($!at_start_queue, :name('start'));
}

sub exit($status = 0) {
	Exception::ProgramExit.new(
		:exit_code($status),
		:message("exit($status)"), 
		:payload($status)
	).throw;
}

method _init_obj(*@pos, *%named) {
	@!argv := @!argv;
	$!at_exit_queue := DependencyQueue.new;
	$!at_start_queue := DependencyQueue.new;
	$!exit_value := 0;
	
	#super(|@pos, |%named);
	self._init_args(|@pos, |%named);
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
	
	swap_handles(|%save_fh);
	$!exit_value;
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


#~ sub _pre_initload(*@modules_done) {
	
	#~ has(<	
		#~ %!env
		#~ $!executable
		#~ $!process_id
		#~ $!uid
	#~ >);
	
	#~ say("Program init load done");
#~ }

#~ # Copy fields from another instance.
#~ our method incorporate($other) {
	#~ @!args		:= $other.args;
	#~ $!at_exit_queue	:= $other.at_exit_queue;
	#~ $!at_init_queue	:= $other.at_init_queue;
	#~ $!at_load_queue	:= $other.at_load_queue;
	#~ %!env			:= $other.env;
	#~ $!executable		:= $other.executable;
	#~ $!exit_value		:= $other.exit_value;
	#~ $!process_id		:= $other.process_id;
	#~ $!stderr		:= $other.stderr;
	#~ $!stdin		:= $other.stdin;
	#~ $!stdout		:= $other.stdout;
	#~ $!uid			:= $other.uid;
#~ }

#~ method main(@args) {
	#~ my &main := pir::get_hll_global__PS('main');
	
	#~ if pir::isnull(&main) {
		#~ die("You must override the '.main' method of your program class.");
	#~ }
	
	#~ &main(@args);
#~ }

#~ method run(*@args) {

	#~ my $*PROGRAM_NAME := @args.elems
		#~ ?? @args.shift
		#~ !! '<anonymous>';
	#~ my @*ARGS		:= @args;
	#~ #my $*CWD		:= '';
	#~ my %*ENV		:= %!env;
	#~ my $*EXECUTABLE_NAME := $!executable;
	#~ my $*PID		:= $!process_id;	# May be unset.
	#~ #my $*UID		:= $!uid;		# May be unset.
	#~ my $?PERL		:= 'nqp-rx';
	#~ my $?VM		:= 'parrot';
	#~ # %*OPTS	# ??
	#~ # @*INC ??

	#~ my $i := 0;
	#~ my %*VM;
	#~ my $interp := pir::getinterp__P();
	
	#~ for <	classname 
		#~ compreg
		#~ argv
		#~ nci_funcs
		#~ interpreter
		#~ dyn_libs
		#~ config
		#~ lib_paths
		#~ pbc_libs
		#~ executable> {
		#~ %*VM{~$_} := $interp[$i++];
	#~ }
	
	#~ my $fh;
	#~ my %save_fh;

	#~ my $*ERR := pir::getstderr__P();
	#~ if pir::defined( $!stderr ) {
		#~ %save_fh<stderr> := $*ERR;
		#~ pir::setstderr( $*ERR := $!stderr );
	#~ }
	
	#~ my $*IN := pir::getstdin__P();
	#~ if pir::defined( $!stdin ) {
		#~ %save_fh<stdin> := $*IN;
		#~ pir::setstdin( $*IN := $!stdin );
	#~ }

	#~ my $*OUT := pir::getstdout__P();
	#~ if pir::defined( $!stdout ) {
		#~ %save_fh<stdout> := $*OUT;
		#~ pir::setstdout( $*OUT := $!stdout );
	#~ }
	
	#~ my $exception;

	#~ try {	
		#~ self.main(@args);
		
		#~ CATCH {
			#~ if $!.type == Exception::ProgramExit.type {
				#~ $!exit_value := $!.payload;
			#~ }
			#~ else {
				#~ $!.rethrow;
			#~ }
		#~ }
	#~ };

	#~ pir::setstderr(%save_fh<stderr>) if %save_fh.contains( <stderr> );
	#~ pir::setstdin(%save_fh<stdin>)   if %save_fh.contains( <stdin> );
	#~ pir::setstdout(%save_fh<stdout>) if %save_fh.contains( <stdout> );

	#~ $!exit_value := self.do_exit;
#~ }
