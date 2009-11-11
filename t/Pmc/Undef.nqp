# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub main() {
	Kakapo::Test::Undef.run_tests();
}

module Kakapo;

sub library_name()		{ 'kakapo_test.pbc' }

module Kakapo::Test::Undef;
=module
Test cases for Kakapo's Undef add-in methods.
=end

Class::SUBCLASS('Kakapo::Test::Undef', 
	'Testcase');

Global::use('Matcher::Factory');

method test_defined() {
	self.assert_that('undef', Undef.new(), is(not(defined())));
}

method test_isa() {
	self.assert_that('undef isa Undef', Undef.new().isa('Undef'), is(true()));
	my $uninit;
	self.assert_that('An uninitialized variable isa Undef', $uninit.isa('Undef'), is(true()));
}
