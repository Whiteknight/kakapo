# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::ProgramExit
	is Exception::Wrapper {
}

module Program;
# Provides a conventional framework for program execution. 

sub _pre_initload(*@modules_done) {

	has(<	@.args
		$!at_exit_queue
		$!at_init_queue
		$!at_load_queue
		%.env
		$.executable
		$.exit_value
		$.process_id
		$.stdin
		$.stderr
		$.stdout
		$.uid
	>);
	
	Global::inject_root_symbol(Program::exit);
}

my method add_call_($queue, @pos, %named) {
	unless %named.contains('namespace') {
		%named<namespace> := Parrot::caller_namespace(3);
	}
	
	my $name;
	my $sub := @pos.shift;
	
	if @pos.elements {
		$name := @pos.shift;
	}
	elsif $sub.isa( 'String' ) {
		$name := $sub;
	}
	elsif $sub.isa( 'Sub' ) {
		$name := $sub.get_namespace.get_name.join('::') ~ '::' ~ $sub;
	}
	else {
		Exception::InvalidArgument.new(
			:message('Invalid $call argument. Must be Sub or String'),
		).throw;		
	}
	
	$queue.add_entry($name, $sub, %named<requires>);
}

my method at_exit(*@pos, *%named) {
	self.add_call_(self.at_exit_queue, @pos, %named);
}

my method at_init(*@pos, *%named) {
	self.add_call_(self.at_init_queue, @pos, %named);
}

my method at_load(*@pos, *%named) {
	self.add_call_(self.at_load_queue, @pos, %named);
}

our method do_exit() {
	self.process_queue(self.at_exit_queue, :name('exit'));
	
	my $code := self.exit_value;
	pir::exit($code);
}

our method do_init() {
	self.process_queue(self.at_init_queue, :name('init'));
}

our method do_load() {
	self.process_queue(self.at_load_queue, :name('load'));
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
	self.args($other.args);
	self.at_exit_queue($other.at_exit_queue);
	self.at_init_queue($other.at_init_queue);
	self.at_load_queue($other.at_load_queue);
	self.env($other.env);
	self.executable($other.executable);
	self.exit_value($other.exit_value);
	self.process_id($other.process_id);
	self.stderr($other.stderr);
	self.stdin($other.stdin);
	self.stdout($other.stdout);
	self.uid($other.uid);
}

our method _init_(@pos, %named) {
	self.at_exit_queue(DependencyQueue.new);
	self.at_init_queue(DependencyQueue.new);
	self.at_load_queue(DependencyQueue.new);
	
	self._init_args_(@pos, %named);
}

method main(@args) {
	my &main := pir::get_hll_global__PS('main');
	
	if pir::isnull(&main) {
		die("You must override the '.main' method of your program class.");
	}
	
	&main(@args);
}

my method process_queue($queue, :$name!) {
	my $callee;
	
	while ! $queue.is_empty {
		$callee := $queue.next_entry;
		$callee := Parrot::get_hll_global($callee)
			if $callee.isa('String');
		
		die( "Got null callee while processing $name queue" )
			if pir::isnull($callee);
			
		$callee(self);
	}
	
	$queue.reset;
}

method run(@args?) {

	if @args {
		self.args(@args);
	}
	else {
		@args := self.args;
	}

	@args := @args.clone;

	my $*PROGRAM_NAME := @args.elements
		?? @args.shift
		!! '<anonymous>';
	my @*ARGS := @args;
	#my $*CWD := '';
	my %*ENV := self.env;
	my $*EXECUTABLE_NAME := self.executable;
	my $*PID := self.process_id;	# May be unset.
	#my $*UID := self.uid;		# May be unset.
	my $?PERL := 'nqp-rx';
	my $?VM := 'parrot';
	# %*OPTS	# ??
	# @*INC ??

	my $fh;
	my %save_fh;

	my $*ERR := pir::getstderr__P();
	if pir::defined($fh := self.stderr) {
		%save_fh<stderr> := $*ERR;
		pir::setstderr($*ERR := $fh);
	}
	
	my $*IN := pir::getstdin__P();
	if pir::defined($fh := self.stdin) {
		%save_fh<stdin> := $*IN;
		pir::setstdin($*IN := $fh);
	}

	my $*OUT := pir::getstdout__P();
	if pir::defined($fh := self.stdout) {
		%save_fh<stdout> := $*OUT;
		pir::setstdout($*OUT := $fh);
	}
	
	my $exception;

	try {	
		self.main(@args);
		
		CATCH {
			$exception := $!;
		}
	};

	pir::setstderr(%save_fh<stderr>) if %save_fh.contains( <stderr> );
	pir::setstdin(%save_fh<stdin>)   if %save_fh.contains( <stdin> );
	pir::setstdout(%save_fh<stdout>) if %save_fh.contains( <stdout> );

	if $exception.defined {
		unless $exception.type == Exception::ProgramExit.type {
			$exception.rethrow;
		}
		
		self.exit_value($exception.payload);
	}
	
	my $result := self.do_exit;
	
	$result;
}

##############################################

sub call($call) {
# Calls the Sub or MultiSub PMC passed as C<$call>, or, if C<$call> 
# is a String, looks up the named symbol and calls that.

	if $call.isa('String') {
		my @nsp := $call.split('::');
		my $name := @nsp.pop;
	
		# Shenanigans to handle '::main' correctly as a hll-root object.
		if @nsp[0] eq '' {
			@nsp.shift;
		}
		
		$call := Opcode::get_hll_global(@nsp, $name);
	}

	my $status := 0;
	
	if ! Opcode::isnull($call) && $call.defined {
		$status := $call();
	}
	
	return $status;
}

sub determine_call($call, $caller_nsp, @sub_names) {
# Determines a sub to be called. If C< $call > is defined, it specifies the call -- either a sub
# of some kind, or a String name to be resolved, or some other invokable object. Otherwise,
# the C< $caller_nsp > is checked for any of the default C< @sub_names >. The first one
# found is used.

	my $nsp_name := Parrot::namespace_name($caller_nsp);
	
	if defined($call) {
		if isa($call, 'String') {
			if +$call.split('::') == 1 {
				$call := $nsp_name ~ '::' ~ $call;
			}
		}
		
		return $call;
	}
	
	for @sub_names {
		if $call := $caller_nsp{~$_} {
			return $call;
		}
	}
	
	die("Cannot find any viable call (", @sub_names.join(', '), ") in ", $nsp_name);
}
