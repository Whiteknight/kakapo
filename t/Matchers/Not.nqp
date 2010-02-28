# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Matcher::Not
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
	#$proto.test_match;
}

method test_match() {
	my $sut := Matcher::Not.new(Matcher::Boolean.new(:true));
	assert_match(0, $sut, 'False should match not(true)');
}

method test_nonmatch() {
	my $sut := Matcher::Not.new(Matcher::Boolean.new(:true));
	want_fail('True should not match not(true)', { assert_match(1, $sut, 'should not match'); });
}

method test_new() {
	my $sut := Matcher::Not.new(Matcher::Boolean.new(:true));
	assert_isa($sut, 'Matcher::Not', 'New should return the right type');
}