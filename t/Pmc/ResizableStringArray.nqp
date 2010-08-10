# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub main() {
	Kakapo::Test::ResizableStringArray.run_tests();
	Program::exit(0);
}

module Kakapo;

sub library_name()		{ 'kakapo_test.pbc' }

module Kakapo::Test::ResizableStringArray;
=module
Test cases for Kakapo's Undef add-in methods.
=end

Class::SUBCLASS('Kakapo::Test::ResizableStringArray', 
	'Testcase');

Global::use('Matcher::Factory');	# is(), not(), etc.

method test_rsa_append() {
	
	self.note("Testing RSA.append() method");
	
	my @strings := ResizableStringArray.new('a', 'b');
	my @extras := ResizableStringArray.new('c', 'd', 'e');
	
	self.assert_that("The elements count", @strings.elems, is(2));
	
	@strings.append(@extras);
	
	self.assert_that("The elements count", @strings.elems, is(5));
	self.assert_that("Element 0", @strings[0], is('a'));
	self.assert_that("Element 1", @strings[1], is('b'));
	self.assert_that("Element 2", @strings[2], is('c'));
	self.assert_that("Element 3", @strings[3], is('d'));
	self.assert_that("Element 4", @strings[4], is('e'));
	
	@strings := ResizableStringArray.new();
	self.assert_that("The elements count", @strings.elems, is(0));
	
	my $ary := (0, 1, 2);
	@strings.append( $ary );
	self.assert_that("The elements count", @strings.elems, is(3));
	
	@strings.append( Array.new('dog', 'cow'));
	self.assert_that("The elements count", @strings.elems, is(5));
}

method test_rsa_clone() {
	
	self.note("Testing RSA.clone() method");
	
	my @strings := ResizableStringArray.new('a', 'z');
	my @str2	:= @strings.clone;
	
	self.assert_that("The elements count", @str2.elems, is(@strings.elems));
	self.assert_that("Element 0", @str2[0], is('a'));
	self.assert_that("Element 1", @str2[1], is('z'));
	
	@strings[0] := 'x';
	self.assert_that("The element 0", @str2[0], is('a'));
	
	@strings.shift;
	self.assert_that("The elements count", @str2.elems, is(2));
}

method test_rsa_contains() {
	
	self.note("Testing RSA.contains() method");
	
	my @strings := ResizableStringArray.new('a', 'b', 'c');
	self.assert_that("The array contains 'a'", @strings.contains('a'), is(true()));
	self.assert_that("The array contains 'c'", @strings.contains('c'), is(true()));
	self.assert_that("The array contains 'b'", @strings.contains('b'), is(true()));
	self.assert_that("The array contains 'A'", @strings.contains('A'), is(false()));
	self.assert_that("The array contains 'aa'", @strings.contains('aa'), is(false()));
	self.assert_that("The array contains 'd'", @strings.contains('aa'), is(false()));
	self.assert_that("The array contains ''", @strings.contains(''), is(false()));
}

method test_rsa_elements() {

	self.note("Testing RSA.elems() method");
	
	my @strings := ResizableStringArray.new();
	self.assert_that("The elements count", @strings.elems, is(0));

	my $count := 0;
	for "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16".split(' ') {
		@strings.push($_);
		self.assert_that("The elements count", @strings.elems, is(+$_));
	}
	
}

method test_rsa_join() {
	
	self.note("Testing RSA.join() method");
	
	my @strings := ResizableStringArray.new('foo', 1, 'cow');
	self.assert_that('The default join', @strings.join, is('foo1cow'));
	self.assert_that('Joining with spaces', @strings.join(' '), is('foo 1 cow'));
}

method test_rsa_new() {
	
	self.note("Testing RSA.new() class method");
	
	my @strings := ResizableStringArray.new();
	self.assert_that("A new RSA", @strings, is(instance_of('ResizableStringArray')));
	self.assert_that("A new RSA", @strings, is(empty()));

	@strings := ResizableStringArray.new("foo");
	self.assert_that("A new RSA", @strings, is(instance_of('ResizableStringArray')));
	self.assert_that("The ResizableStringArray", @strings, is(not(empty())));
	self.assert_that("The elements count", @strings.elems, is(1));	
}
