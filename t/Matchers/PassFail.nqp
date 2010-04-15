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

class Test::Matcher::PassFail
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

method test_match() {
	my $sut := Matcher::PassFail.new: :pass;
	
	assert_match( my $undef, $sut, "Everything should match okay.");
}

method test_nonmatch() {
	my $sut := Matcher::PassFail.new: :fail;

	assert_not_match( 'vi', $sut, 'Nothing should match');
}

method test_new() {
	my $sut := Matcher::PassFail.new;
	assert_isa($sut, 'Matcher::PassFail', 'New should return the right type');
}

class Dummy::TestSugar {
	INIT {
		use( Matcher::Factory );
	}
	
	method sugar($arg) {
		$arg ?? pass() !! fail();
	}
}

method test_sugar() {
	my $pass := Dummy::TestSugar.sugar: 1;
	assert_isa($pass, 'Matcher::PassFail', 'Sugar should return the right type');
	assert_match( 0, $pass, 'Sugar should return correctly configured matcher');
	
	my $fail := Dummy::TestSugar.sugar: 0;
	assert_isa($fail, 'Matcher::PassFail', 'Sugar should return the right type');
	assert_not_match( 1, $fail, 'Sugar should return correctly configured matcher');
}
