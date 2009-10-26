=file t/Undef.nqp

Tests for the Undef module.

=end

module Kakapo::Test::Undef;

Q:PIR { load_bytecode 'library/kakapo.pbc' };

_ONLOAD();

Kakapo::Test::Undef.run_all_tests;
#Kakapo::Test::Undef.run_tests('test_insert');

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	Parrot::IMPORT('Dumper', q<ASSERT DUMP DUMP_ NOTE>);
	Parrot::IMPORT('Matcher::Factory');
	
	my $class_name := 'Kakapo::Test::Undef';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Testcase',
	);	
}

method test_isa() {
	
	self.note("Testing Undef.isa method.");
	
	my $undef;
	
	self.assert_that("Undef object", $undef, is(not(defined)));
	self.assert_that("Parrot::defined(undef)", Parrot::defined($undef), is(false()));
	self.assert_that("Undef.defined", $undef.defined, is(false()));
	self.assert_that("Undef.isa(Undef)", $undef.isa('Undef'), is(true()));
}