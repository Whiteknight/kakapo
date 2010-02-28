# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Matcher::Boolean
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
	#$proto.test_factory_true;
}

method test_match() {
	my $sut := Matcher::Boolean.new(:true);	
	assert_match( 1, $sut, 'True value should match');
}

method test_nonmatch() {
	my $sut := Matcher::Boolean.new(:false);
	want_fail( 'Boolean match should fail', { assert_match( 1, $sut, 'should fail'); });
}

method test_new() {
	my $sut := Matcher::Boolean.new();
	assert_isa($sut, 'Matcher::Boolean', 'Matcher should be of correct type.' );
}

method test_describe_self_true() {
	my $sut := Matcher::Boolean.new(:true);
	assert_equal( $sut.describe_self, 'a true value', 'True matcher should have true message');
}

method test_describe_self_false() {
	my $sut := Matcher::Boolean.new(:false);
	assert_equal( $sut.describe_self, 'a false value', 'False matcher should have false message');
}

class Test::BooleanFactory {
	INIT {
		use( 'Matcher::Factory');
	}
	
	method t() {
		true();
	}
	
	method f() {
		false();
	}
}

method test_factory_true() {
	my $obj := Test::BooleanFactory.new;
	
	my $t := $obj.t;
	assert_isa( $t, Matcher::Boolean, 'Should return a configured matcher.' );
	fail('Should be configured true') unless $t.expected;
}

method test_factory_false() {
	my $obj := Test::BooleanFactory.new;
	
	my $f := $obj.f;
	assert_isa( $f, Matcher::Boolean, 'Should return a configured matcher' );
	fail('Should be configured false') if $f.expected;
}