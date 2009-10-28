=file t/Undef.nqp

Tests for the Undef module.

=end

sub main() {
	say("Test-undef main");
	Kakapo::Test::Undef.run_all_tests;
	# Kakapo::Test::Undef.run_tests('test_insert');
}
	
module Kakapo::Test::Undef;

say("KTUndef initload");
Global::use(Dumper);
DUMP_(Matcher::Factory);
Global::use('Matcher::Factory');
DUMP_(Kakapo::Test::Undef);

my $class_name := 'Kakapo::Test::Undef';

NOTE("Creating class ", $class_name);
Class::SUBCLASS($class_name,
	'Testcase',
);

method test_isa() {
	
	self.note("Testing Undef.isa method.");
	
	my $undef;
	
	self.assert_that("Undef object", $undef, is(not(defined())));
	self.assert_that("Opcode::defined(undef)", Opcode::defined($undef), is(false()));
	self.assert_that("Undef.defined", $undef.defined, is(false()));
	self.assert_that("Undef.isa(Undef)", $undef.isa('Undef'), is(true()));
}