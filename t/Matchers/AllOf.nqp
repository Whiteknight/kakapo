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

class Test::Matcher::AllOf
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

our method test_match() {
	my $sut := Matcher::AllOf.new;

	$sut.children(
		Matcher::IsNull.new,
		Matcher::IsNull.new,
	);
	
	assert_match(NoSuchSymbol, $sut, "Should match both is-null children");
}

our method test_nonmatch() {
	my $sut := Matcher::AllOf.new;

	$sut.children(
		Matcher::IsNull.new,
		Matcher::IsNull.new,
	);

	want_fail('Valid value should not match either is-null child', { assert_match('foo', $sut, 'should not match'); });
}

our method test_new() {
	my $sut := Matcher::AllOf.new;
	assert_isa($sut, 'Matcher::AllOf', 'New should return the right type');
}
