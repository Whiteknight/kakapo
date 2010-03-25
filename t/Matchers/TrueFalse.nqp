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

class Test::Matcher::TrueFalse
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

method test_match() {
	my $sut := Matcher::TrueFalse.new(:true);	
	assert_match( 1, $sut, 'True value should match');
}

method test_nonmatch() {
	my $sut := Matcher::TrueFalse.new(:false);
	want_fail( 'Boolean match should fail', { assert_match( 1, $sut, 'should fail'); });
}

method test_new() {
	my $sut := Matcher::TrueFalse.new();
	assert_isa($sut, 'Matcher::TrueFalse', 'Matcher should be of correct type.' );
}

method test_describe_self_true() {
	my $sut := Matcher::TrueFalse.new(:true);
	assert_equal( $sut.describe_self, 'a true value', 'True matcher should have true message');
}

method test_describe_self_false() {
	my $sut := Matcher::TrueFalse.new(:false);
	assert_equal( $sut.describe_self, 'a false value', 'False matcher should have false message');
}

class Test::TrueFalseFactory {
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
	my $obj := Test::TrueFalseFactory.new;
	
	my $t := $obj.t;
	assert_isa( $t, Matcher::TrueFalse, 'Should return a configured TrueFalse matcher.' );
	fail('Should be configured true') unless $t.expected;
}

method test_factory_false() {
	my $obj := Test::TrueFalseFactory.new;
	
	my $f := $obj.f;
	assert_isa( $f, Matcher::TrueFalse, 'Should return a configured TrueFalse matcher' );
	fail('Should be configured false') if $f.expected;
}

#method main() { self.set_up; self.test_factory_false; };