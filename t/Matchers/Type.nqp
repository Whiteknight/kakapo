#! /usr/bin/env parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Matcher::Type
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

method test_describe_failure() {
	my $sut := Matcher::Type.new( :class(Boolean) );
	assert_equal( $sut.describe_failure('', 'a string'), "had type 'String'",
		'Type matcher should describe failures okay');
}

method test_describe_self() {
	my $sut := Matcher::Type.new( :class(Boolean) );
	assert_equal( $sut.describe_self, 'an object with type Boolean', 
		'Type matcher should describe-self okay');
		
	$sut.class( Matcher );
	assert_equal( $sut.describe_self, 'an object with type Matcher', 
		'Type matcher should describe-self okay after change');
	
}

method test_match() {
	my $sut := Matcher::Type.new( :class( 'Boolean' ) );
	my $obj := pir::new__ps('Boolean');
	
	assert_match( $obj, $sut, 'Boolean value should match :class(Boolean)');
}

method test_nonmatch() {
	my $sut := Matcher::Type.new( :class( 'Boolean' ) );
	my $obj := 'a string';
	
	want_fail( 'Type match (Boolean vs String) should fail', 
		{ assert_match( $obj, $sut, 'should fail'); });
}

method test_new() {
	my $sut := Matcher::Type.new();
	assert_isa($sut, 'Matcher::Type', 'Matcher should be of correct type.' );
}

class Test::TypeFactory {
	INIT {
		use( 'Matcher::Factory');
	}
	
	method foo() {
		type(Boolean);
	}
}

method test_factory() {
	my $obj := Test::TypeFactory.new;

	assert_isa( $obj.foo, Matcher::Type, 'Should return a configured Type matcher.' );
	assert_same( $obj.foo.class, Boolean, 'Should be configured to match Boolean');
}
