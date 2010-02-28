# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Matcher::Null
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
	my $sut := Matcher::Null.new;
	assert_match(NoSuchSymbol, $sut, 'Null value should match');
}

method test_nonmatch() {
	my $sut := Matcher::Null.new;
	want_fail('Valid value should not match null', { assert_match('foo', $sut, 'should not match'); });
}

method test_new() {
	my $sut := Matcher::Null.new;
	assert_isa($sut, 'Matcher::Null', 'New should return the right type');
}