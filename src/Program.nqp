# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Program;
=module

Provides a conventional framework for program execution. 

=end

# Don't initialize *anything,* here.   !IMPORTANT
our $At_end_queue;
our $At_start_queue;
our $Init_queue;
our $Load_queue;
our $Main;
our $Processing_init_queue;
our $Processing_load_queue;

if ! Opcode::defined($Main) {
	$Main := 'main';
}

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
			Program::exit(0);
		}
		
		say("Hello, world!");
	}
	
	sub finalize() {
		say("Hasta la vista, baby.");
	}
	
=end SYNOPSIS

sub add_call($queue, $call, %opts, $caller_nsp, *@sub_names) {
=sub	:INTERNAL
	Constructs a I< call > registration and adds it to the given C< $queue >. See 
	L<C< create_call_pair >> and L<C< enqueue_pair >> for parameter details.
=end

	my $call_pair := create_call_pair($call, %opts<name>, $caller_nsp, @sub_names);
	enqueue_pair($queue, $call_pair, %opts);
}

sub at_end($call, *%opts) {
=sub
	Registers a call to be made at the end of the program. When the C< main > routine returns, or 
	when user code calls C< Program::exit >, the calls that have been registered with C< at_end > 
	are executed, in order. 

	The C< :name > is a string used to identify this registration, for use with the C< :after > and 
	C< :before > options. If no name is provided, the stringification of C< $call > will be used. 
	If a call has been registered via: 

	=code	at_end('barney');	# calls local sub &barney at end.

	then another call may be enqueued using relative positioning: 

	=code	at_end('fred', :before('barney'));

	The C< :first > and C< :last > options position the call absolutely in the queue, but later 
	C< :first > or C< :last > registrations will override the position. 

	=for code
		at_end('barney', :last);	# barney 
		at_end('fred' :first);		# fred, barney 
		at_end('wilma' :before('fred'));	# wilma, fred, barney 
		at_end('betty' :after('wilma'));	# wilma, betty, fred, barney 
	
	By default, C< :last > is assumed. 
=end

	unless %opts { %opts := Hash::empty(); }
	unless $At_end_queue { $At_end_queue := Array::new(); }
	unless %opts<name> { %opts<name> := ~ $call; }
	my $caller_nsp := Parrot::caller_namespace(2);
	add_call($At_end_queue, $call, %opts, $caller_nsp);
}

sub at_start($call, *%opts) {
=sub
	Registers a call to be made before the start of the main program. 
	Just before the C<main> routine is called, the calls that 
	have been registered with C<at_start> are executed, in order. 

	See L<C< at_end >> for parameter interpretation. 
=end

	unless %opts { %opts := Hash::empty(); }
	unless $At_start_queue { $At_start_queue := Array::new(); }
	unless %opts<name> { %opts<name> := ~ $call; }
	my $caller_nsp := Parrot::caller_namespace(2);
	add_call($At_start_queue, $call, %opts, $caller_nsp);
}

sub call($call) {
=sub	:INTERNAL
	Calls the Sub or MultiSub PMC passed as C<$call>, or, if C<$call> 
	is a String, looks up the named symbol and calls that.
=end

	if Opcode::isa($call, 'String') {
		$call := Opcode::get_hll_global($call);
	}
	
	if $call {
		return $call();
	}
	
	return my $undef;
}

sub call_main() {
=sub 
	Executes the calls registered in the L<C< at_start >> queue, then
	runs the C<main> sub registered via L<C< register_main >>. If the
	C<main> sub returns, the result is passed to L<C< exit >>.
=end

	process_queue($At_start_queue);

	my $result := call($Main);
	exit($result);
}

sub create_call_pair($call, $name, $caller_nsp, @sub_names) {
=sub	:INTERNAL
	Determines the name and sub D< call pair > to use for any of the various queue registration 
	routines. In general, these are called like C< init(:after('foo')) > or C< init('myinit') >.  (See 
	L<C< at_end >> for the meaning of the various relative-positioning options.)
	
	Creates and returns a C< Pair > composed of the options, the resolved sub name or object, and a 
	C< name > key.
	
=param $caller_nsp
	The namespace name is used as the default key for the call pair, unless a C< $name > is defined. 
	Likewise, bare sub names in C< $call > are qualified with the namespace name.
=end

	my @parts := $caller_nsp.get_name;
	@parts.shift;
	my $caller_nsp_name := @parts.join('::');
	my $label := $name ?? $name !! $caller_nsp_name;
	
	if $call.defined {
		if $call.isa('String') {
			if +$call.split('::') == 1 {
				$call := $label ~ '::' ~ $call;
			}
		}
		# else, it must be a *Sub, or something invokable.
	}
	else {
=param @sub_names
	The C< @sub_names > are a list of possible default names to call. If a module calls 
	C< init() >, the C< @sub_names > will generally be 'init' and 'initload'. 
=end	

		for @sub_names {
			if ! $call && $caller_nsp{~$_} {
				$call := $caller_nsp{~$_};
			}
		}
	}

	return make_pair($label, $call);
}

sub enqueue_pair($queue, $pair, %opts) {
=sub	:INTERNAL
	Adds a I< call pair > to the given queue. If the given C< $queue > is not upgraded, creates a delayed 
	registration bundle with C< $pair > and C< %opts > and enqueues that, instead. If C< $queue > is
	upgraded, translates the C< %opts > into L<C< ManagedQueue >>-compatible args.
=end

	if is_upgraded($queue) {
		if %opts<after>	{ $queue.insert($pair, :after(%opts<after>)); }
		elsif %opts<before> { $queue.insert($pair, :before(%opts<before>)); }
		elsif %opts<first>	{ $queue.insert($pair, :first_out(1)); }
		else			{ $queue.insert($pair, :last_out(1)); }
	}
	else {
		%opts<pair> := $pair;
		my $key := Opcode::isa($pair, 'FixedPMCArray') ?? $pair[0] !! $pair.key;
		my $bundle := make_pair($key, %opts);
		$queue.push($bundle);
	}
}

