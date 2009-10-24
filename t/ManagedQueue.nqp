=file t/ManagedQueue.nqp

Test the ManagedQueue component of the Kakapo library.

=cut

module Kakapo::Test::ManagedQueue;

Q:PIR { load_bytecode 'library/kakapo.pbc' };

_ONLOAD();

#Kakapo::Test::ManagedQueue.run_all_tests;
Kakapo::Test::ManagedQueue.run_tests('test_insert');

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	Parrot::IMPORT('Dumper', q<ASSERT DUMP DUMP_ NOTE>);
	Parrot::IMPORT('Matcher::Factory');
	
	my $class_name := 'Kakapo::Test::ManagedQueue';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Testcase',
	);	
}

method test_contains() {
		
	self.note("Testing MQ.contains() method");
	
	my $q := ManagedQueue.new(1, 2, 'a', 4);
	
	self.assert_that("contains 1", $q.contains(1), is(true()));
	self.assert_that("contains 3", $q.contains(3), is(false()));
	self.assert_that("contains 'a'", $q.contains('a'), is(true()));
}

method test_delete() {
		
	self.note("Testing MQ.delete() method");
	
	my $q := ManagedQueue.new(1, 2, 'a', 4);
	
	self.assert_that("index of 1", $q.index_of(1), is(0));
	self.assert_that("index of 'a'", $q.index_of('a'), is(2));

	$q.delete(1);

	self.assert_that("index of 1", $q.index_of(1), is(-1));
	self.assert_that("index of 'a'", $q.index_of('a'), is(1));
	self.assert_that("index of 4", $q.index_of(4), is(2));
	
	$q.delete(4);
	
	self.assert_that("index of 'a'", $q.index_of('a'), is(1));
	self.assert_that("index of 4", $q.index_of(4), is(-1));
}

method test_index_of() {
		
	self.note("Testing MQ.index_of() method");
	
	my $q := ManagedQueue.new('a', 'b', 'c');

	self.assert_that("index of a", $q.index_of('a'), is(0));
	self.assert_that("index of b", $q.index_of('b'), is(1));
	self.assert_that("index of c", $q.index_of('c'), is(2));
	self.assert_that("index of d", $q.index_of('d'), is(-1));
	self.assert_that("index of ''", $q.index_of(''), is(-1));
	self.assert_that("index_of aa", $q.index_of('aa'), is(-1));	
	
	$q := ManagedQueue.new(1, 2, -1);
	self.assert_that("index of 1", $q.index_of(1), is(0));
	self.assert_that("index of 2", $q.index_of(2), is(1));
	self.assert_that("index of -1", $q.index_of(-1), is(2));
	self.assert_that("index of 0", $q.index_of(0), is(-1));	
}

method test_insert() {
		
	self.note("Testing MQ.insert() method");
	
	my $q := ManagedQueue.new(1, 5, 9);

	self.assert_that("#elements", $q.elements, is(3));
	self.assert_that("index of 5", $q.index_of(5), is(1));
	
	self.assert_that("index of 'y'", $q.index_of('y'), is(-1));
	$q.insert('y');
	self.assert_that("index of 'y'", $q.index_of('y'), is(3));
	
	self.assert_that("index of 'a'", $q.index_of('a'), is(-1));
	$q.insert('a', :first_out(1));
	self.assert_that("#elements", $q.elements, is(5));
	self.assert_that("index of 'a'", $q.index_of('a'), is(0));
	
	self.assert_that("index of 'f'", $q.index_of('f'), is(-1));
	$q.insert('f', :before(5));
	self.assert_that("index of 'f'", $q.index_of('f'), is(2));
	
	self.assert_that("mq contains p", $q.contains('p'), is(false()));
	$q.insert('p', :after(5));
	self.assert_that("index of 'p'", $q.index_of('p'), is(4));
	
	self.assert_that("mq contains r", $q.contains('r'), is(false()));
	$q.insert('r', :before(9));
	self.assert_that("index of 'r'", $q.index_of('r'), is(5));
	
	self.assert_that("mq contains z",$q.contains('z'), is(false()));
	$q.insert('z', :last_out(1));
	self.assert_that("index of 'z'", $q.index_of('z'), is(8));
}

method test_new() {
		
	self.note("Testing MQ.new() class method");
	
	my $q := ManagedQueue.new();
	self.assert_that("A new MQ", $q, is(instance_of('ManagedQueue')));
	self.assert_that("The element count", $q.queue.elements, is(0));
	self.assert_that("The .elements count", $q.elements, is(0));
	self.assert_that("The new MQ", $q, is(empty()));
	
	my $p := ManagedQueue.new('a', 1);
	self.assert_that("A new MQ", $p, is(instance_of('ManagedQueue')));
	self.assert_that("The element count", $p.queue.elements, is(2));
	self.assert_that("The .elements count", $p.elements, is(2));
	self.assert_that("The new MQ", $p, is(not(empty())));
}
	
	