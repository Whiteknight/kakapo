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

class Test::Matcher::IsString
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

method test_match() {
	my $sut := Matcher::IsString.new: 'dog';
	
	assert_match( 'dog', $sut, "Literal string should match okay.");
}

class Dummy::ToString {
	has @!parts;
	
	INIT {
		auto_accessors( :private );
	}
	
	method get_string() {
		@!parts.join;
	}
}

method test_tostring() {
	my $sut := Matcher::IsString.new: 'cat';
	my $dummy := Dummy::ToString.new: :parts( <c a t> );
	
	assert_match( $dummy, $sut, 
		'get_string() method should match, too.');
}
	
method test_nonmatch() {
	my $sut := Matcher::IsString.new: :string('frog');

	assert_not_match( 1, $sut, 'Number should not match');
}

method test_new() {
	my $sut := Matcher::IsString.new;
	assert_isa($sut, 'Matcher::IsString', 'New should return the right type');
}

class Dummy::TestSugar {
	INIT {
		use( Matcher::Factory );
	}
	
	method sugar($arg) {
		is_string($arg);
	}
}

method test_sugar() {
	my $sut := Dummy::TestSugar.sugar: 'foo';
	
	assert_isa($sut, 'Matcher::IsString', 'Sugar should return the right type');
	assert_match( 'foo', $sut, 'Sugar should return correctly configured matcher');
}