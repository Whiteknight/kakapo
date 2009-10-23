=file t/Array.nqp

Test the Array component of the Kakapo library.

=cut

Kakapo::Test::Array.run_all_tests;

module Kakapo::Test::Array {

	Q:PIR { load_bytecode 'library/kakapo.pbc' };

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;	
		
		Parrot::IMPORT('Dumper', q<ASSERT DUMP DUMP_ NOTE>);
		Parrot::IMPORT('Matcher::Factory');
		
		my $class_name := 'Kakapo::Test::Array';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Testcase',
		);	
	}

	method test_rsa_elements() {
	
		self.note("Testing .elements() method");
		
		my @strings := ResizableStringArray::new();
		self.assert_that("The elements count", @strings.elements, is(0));

		my $count := 0;
		for "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16".split(' ') {
			@strings.push($_);
			self.assert_that("The elements count", @strings.elements, is(+$_));
		}
		
	}
	
	method test_rsa_join() {
		
		self.note("Testing .join() method");
		
		my @strings := ResizableStringArray::new('foo', 1, 'cow');
		self.assert_that('The default join', @strings.join, is('foo1cow'));
		self.assert_that('Joining with spaces', @strings.join(' '), is('foo 1 cow'));
	}
	
	method test_rsa_new() {
		
		self.note("Testing .new() class method");
		
		my @strings := ResizableStringArray::new();
		self.assert_that("A new RSA", @strings, is(instance_of('ResizableStringArray')));
		self.assert_that("A new RSA", @strings, is(empty()));
	
		@strings.push("foo");
		self.assert_that("The array", @strings, is(not(empty())));
		self.assert_that("The elements count", @strings.elements, is(1));
	
		@strings.push(1);
		self.assert_that("The elements count", @strings.elements, is(2));
		
		@strings := ResizableStringArray::new('foo', 'bar', 'baz');
		self.assert_that("A new RSA", @strings, is(instance_of('ResizableStringArray')));
		self.assert_that("The elements count", @strings.elements, is(3));
		self.assert_that("The 2nd element", @strings[1], is("bar"));
	}
}