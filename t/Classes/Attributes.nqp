# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub main() {
	Kakapo::Test::Class::Attributes.run_tests();
	Program::exit(0);
}

module Kakapo;

sub library_name()		{ 'kakapo_test.pbc' }

module Kakapo::Test::Class::Attributes;

Global::use(	'P6object');

extends(	'Testcase');

Global::use(	'Matcher::Factory');

method test_attribute_accessors() {
	my $obj := Kakapo::Test::Aclass.new();

	$obj.a("apple");
	$obj.b("banana");
	
	self.assert_that('test object.a', $obj.a, is("apple"));
	self.assert_that('test object.b', $obj.b, is("banana"));
}

method test_initializer() {
	my $obj := Kakapo::Test::Aclass.new(:a('albatross'), :b('byzantine'));

	# Doesn't work because of wrong 'new' method.
#	assert_that($obj.a, is("albatross"));
#	assert_that($obj.b, is("byzantine"));
}


class Kakapo::Test::Aclass;

Global::use(	'P6object');

has('b a');
