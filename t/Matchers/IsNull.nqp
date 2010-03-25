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

class Test::Matcher::IsNull
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

method test_match() {
	my $sut := Matcher::IsNull.new;
	assert_match(NoSuchSymbol, $sut, 'Null value should match');
}

method test_nonmatch() {
	my $sut := Matcher::IsNull.new;
	want_fail('Valid value should not match null', { assert_match('foo', $sut, 'should not match'); });
}

method test_new() {
	my $sut := Matcher::IsNull.new;
	assert_isa($sut, 'Matcher::IsNull', 'New should return the right type');
}