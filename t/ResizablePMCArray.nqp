=file t/ResizablePMCArray.nqp

Test the ResizablePMCArray component of the Kakapo library.

=cut

Kakapo::Test::ResizablePMCArray.run_all_tests;

module Kakapo::Test::ResizablePMCArray {

	Q:PIR { load_bytecode 'library/kakapo.pbc' };
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;	
		
		Parrot::IMPORT('Dumper', q<ASSERT DUMP DUMP_ NOTE>);
		Parrot::IMPORT('Matcher::Factory');
		
		my $class_name := 'Kakapo::Test::ResizablePMCArray';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Testcase',
		);	
	}

	method test_rpa_append() {
		
		self.note("Testing RPA.append() method");
		
		my @a1 := ResizablePMCArray::new(1, 2);
		my @a2 := ResizablePMCArray::new(3, 4);
		
		@a1.append(@a2);
		
		self.assert_that("The elements count", @a1.elements, is(4));
	}
	
	method test_rpa_clone() {
		
		self.note("Testing RPA.clone() method");
		
		my @strings := ResizablePMCArray::new('a', 'z');
		my @str2	:= @strings.clone;
		
		self.assert_that("The elements count", @str2.elements, is(@strings.elements));
		self.assert_that("Element 0", @str2[0], is('a'));
		self.assert_that("Element 1", @str2[1], is('z'));
		
		@strings[0] := 'x';
		self.assert_that("The element 0", @str2[0], is('a'));
		
		@strings.shift;
		self.assert_that("The elements count", @str2.elements, is(2));
	}
	
	method test_rpa_contains() {
		
		self.note("Testing RPA.contains() method");
		
		my @strings := ResizablePMCArray::new('a', 'b', 'c');
		self.assert_that("The array contains 'a'", @strings.contains('a'), is(true()));
		self.assert_that("The array contains 'c'", @strings.contains('c'), is(true()));
		self.assert_that("The array contains 'b'", @strings.contains('b'), is(true()));
		self.assert_that("The array contains 'A'", @strings.contains('A'), is(false()));
		self.assert_that("The array contains 'aa'", @strings.contains('aa'), is(false()));
		self.assert_that("The array contains 'd'", @strings.contains('aa'), is(false()));
		self.assert_that("The array contains ''", @strings.contains(''), is(false()));
	}
	
	method test_rpa_elements() {
	
		self.note("Testing RPA.elements() method");
		
		my @strings := ResizablePMCArray::new();
		self.assert_that("The elements count", @strings.elements, is(0));

		my $count := 0;
		for "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16".split(' ') {
			@strings.push($_);
			self.assert_that("The elements count", @strings.elements, is(+$_));
		}
		
	}
	
	method test_rpa_join() {
		
		self.note("Testing RPA.join() method");
		
		my @strings := ResizablePMCArray::new('foo', 1, 'cow');
		self.assert_that('The default join', @strings.join, is('foo1cow'));
		self.assert_that('Joining with spaces', @strings.join(' '), is('foo 1 cow'));
	}
	
	method test_rpa_new() {
		
		self.note("Testing RPA.new() class method");
		
		my @strings := ResizablePMCArray::new();
		self.assert_that("A new RSA", @strings, is(instance_of('ResizablePMCArray')));
		self.assert_that("A new RSA", @strings, is(empty()));
	
		@strings.push("foo");
		self.assert_that("The ResizablePMCArray", @strings, is(not(empty())));
		self.assert_that("The elements count", @strings.elements, is(1));
	
		@strings.push(1);
		self.assert_that("The elements count", @strings.elements, is(2));
		
		@strings := ResizablePMCArray::new('foo', 'bar', 'baz');
		self.assert_that("A new RSA", @strings, is(instance_of('ResizablePMCArray')));
		self.assert_that("The elements count", @strings.elements, is(3));
		self.assert_that("The 2nd element", @strings[1], is("bar"));
	}
}