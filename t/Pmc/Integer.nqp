#! /usr/bin/env parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Integer
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

TEST_MAIN();

our method test_int_array() {
	my $x := [1, 2, 3];
	
	assert_equal( 3, int($x),
		'int(3-elt array) should be 3');
}

our method test_int_hash() {
	my $x := hash( :a<1>, :b<2>, :c<3>, :d<4>);
	
	assert_equal( 4, int($x),
		'int(4-entry hash) should be 4');
}