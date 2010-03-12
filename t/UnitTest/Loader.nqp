#! /usr/bin/env parrot-nqp
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::UnitTest::Loader
	is UnitTest::Testcase ;

has	$!loader;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;
	

method set_up() {
	$!loader := UnitTest::Loader.new;
}

method test_load_tests_from_testcase() {
	my $suite := $!loader.load_tests_from_testcase(
		Test::UnitTest::WhichMethods
	);
	
	assert_equal( $suite.num_tests, 3,
		'Expected 3 tests');
}

class Test::UnitTest::WhichMethods
	is UnitTest::Testcase {
	method not_at_all()	{ Exception.new("not a valid test").throw; }
	method not_a_test()	{ Exception.new("not a valid test").throw; }
	method _test()		{ Exception.new("not a valid test").throw; }
	method _test_x()		{ Exception.new("not a valid test").throw; }
	method testall()		{ Exception.new("not a valid test").throw; }
	method test_all()		{ 1; }
	method testAll()		{ 1; }
	method test1()		{ 1; }
}