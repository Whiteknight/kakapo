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

Program::initload(:after('Dumper', 'Global', 'Hash', 'ManagedQueue', 'Parrot'));

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

sub add_call($q, $name, $call, %opts) {
=sub	:INTERNAL
	Adds a C< $name > and C< $call > L< C< Pair > > to the given
	queue. Translates options into L< C< ManagedQueue > > 
	-compatible format.
=end

	my $pair := Pair.new($name, $call);
	
	if %opts<after>	{ $q.insert($pair, :after(%opts<after>)); }
	elsif %opts<before>	{ $q.insert($pair, :before(%opts<before>)); }
	elsif %opts<first>	{ $q.insert($pair, :first_out(1)); }
	else			{ $q.insert($pair, :last_out(1)); }
}

sub create_call_pair($name, $call, $caller_nsp, @sub_names) {
=sub	:INTERNAL
	Determines the name and sub D< call > to use for any of the various queue registration 
	routines. In general, these are called like C< init(:after('foo')) > or C< init('myinit') >. 
	(See L< C< at_end > > for the meaning of the various relative-positioning options.)
	
	Creates and returns a C< Pair > composed of the options, the resolved sub name or object, and a 
	C< name > key.
	
=param $caller_nsp
	 The C< $caller_nsp > is captured early and passed as a parameter only because capturing it 
	requires fiddling with lexical blocks.

=param %opts	
	The C< %opts > are as given to e.g., C< init >, and are checked for a C< :name > element. 
	If C< :name > is specified, this is used as the label for the call. Otherwise, the namespace
	of the caller is used. 
=end

	my @parts := $caller_nsp.get_name;
	@parts.shift;
	my $caller_nsp_name := @parts.join('::');
	my $label := $name ?? $name !! $caller_nsp_name;
	
	if $call.defined {
		if $call.isa('String') {
			if +$call.split('::') == 1 {
				$call := $label
			}
			else {
				$call := $caller_nsp_name ~ '::' ~ $call;
			}
		}
	}
	else {
		for @sub_names {
			if ! $call && $caller_nsp{~$_} {
				$call := $caller_nsp{~$_};
			}
		}
	}
	
	return Pair.new($label, $call);
}

