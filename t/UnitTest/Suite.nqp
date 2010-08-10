#! /usr/bin/env parrot-nqp
# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

# Note that this is not the bootstrap test suite - that's in t/bootstrap/UnitTest.
# I know (from the bootstrap suite) that this stuff works, I need to exercise the 
# corner cases.

class Test::UnitTest::Suite
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method test_new() {
	my $sut := UnitTest::Suite.new;
	
	assert_instance_of( $sut, UnitTest::Suite,
		'.new should return correct class');
}
