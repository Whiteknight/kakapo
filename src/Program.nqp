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
		$!_process_id
	>);
	
	our $_Instance := Program.new;	
	
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
	
	my $code := self.exit_code;
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

my method get_interp_info() {
	my $interp := pir::getinterp__P();
	
	self.args($interp[2]);
	self.executable($interp[9]);
}

our method _init_(@pos, %named) {
	self.at_exit_queue(DependencyQueue.new);
	self.at_init_queue(DependencyQueue.new);
	self.at_load_queue(DependencyQueue.new);
	
	self.env(pir::new__PS('Env'));
	
	self._init_args_(@pos, %named);
}

method main(@args) {
	my &main := pir::get_hll_global__PS('main');
	
	if pir::isnull(&main) {
		die("You must override the '.main' method of your program class.");
	}
	
	&main(@args);
}

our method process_id() {
	if pir::isnull(self._process_id) {
		my &getpid := pir::dlfunc__PPSS(pir::null__P(), 'getpid', 'I');
		self._process_id( &getpid() );
	}
	
	self._process_id;		
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
	my $exception;

	try {	
		self.main(@args);

		CATCH {
			$exception := $!;
		}
	};
	
	if $exception.defined {
		unless $exception.type == Exception::ProgramExit.type {
			$exception.rethrow;
		}
		
		self.exit_value($exception.payload);
	}
	
	self.do_exit;
}

my method stderr($value?) {
	if $value.defined {
		pir::setstderr($value);
		self;
	}
	else {
		pir::getstderr__P;
	}
}

my method stdin($value?) {
	if $value.defined {
		pir::setstdin($value);
		self;
	}
	else {
		pir::getstdin__P();
	}
}

my method stdout($value?) {
	if $value.defined {
		pir::setstdout($value);
		self;
	}
	else {
		pir::getstdout__P();
	}
}

##############################################

sub add_call($queue, $call, %opts, $caller_nsp) {
# Adds a C< $call > with C< @prereqs > to C< $queue >, tagged with key C< $name >. When no call 
# is specified, calculates a reasonable default using any of the C< @sub_names > defined in the 
# C< $caller_nsp > namespace.

# For example, when the caller calls:

	# Program::init(:after('Dumper'));
	
# The value of C< $queue > is determined by it being a call to C< init >. The C< $call > will
# be undef, because no Sub or name was given. The C< $name > will be undef because no
# C< :name > was given. The C< @prereqs > will be ( 'Dumper' ), and C< $caller_nsp > will be 
# captured by C< init >. The C< @sub_names > will be C< ( '_init' ) >.

	my $name := %opts<name> ?? %opts<name> !! Parrot::namespace_name($caller_nsp);
	
	if %opts<done> {
		$queue.mark_as_done($name);
	}
	else {
		my @prereqs := %opts<after>;
		
		if isa(@prereqs, 'String') {
			@prereqs := Array::new(@prereqs);
		}

		$call := determine_call($call, $caller_nsp, Array::new('_load', '_initload'));
		$queue.add_entry($name, $call, @prereqs);
	}
}

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
