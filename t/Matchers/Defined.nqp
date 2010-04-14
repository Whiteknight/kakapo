#! /usr/bin/env parrot-nqp
# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Matcher::Defined
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

method test_match() {
	my $sut := Matcher::Defined.new;

	my $x := 1;
	assert_match( $x, $sut, 'Number should be defined');
	
	$x := 'foo';
	assert_match( $x, $sut, 'String should be defined' );
	
	$x := [];
	assert_match( $x, $sut, 'RPA should be defined' );
}

method test_nonmatch() {
	my $sut := Matcher::Defined.new;

	my $x := pir::new__ps('Undef');
	
	assert_not_match( $x, $sut, 'Undef should not match');
}

method test_new() {
	my $sut := Matcher::Defined.new;
	assert_isa($sut, 'Matcher::Defined', 'New should return the right type');
}
