# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::ProgramExit
	is Exception::Wrapper {
}

module Program;
# Provides a conventional framework for program execution. 

sub _pre_initload(*@modules_done) {
	
	extends( 'Library' );
	
	has(<	@!args
		$!at_exit_queue
		%!env
		$!executable
		$!exit_value
		$!process_id
		$!stdin
		$!stderr
		$!stdout
		$!uid
	>);
	
	Global::inject_root_symbol(Program::exit);
	say("Program init load done");
}

our method at_exit(*@pos, *%named) {
	self.add_call($!at_exit_queue, |@pos, |%named);
}

our method do_exit() {
	self.process_queue($!at_exit_queue, :name('exit'));
	
	my $code := $!exit_value;
	pir::exit($code);
}

sub exit($status) {
	Exception::ProgramExit.new(
		:exit_code($status),
		:message("exit($status)"), 
		:payload($status)
	).throw;
}

# Copy fields from another instance.
our method incorporate($other) {
	@!args		:= $other.args;
	$!at_exit_queue	:= $other.at_exit_queue;
	$!at_init_queue	:= $other.at_init_queue;
	$!at_load_queue	:= $other.at_load_queue;
	%!env			:= $other.env;
	$!executable		:= $other.executable;
	$!exit_value		:= $other.exit_value;
	$!process_id		:= $other.process_id;
	$!stderr		:= $other.stderr;
	$!stdin		:= $other.stdin;
	$!stdout		:= $other.stdout;
	$!uid			:= $other.uid;
}

our method _init_obj(*@pos, *%named) {
	$!at_exit_queue := DependencyQueue.new;
	super(|@pos, |%named);
}

method main(@args) {
	my &main := pir::get_hll_global__PS('main');
	
	if pir::isnull(&main) {
		die("You must override the '.main' method of your program class.");
	}
	
	&main(@args);
}

method run(*@args) {
	if @args.elems == 1
		&& ! @args[0].isa('String')
		&& @args[0].does('array') {
		@args := @args.shift;
	}

	if @args {
		@!args := @args;
	}
	else {
		@args := @!args;
	}

	@args := @args.clone;

	my $*PROGRAM_NAME := @args.elems
		?? @args.shift
		!! '<anonymous>';
	my @*ARGS		:= @args;
	#my $*CWD		:= '';
	my %*ENV		:= %!env;
	my $*EXECUTABLE_NAME := $!executable;
	my $*PID		:= $!process_id;	# May be unset.
	#my $*UID		:= $!uid;		# May be unset.
	my $?PERL		:= 'nqp-rx';
	my $?VM		:= 'parrot';
	# %*OPTS	# ??
	# @*INC ??

	my $i := 0;
	my %*VM;
	my $interp := pir::getinterp__P();
	
	for <	classname 
		compreg
		argv
		nci_funcs
		interpreter
		dyn_libs
		config
		lib_paths
		pbc_libs
		executable> {
		%*VM{~$_} := $interp[$i++];
	}
	
	my $fh;
	my %save_fh;

	my $*ERR := pir::getstderr__P();
	if pir::defined( $!stderr ) {
		%save_fh<stderr> := $*ERR;
		pir::setstderr( $*ERR := $!stderr );
	}
	
	my $*IN := pir::getstdin__P();
	if pir::defined( $!stdin ) {
		%save_fh<stdin> := $*IN;
		pir::setstdin( $*IN := $!stdin );
	}

	my $*OUT := pir::getstdout__P();
	if pir::defined( $!stdout ) {
		%save_fh<stdout> := $*OUT;
		pir::setstdout( $*OUT := $!stdout );
	}
	
	my $exception;

	try {	
		self.main(@args);
		
		CATCH {
			if $!.type == Exception::ProgramExit.type {
				$!exit_value := $!.payload;
			}
			else {
				$!.rethrow;
			}
		}
	};

	pir::setstderr(%save_fh<stderr>) if %save_fh.contains( <stderr> );
	pir::setstdin(%save_fh<stdin>)   if %save_fh.contains( <stdin> );
	pir::setstdout(%save_fh<stdout>) if %save_fh.contains( <stdout> );

	$!exit_value := self.do_exit;
}
