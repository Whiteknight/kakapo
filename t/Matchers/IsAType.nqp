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

class Test::Matcher::IsAType
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

method test_match() {
	my $sut := Matcher::IsAType.new: :class('String');
	
	assert_match( 'foo', $sut, 
		'Literal string should match isatype String');
}

method test_new() {
	my $sut := Matcher::IsAType.new;
	assert_isa($sut, 'Matcher::IsAType', 'New should return the right type');
}

method test_nonmatch() {
	my $sut := Matcher::IsAType.new: :class('Boolean');
	
	want_fail('String should not match type Boolean',
		{ assert_match( 'foo', $sut, 'message'); });
}

class Dummy::TestSugar {
	INIT {
		use( 'Matcher::Factory');
	}
	
	method sugar() {
		is_type('String');
	}
}

method test_sugar() {
	my $dummy := Dummy::TestSugar.new;
	
	my $sut := $dummy.sugar;

	assert_isa($sut, 'Matcher::IsAType', 'sugar factory should construct right type');
	assert_match( 'foo', $sut, 'sugar matcher should match right type');
}
