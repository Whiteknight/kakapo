# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub main() {
	Kakapo::Test::ResizablePMCArray.run_tests();
	Program::exit(0);
}

module Kakapo;

sub library_name()		{ 'kakapo_test.pbc' }

module Kakapo::Test::ResizablePMCArray;
=module
Test cases for Kakapo's Undef add-in methods.
=end

Class::SUBCLASS('Kakapo::Test::ResizablePMCArray', 
	'Testcase');

Global::use('Matcher::Factory');	# is(), not(), etc.


our method test_rpa_append() {
	
	self.note("Testing RPA.append() method");
	
	my @a1 := ResizablePMCArray.new(1, 2);
	my @a2 := ResizablePMCArray.new(3, 4);
	
	@a1.append(@a2);
	
	self.assert_that("The elements count", @a1.elems, is(4));
}

our method test_rpa_clone() {
	
	self.note("Testing RPA.clone() method");
	
	my @strings := ResizablePMCArray.new('a', 'z');
	my @str2	:= @strings.clone;
	
	self.assert_that("The elements count", @str2.elems, is(@strings.elems));
	self.assert_that("Element 0", @str2[0], is('a'));
	self.assert_that("Element 1", @str2[1], is('z'));
	
	@strings[0] := 'x';
	self.assert_that("The element 0", @str2[0], is('a'));
	
	@strings.shift;
	self.assert_that("The elements count", @str2.elems, is(2));
}

our method test_rpa_contains() {
	
	self.note("Testing RPA.contains() method");
	
	my @strings := ResizablePMCArray.new('a', 'b', 'c');
	self.assert_that("The array contains 'a'", @strings.contains('a'), is(true()));
	self.assert_that("The array contains 'c'", @strings.contains('c'), is(true()));
	self.assert_that("The array contains 'b'", @strings.contains('b'), is(true()));
	self.assert_that("The array contains 'A'", @strings.contains('A'), is(false()));
	self.assert_that("The array contains 'aa'", @strings.contains('aa'), is(false()));
	self.assert_that("The array contains 'd'", @strings.contains('aa'), is(false()));
	self.assert_that("The array contains ''", @strings.contains(''), is(false()));
}

our method test_rpa_elements() {

	self.note("Testing RPA.elems() method");
	
	my @strings := ResizablePMCArray.new();
	self.assert_that("The elements count", @strings.elems, is(0));

	my $count := 0;
	for "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16".split(' ') {
		@strings.push($_);
		self.assert_that("The elements count", @strings.elems, is(+$_));
	}
	
}

our method test_rpa_join() {
	
	self.note("Testing RPA.join() method");
	
	my @strings := ResizablePMCArray.new('foo', 1, 'cow');
	self.assert_that('The default join', @strings.join, is('foo1cow'));
	self.assert_that('Joining with spaces', @strings.join(' '), is('foo 1 cow'));
}

our method test_rpa_new() {
	
	self.note("Testing RPA.new() class method");
	
	my @strings := ResizablePMCArray.new();
	self.assert_that("A new RPA", @strings, is(instance_of('ResizablePMCArray')));
	self.assert_that("A new RPA", @strings, is(empty()));

	@strings.push("foo");
	self.assert_that("The ResizablePMCArray", @strings, is(not(empty())));
	self.assert_that("The elements count", @strings.elems, is(1));

	@strings.push(1);
	self.assert_that("The elements count", @strings.elems, is(2));
	
	@strings := ResizablePMCArray.new('foo', 'bar', 'baz');
	self.assert_that("A new RPA", @strings, is(instance_of('ResizablePMCArray')));
	self.assert_that("The elements count", @strings.elems, is(3));
	self.assert_that("The 2nd element", @strings[1], is("bar"));
}