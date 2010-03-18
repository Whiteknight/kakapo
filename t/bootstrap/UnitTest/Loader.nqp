#! /usr/bin/env parrot-nqp
# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module bootstrap::UnitTest::Loader ;

INIT {
	# Load the Test::More library
	pir::load_language('parrot');
	pir::compreg__PS('parrot').import('Test::More');
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

MAIN();

sub MAIN() {	
	plan(1);

	our $Class_name := 'UnitTest::Loader';
	
	test_load_from_testcase();
}

sub make_one() {
	my $proto := Parrot::get_hll_global(our $Class_name);
	$proto.new();
}

class Dummy is UnitTest::Testcase {
	method test_foo() { 1; }
	method testSomething() { 2; }
	method test12() { 3; }
	method tests_are_groovy() { 4; } # not valid
	method this_is_a_test() { 5; } # no
	method detestation() { 6; } # no
}

sub test_load_from_testcase() {
	my $obj := make_one();
	my $dummy := Dummy.new();
	my $suite := $obj.load_tests_from_testcase($dummy);

	is($suite.num_tests, 3, 'Load from testcase: got right # of methods');
}