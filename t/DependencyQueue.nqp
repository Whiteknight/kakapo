#! parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::DependencyQueue
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	

	has(	'$.queue');
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

our method set_up() {
	self.queue(DependencyQueue.new);
}
	
our method test_add_entry_simple() {
	verify_that( 'add_entry puts new objects in queue' );
	
	self.queue.add_entry('apple', 1);
	
	fail_if(self.queue.is_empty, 'Queue with 1 entry is not empty');
}

our method test_add_entry_done() {
	verify_that( 'add entry does nothing when entry already marked done' );
	
	self.queue.mark_as_done('already_done');
	fail_unless(self.queue.is_empty, 'Marking done does not add entries');
	
	self.queue.add_entry('already_done', 1);
	fail("Not reached");
	
	my $exception;
	CATCH {
		$exception := $!;
	}
	
	fail_unless($exception.type == Exception::DependencyQueue::AlreadyDone.type,
		'Expect dq exception');
}

our method test_add_entry_pending() {
	verify_that( 'add entry does nothing when entry already pending' );
	
	self.queue.add_entry('addison', 1, 'baker');
	self.queue.add_entry('addison', 0, 'charlie');
	
	fail_unless(self.queue.pending<addison>[2] ne 'charlie',
		"Adding a second time should update dependencies");
}

our method test_new_queue_is_empty() {
	my $dq := DependencyQueue.new();
	fail_unless($dq.is_empty, 'New dq should be empty');
	fail_if($dq.locked, 'New dq should be unlocked');
}

our method test_ctor_args_marked_done() {	
	my $dq := DependencyQueue.new('alpha', 'beta');
	fail_unless($dq.is_empty, 'New dq should be empty');
	fail_if($dq.locked, 'New dq should be unlocked');
	fail_unless($dq.already_done<alpha> && $dq.already_done<beta>,
		'Ctor should mark positional args as done');
}

our method test_order() {
	verify_that( 'next() returns entries in dependency order' );

	self.queue.add_entry('Alpha', 'apple');
	self.queue.add_entry('Bravo', 'banana', :requires('Alpha', 'Delta'));
	self.queue.add_entry('Charlie', 'cranberry', :requires('Bravo', 'Delta'));
	self.queue.add_entry('Delta', 'durian', :requires('Alpha'));
	self.queue.add_entry('Echo', 'elderberry', :requires('Charlie'));
	
	for <apple durian banana cranberry elderberry> {
		my $entry := self.queue.next_entry;
		fail_unless($entry eq ~$_, 'Got entry $_ out-of-order');
	}
	
	fail_unless(self.queue.is_empty, 'Queue should be empty');
}