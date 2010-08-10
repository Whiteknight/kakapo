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

class Test::Matcher::IsInteger
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

our method test_match() {
	my $sut := Matcher::IsInteger.new: 7;
	
	assert_match( '7', $sut, "Literal string should match okay.");
}

our method test_tointeger() {
	my $sut := Matcher::IsInteger.new: 3;
	my $dummy := <c a t>;
	
	assert_match( $dummy, $sut, 
		'get_integer() method should match, too.');
}
	
our method test_nonmatch() {
	my $sut := Matcher::IsInteger.new: 6;

	assert_not_match( 'vi', $sut, 'String should not match');
}

our method test_new() {
	my $sut := Matcher::IsInteger.new;
	assert_isa($sut, 'Matcher::IsInteger', 'New should return the right type');
}

class Dummy::TestSugar {
	INIT {
		use( Matcher::Factory );
	}
	
	method sugar($arg) {
		is_integer($arg);
	}
}

our method test_sugar() {
	my $sut := Dummy::TestSugar.sugar: 13;
	
	assert_isa($sut, 'Matcher::IsInteger', 'Sugar should return the right type');
	assert_match( 10 + 3, $sut, 'Sugar should return correctly configured matcher');
}
