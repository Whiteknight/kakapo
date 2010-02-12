# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub main() {
	Kakapo::Test::Class::Attributes.run_tests();
	Program::exit(0);
}

module Kakapo;
sub library_name()		{ 'kakapo_test.pbc' }

class Kakapo::Test::Class::Attributes
	is Testcase;

INIT {
	use(	'P6object');
	use(	'Matcher::Factory');
}

method Xtest_attribute_accessors() {
say("Test accessors");
	my $obj := Kakapo::Test::Aclass.new();

	$obj.a("apple");
	$obj.b("banana");
	
	say("Attributes set");
	self.assert_that('test object.a', $obj.a, is("apple"));
	self.assert_that('test object.b', $obj.b, is("banana"));
}

method test_initializer() {
	#my $obj := Kakapo::Test::Aclass.new(:a('albatross'), :b('byzantine'), :c('chrysanthemum'));
	my %named := Hash::new(:a('albatross'), :b('byzantine'));
	Dumper::DUMP_(%named);
	%named := Hash::empty();
	Dumper::DUMP_(%named);
	%named<a> := 'albatross';
	%named<b> := 'byzantine';
	Dumper::DUMP_(%named);
	my $obj := Parrot::call_method_(Kakapo::Test::Aclass, 'new', Array::empty(), %named);

	self.assert_that('test object.a', $obj.a, is("albatross"));
	self.assert_that('test object.b', $obj.b, is("byzantine"));
}

module Kakapo::Test::Aclass;

INIT {
	use(		'P6object');
	extends(	 'Kakapo::Object');
	has(		'b a');
}
