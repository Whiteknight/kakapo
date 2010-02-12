# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Program;
# Provides a conventional framework for program execution. 

=begin SYNOPSIS

	# At outmost scope of your module:
	Program::init(:after('Other::Module'));
	
	# Do what you can here:
	our @Array := (1, 2, 3);
	
	sub _initload() {
		# Do init stuff that requires Other::Module here
	}
	
	Program::register_main('MyModule::main');
	
	sub main() {
		Program::at_end('MyModule::finalize');

		if +@Array > 2 {
			say("Too many items.");
			Program::exit(1);
		}
		
		say("Hello, world!");
	}
	
	sub finalize() {
		say("Hasta la vista, baby.");
	}
	
=end SYNOPSIS

# Don't initialize *anything,* here.    !IMPORTANT
our $At_end_queue;
our $At_start_queue;
our $Init_queue;
our $Load_queue;
our $Main;
our $Processing_init_queue;
our $Processing_load_queue;

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

sub call($call) {
# Calls the Sub or MultiSub PMC passed as C<$call>, or, if C<$call> 
# is a String, looks up the named symbol and calls that.

	if $call.isa('String') {
		$call := Opcode::get_hll_global($call);
	}

	my $status := 0;
	
	if $call {
		$status := $call();
	}
	
	return $status;
}

sub call_main() {
# Executes the calls registered in the L<C< at_start >> queue, then
# runs the C<main> sub registered via L<C< register_main >>. If the
# C<main> sub returns, the result is passed to L<C< exit >>.

	process_queue($At_start_queue);

	call($Main);
	exit(0);
}

sub exit($status) {
# Exits the program, makes any calls registered with L<C<at_end>>, and 
# causes the Parrot interpreter to exit with status C<$status>.

	process_queue($At_end_queue);
	_exit($status);
}

sub _exit($status) {
# Immediately exits the Parrot VM, returning C<$status>, without calling any of 
# the registered L<C< at_end >> calls.

	Opcode::exit($status);
}

sub init($call?, *%opts) {
# Requests a call to the sub named by C< $call >, or to the sub object given in C< $call >, or
# to a default sub (named '_load' or '_initload') in the caller's namespace. The call will take
# place after all C< :load > subs in this library or program have been run. 

# The purpose of this routine is analogous to that of L<C< init >>, except for the (very 
# significant!) difference between C< :init > and C< :load > processing. The argument values
# and semantics are identical to those of C< init >.

	add_call($Init_queue, $call, %opts, Parrot::caller_namespace(2));
}

sub initload($call?, *%opts) {
# A shortcut routine. Equivalent to calling L<C< init >> and L<C< load >> with the same arguments.

	my $caller_nsp := Parrot::caller_namespace(2);
	add_call($Init_queue, $call, %opts, $caller_nsp);
	add_call($Load_queue, $call, %opts, $caller_nsp);
}

sub is_upgraded($queue) {
	return $queue.isa('ManagedQueue');
}

sub load($call?, *%opts) {
# Requests a call to the sub named by C< $call >, or to the sub object given in C< $call >, or
# to a default sub (named '_load' or '_initload') in the caller's namespace. The call will take
# place after all C< :load > subs in this library or program have been run. 

# The purpose of this routine is analogous to that of L<C< init >>, except for the (very 
# significant!) difference between C< :init > and C< :load > processing. The argument values
# and semantics are identical to those of C< init >.

	add_call($Load_queue, $call, %opts, Parrot::caller_namespace(2));
}

sub _pre_initload(*@modules_done) {
	if our $_Pre_initload_done { return 0; }
	$_Pre_initload_done := 1;
	
	use(	'Dumper' );
	use(	'Opcode', :tags('DEFAULT', 'TYPE'));
	
	$At_end_queue	:= DependencyQueue.new();
	$At_start_queue	:= DependencyQueue.new();
	$Init_queue	:= Parrot::call_method_(DependencyQueue, 'new', @modules_done);
	$Load_queue	:= Parrot::call_method_(DependencyQueue, 'new', @modules_done);

	if ! Opcode::defined($Main) {
		$Main := '::main';
	}
}

sub process_init_queue() {
# Removes each registered I< call > from the C< :init > queue, and invokes them in order.
# If the queue is not already ordered according to the parameters given when the calls
# were registered, the queue is first reordered.

# See L<C< init >> for how to add items to the queue.

# Returns nothing.

	process_queue($Init_queue);
}

sub process_load_queue() {
# Process the C<:load> queue. See L<C< process_init_queue >>.

	process_queue($Load_queue);
}

sub process_queue($q) {
# Called to process any of the queues in this module. Pulls all of the calls out of the queue, in order, and invokes them.

	while ! $q.is_empty {
		my &call := $q.next;
		call(&call);
	}
	
	$q.reset();
}

sub register_main($call?) {
# Sets the C< main > function to call. If a name with no namespace is given, 
# (like 'main') the caller's namespace is used. If no name is given at all,
# the default name is 'main'.

	unless $call.defined {
		$call := 'main';
	}
	
	if $call.isa('String') && $call.index('::') == -1 {
		my $nsp := Parrot::caller_namespace(3);
		my @parts := $nsp.get_name;
		@parts.shift;	# Lose the 'parrot'
		$call := @parts.join('::') ~ '::' ~ $call;
	}

	$Main := $call;
}

sub upgrade_queue($queue) {
# Upgrades a C< ResizablePMCArray >-based queue to a C< ManagedQueue >. 

# When Parrot loads bytecode, the ManagedQueue class has not been registered as a class, and so it is impossible to 
# make new ManagedQueue objects. Because there is no guarantee of the order that C< :init > and C< :load > methods
# are run, there is no way to ensure that ManagedQueue is registered before any other class tries to register a call.

# To deal with this uncertainty, the various registration functions (L<C< init >>, L<C< initload >>, and 
# L<C< load >>) will create a simple ResizablePMCArray if no ManagedQueue exists. In this case, the entire request 
# is bundled up and placed in the RPA.

# This function creates a new ManagedQueue, processes the RPA, unpacks the registration bundles and inserts the
# calls according to the request in the bundle.

# Returns the new ManagedQueue.

	if ! Opcode::defined($queue) {
		$queue := ManagedQueue.new();
	}
	elsif $queue.isa('ResizablePMCArray') {
		my @rpa := $queue;
		$queue := ManagedQueue.new();
		
		while @rpa {
			my $item := @rpa.shift;
			my %opts := Opcode::isa($item, 'FixedPMCArray') ?? $item[1] !! $item.value;
			my $pair := %opts<pair>;
			$pair := make_pair($pair[0], $pair[1]);
			enqueue_pair($queue, $pair, %opts);
		}
	}
	
	return $queue;
}