sub exit($result) {
=sub 
	Exits the program, makes any calls registered with L<C<at_end>>, and 
	causes the Parrot interpreter to exit with status C<$result>.
=end

	process_queue($At_end_queue);
	_exit($result);
}

sub _exit($result) {
=sub
	Immediately exits the Parrot VM, returning C<$result>, without calling any of 
	the registered L<C< at_end >> calls.
=end

	Opcode::exit($result);
}

sub init($call?, *%opts) {
=sub
	Requests a call to the sub named by C< $call >, or to the sub object given in C< $call >, or
	to a default sub (named '_init' or '_initload') in the caller's namespace. The call will take
	place after all C< :init > subs in this library or program have been run. 
	
	This is used to implement ordering of startup code, so that e.g., modules that use a particular 
	class can defer global object initialization until the class is registered.
=end

	init_($call, %opts, Parrot::caller_namespace(2));
}

sub init_($call, %opts, $caller_nsp) {
=sub	:INTERNAL
	Internal version of C< init >, callable with slurped args.
=end

	unless %opts { %opts := Hash::empty(); }
	unless $Init_queue { $Init_queue := Array::new(); }
	
	add_call($Init_queue, $call, %opts, $caller_nsp, '_init', '_initload');
}

sub initload($call?, *%opts) {
=sub 
	A shortcut routine. Equivalent to calling L<C< init >> and L<C< load >> with the same arguments.
=end

	my $caller_nsp := Parrot::caller_namespace(2);
	init_($call, %opts, $caller_nsp);
	load_($call, %opts, $caller_nsp);
}

sub is_upgraded($queue) {
	return $queue.isa('ManagedQueue');
}

sub load($call, *%opts) {
=sub
	Requests a call to the sub named by C< $call >, or to the sub object given in C< $call >, or
	to a default sub (named '_load' or '_initload') in the caller's namespace. The call will take
	place after all C< :load > subs in this library or program have been run. 
	
	The purpose of this routine is analogous to that of L<C< init >>, except for the (very 
	significant!) difference between C< :init > and C< :load > processing. The argument values
	and semantics are identical to those of C< init >.
	
=end

	load_($call, %opts, Parrot::caller_namespace(2));
}

sub load_($call, %opts, $caller_nsp) {
=sub	:INTERNAL
	Internal version of C< load >, callable with slurped args.
=end

	unless %opts { %opts := Hash::empty(); }
	unless $Load_queue { $Load_queue := Array::new(); }
	
	add_call($Load_queue, $call, %opts, $caller_nsp, '_load', '_initload');
}

sub make_pair($key, $value) {
=sub	:INTERNAL
	Tries to make a L<C< Pair >> object out of C< $key >, and C< $value >. If class C< Pair > is 
	not ready yet, makes a FixedPMCArray[2], instead.
=end
	
	if Opcode::isa(LimitedPair, 'NameSpace') {		
		my $pair := Opcode::new('FixedPMCArray');
		Opcode::set_integer($pair, 2);
		$pair[0] := $key;
		$pair[1] := $value;
		return $pair;
	}
	else {
		return LimitedPair.new($key, $value);
	}
}

sub process_init_queue() {
=sub
	Removes each registered I< call > from the C< :init > queue, and invokes them in order.
	If the queue is not already ordered according to the parameters given when the calls
	were registered, the queue is first reordered.
	
	See L<C< init >> for how to add items to the queue.

	Returns nothing.
=end

	unless $Processing_init_queue {
		$Processing_init_queue := 1;

		if $Init_queue.isa('ResizablePMCArray') {

			$Init_queue := upgrade_queue($Init_queue);
		}

		process_queue($Init_queue);
	}
}

sub process_load_queue() {
=sub
	Process the C<:load> queue. See L< process_init_queue >.
=end

	unless $Processing_load_queue {
		$Processing_load_queue := 1;
	
		if $Load_queue.isa('ResizablePMCArray') {
			$Load_queue := upgrade_queue($Load_queue);
		}
	
		process_queue($Load_queue);
say("process-load-q: done");
Dumper::DUMP_($Load_queue);
	}
}

sub process_queue($q) {
=sub	:INTERNAL
	Called to process any of the queues in this module. Pulls all of the calls out of the queue, in order, and invokes them.
=end

Dumper::DUMP_($q);
	if Opcode::defined($q) {
		while $q.elements {
			my &call := $q.next;
			call(&call);
		}
	}
}

sub register_main($call) {
=sub
	Sets the C< main > function to call.
=end

	if Opcode::defined($call) {
		$Main := $call;
	}
}

sub upgrade_queue($queue) {
=sub	:INTERNAL
	Upgrades a C< ResizablePMCArray >-based queue to a C< ManagedQueue >. 
	
	When Parrot loads bytecode, the ManagedQueue class has not been registered as a class, and so it is impossible to 
	make new ManagedQueue objects. Because there is no guarantee of the order that C< :init > and C< :load > methods
	are run, there is no way to ensure that ManagedQueue is registered before any other class tries to register a call.
	
	To deal with this uncertainty, the various registration functions (L<C< init >>, L<C< initload >>, and 
	L<C< load >>) will create a simple ResizablePMCArray if no ManagedQueue exists. In this case, the entire request 
	is bundled up and placed in the RPA.
	
	This function creates a new ManagedQueue, processes the RPA, unpacks the registration bundles and inserts the
	calls according to the request in the bundle.
	
	Returns the new ManagedQueue.
=end

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