sub add_call_bundle($queue, $call, %opts, $caller_nsp, *@sub_names) {
=sub	:INTERNAL
	Determines the name and sub D< call > to use for any of the various queue registration 
	routines. In general, these are called like C< init(:after('foo')) > or C< init('myinit') >. 
	(See L< C< at_end > > for the meaning of the various relative-positioning options.)
	
	Constructs a I< call bundle > composed of the options, the resolved sub name or object,
	and a C< name > key, and adds the bundle to the C< $queue>.
	
=param %opts	
	The C< %opts > are as given to e.g., C< init >, and are checked for a C< :name > element. 
	If C< :name > is specified, this is used as the label for the call. Otherwise, the namespace
	of the caller is used. 

=param $caller_nsp
	 The C< $caller_nsp > is captured early and passed as a parameter only because capturing it 
	requires fiddling with lexical blocks. 
=end

	my @parts := $caller_nsp.get_name;
	@parts.shift;
	my $caller_nsp_name := @parts.join('::');
	my $label := %opts<name> ?? %opts<name> !! $caller_nsp_name;

=param $call
	If C< $call > is a String, it is the name of a sub in the caller's namespace, or the qualified 
	name of another sub ('Foo::Bar::init'). A name like '::init' will resolve to the 'init' sub in 
	the root namespace. 

	It is a fatal error if C< $call > is not a String, and does not support either the .invoke() 
	method or the .invoke vtable op. 
=end

	if Parrot::defined($call) {
		if Parrot::isa($call, 'String') {
			if +$call.split('::') == 1 {
				$call := $label
			}
			else {
				$call := $caller_nsp_name ~ '::' ~ $call;
			}
		}
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
	
	%opts.delete(q<processed>);
	%opts<pair> := Pair.new($label, $call);
	my $bundle := Pair.new($label, %opts);
	
=param $queue
	A reference to a queue. The constructed bundle is added to the C< $queue >. Depending on
	the timing of the request, the queue may be a basic RPA, or a high-level object class. In general,
	the RPA is much more likely. Adding an init or load sub after processing has begun is unlikely.
=end

	if Parrot::isa($queue, 'ResizablePMCArray') {
		$queue.push($bundle);
	}
	else {
		$queue.insert($bundle);
	}	
}

sub at_end($name, $call, *%opts) {
=sub
	Registers a call to be made at the end of the program. When the 
	C< main > routine returns, or when user code calls C< 
	Program::exit >, the calls that have been registered with C< 
	at_end > are executed, in order. 

	The C< $name > is a string used to identify this registration, 
	for use with the C< :after > and C< :before > options. If a 
	call has been registered via: 

	=code	at_end('barney', &some_sub); 

	then another call may be enqueued using relative positioning: 

	=code	at_end('fred', &other_sub, :before('barney')); 

	The C< :first > and C< :last > options position the call 
	absolutely in the queue, but later C< :first > or C< :last > 
	registrations will override the position. 

	=for code
		at_end('barney', &b, :last);		# barney 
		at_end('fred', &f, :first);			# fred, barney 
		at_end('wilma', &w, :before('fred'));	# wilma, fred, barney 
		at_end('betty', &b, :after('wilma'));	# wilma, betty, fred, barney 
	
	By default, C< :last > is assumed. 

=end

	add_call($At_end_queue, $name, $call, %opts);
}

sub at_start($name, $call, *%opts) {
=sub
	Registers a call to be made before the start of the main program. 
	Just before the C<main> routine is called, the calls that 
	have been registered with C<at_start> are executed, in order. 

	See L< C< at_end > > for parameter interpretation. 
=end

	add_call($At_start_queue, $name, $call, %opts);
}

sub call($call) {
=sub	:INTERNAL
	Calls the Sub or MultiSub PMC passed as C<$call>, or, if C<$call> 
	is a String, looks up the named symbol and calls that.
=end

	if Parrot::isa($call, 'String') {
		$call := Parrot::get_hll_global($call);
	}
	
	if $call {
		return $call();
	}
	
	return my $undef;
}

sub call_main() {
=sub 
	Executes the calls registered in the L< C< at_start > > queue, then
	runs the C<main> sub registered via L< C< register_main > >. If the
	C<main> sub returns, the result is passed to L< C< exit > >.
=end

	process_queue($At_start_queue);
	
	my $result := call($Main);
	exit($result);
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
	the registered L< C< at_end > > calls.
=end

	Parrot::exit($result);
}

sub init($call?, *%opts) {
=sub
	Requests a call to the sub named by C< $call >, or to the sub object given in C< $call >, or
	to a default sub (named '_init' or '_initload') in the caller's namespace. The call will take
	place after all C< :init > subs in this library or program have been run. 
	
	This is used to implement ordering of startup code, so that e.g., modules that use a particular 
	class can defer global object initialization until the class is registered.
=end

	unless %opts { %opts := Hash::empty(); }
	unless $Init_queue { $Init_queue := Array::new(); }
	
	add_call_bundle($Init_queue, $call, %opts, Parrot::caller_namespace(2), '_init', '_initload');
}

sub initload($call?, *%opts) {
=sub 
	A shortcut routine. Equivalent to calling L< C< init > > and L< C< load > > with the same 
	arguments.
=end

	add_call($Init_queue, $call, %opts);
	add_call($Load_queue, $call, %opts);
}

sub _initload() {
=sub	:INTERNAL
	Called at init/load time. Sets up the various queues, and 
	registers the name C< main > in the root namespace as 
	the default main call. 
=end

	$At_end_queue	:= upgrade_queue($At_end_queue);
	$At_start_queue	:= upgrade_queue($At_start_queue);
	$Init_queue	:= upgrade_queue($Init_queue);
	$Load_queue	:= upgrade_queue($Load_queue);
	
	if ! Parrot::defined($Main) {
		$Main := '::main';
	}
}

sub load($name, $call, *%opts) {
=sub
	Requests a call to the sub named by C< $call >, or to the sub object given in C< $call >, or
	to a default sub (named '_load' or '_initload') in the caller's namespace. The call will take
	place after all C< :load > subs in this library or program have been run. 
	
	The purpose of this routine is analogous to that of L< C< init > >, except for the (very 
	significant!) difference between C< :init > and C< :load > processing. The argument values
	and semantics are identical to those of C< init >.
	
=end

	unless %opts { %opts := Hash::empty(); }
	unless $Load_queue { $Load_queue := Array::new(); }
	
	add_call_bundle($Load_queue, $call, %opts, Parrot::caller_namespace(2), '_load', '_initload');
}

sub process_init_queue() {
=sub
	Removes each registered I< call > from the C< :init > queue, and invokes them in order.
	If the queue is not already ordered according to the parameters given when the calls
	were registered, the queue is first reordered.
	
	See L< C< init > > for how to add items to the queue.

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
	}
}

sub process_queue($q) {
=sub	:INTERNAL
	Called to process any of the queues in this module. Pulls all of the calls out of the queue, in order, and invokes them.
=end

	while my &call := $q.next {
		call(&call);
	}
}

sub register_main($call) {
=sub
	Sets the C< main > function to call.
=end

	$Main := $call;
}

sub upgrade_queue($queue) {
=sub	:INTERNAL
	Upgrades a C< ResizablePMCArray >-based queue to a C< ManagedQueue >. 
	
	When Parrot loads bytecode, the ManagedQueue class has not been registered as a class, and so it is impossible to 
	make new ManagedQueue objects. Because there is no guarantee of the order that C< :init > and C< :load > methods
	are run, there is no way to ensure that ManagedQueue is registered before any other class tries to register a call.
	
	To deal with this uncertainty, the various registration functions (L< C< init > >, L< C< initload > >, and 
	L< C< load > >) will create a simple ResizablePMCArray if no ManagedQueue exists. In this case, the entire request 
	is bundled up and placed in the RPA.
	
	This function creates a new ManagedQueue, processes the RPA, unpacks the registration bundles and inserts the
	calls according to the request in the bundle.
	
	Returns the new ManagedQueue.
=end

	if ! Parrot::defined($queue) {
		$queue := ManagedQueue.new();
	}
	elsif $queue.isa('ResizablePMCArray') {
		my @rpa := $queue;
		$queue := ManagedQueue.new();
		
		while @rpa {
			my %opts := @rpa.shift.value;
			my $pair := %opts<pair>;
			
			add_call($queue, $pair, %opts);
		}
	}
	
	return $queue;
}

=for COPYRIGHT 
Copyright E<COPYRIGHT SIGN> 2009, Austin Hastings. 

=for LICENSE
Browse to http://www.opensource.org/licenses/artistic-license-2.0.php, or see the accompanying LICENSE file.
