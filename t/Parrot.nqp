module Kakapo::Test::Parrot;

Q:PIR { load_bytecode 'library/kakapo.pbc' };

_ONLOAD();

#Opcode::load_bytecode('src/Parrot.pbc');

Kakapo::Test::Parrot.run_all_tests;

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;	
	
	Global::use('Dumper');
	Parrot::IMPORT('Matcher::Factory');
	
	my $class_name := 'Kakapo::Test::Parrot';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Testcase',
	);	
}

method test_defined() {
	
	self.note("Testing Opcode::defined()");
	
	my $one := 1;
	my $zero := 0;
	my $empty := '';
	my $nonempty := 'foo';
	my $undef;
	my @empty := Array::empty();
	my %empty := Hash::empty();
	
	self.assert_that('defined(1)', Opcode::defined($one), returns(true()));
	self.assert_that('defined(0)', Opcode::defined($zero), returns(true()));
	self.assert_that('defined(q<>)', Opcode::defined($empty), returns(true()));
	self.assert_that('defined("foo")', Opcode::defined($nonempty), returns(true()));
	self.assert_that('defined(undef)', Opcode::defined($undef), returns(false()));
	self.assert_that('defined(null)', Opcode::defined(Bogus::symbol), returns(false()));
	self.assert_that('defined(@())', Opcode::defined(@empty), returns(true()));
	self.assert_that('defined(%())', Opcode::defined(%empty), returns(true()));
}

method test_get_hll_global() {

	self.note("Testing Opcode::get_hll_global()");

	self.assert_that("get_hll_global(foo)", Opcode::get_hll_global('Xyzzy::foo'), is(same_as(Xyzzy::foo)));
	
	our $Test;
	$Test := 'gee';
	self.assert_that("Global $Test", $Test, is('gee'));
	self.assert_that("get_hll_global($Test)", Opcode::get_hll_global('Kakapo::Test::Parrot::$Test'),
		returns('gee'));
	$Test := 'piow';
	self.assert_that("get_hll_global($Test)", Opcode::get_hll_global('Kakapo::Test::Parrot::$Test'),
		returns('piow'));
}

method test_get_sub() {

	self.note("Testing Parrot::get_sub()");

	self.assert_that("get_sub(foo)", Parrot::get_sub('Xyzzy::foo'), is(same_as(Xyzzy::foo)));
}

method test_import() {

	self.note("Testing Parrot::IMPORT()");

	self.assert_that("Remote symbol 'foo'", Xyzzy::foo, is(defined()));
	self.assert_that("Local symbol 'foo'", Kakapo::Test::Parrot::foo, is(not(defined())));
	
	Parrot::IMPORT('Xyzzy');
	
	self.assert_that("Local symbol 'foo'", Kakapo::Test::Parrot::foo, is(defined()));
	self.assert_that("Symbol 'foo'", Kakapo::Test::Parrot::foo, is(same_as(Xyzzy::foo)));
}

method test_is_null() {

	self.note("Testing Opcode::isnull()");

	my $one := 1;
	my $zero := 0;
	my $empty := '';
	my $nonempty := 'foo';
	my $undef;
	my @empty := Array::empty();
	my %empty := Hash::empty();
	
	self.assert_that('is_null(1)', Opcode::isnull($one), returns(false()));
	self.assert_that('is_null(0)', Opcode::isnull($zero), returns(false()));
	self.assert_that('is_null(q<>)', Opcode::isnull($empty), returns(false()));
	self.assert_that('is_null(undef)', Opcode::isnull($undef), returns(false()));
	self.assert_that('is_null(null)', Opcode::isnull(Bogus::symbol), returns(true()));
	self.assert_that('is_null(@())', Opcode::isnull(@empty), returns(false()));
	self.assert_that('is_null(%())', Opcode::isnull(%empty), returns(false()));
}

module Xyzzy {
	sub foo() {
		return 'foo';
	}
}
		
