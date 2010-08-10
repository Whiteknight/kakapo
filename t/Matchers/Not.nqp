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

class Test::Matcher::Not
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );	
}

TEST_MAIN();

our method test_match() {
	my $sut := Matcher::Not.new(Matcher::TrueFalse.new(:true));
	assert_match(0, $sut, 'False should match not(true)');
}

our method test_new() {
	my $sut := Matcher::Not.new(Matcher::TrueFalse.new(:true));
	assert_isa($sut, 'Matcher::Not', 'New should return the right type');
}

our method test_nonmatch() {
	my $sut := Matcher::Not.new(Matcher::TrueFalse.new(:true));
	want_fail('True should not match not(true)', { 
		assert_match(1, $sut, 'should not match'); });
}

class Dummy::NotFactoryTest {
	INIT {
		use( UnitTest::Assertions );
		use( Matcher::Factory );
	}
	
	method not_true() {
		my $matcher := not(true());
		assert_match(0, $matcher,
			'0 should be not true' );
		assert_not_match(1, $matcher, 
			'1 should not match not true');
	}

	method not_false() {
		my $matcher := not(false());
		assert_not_match(0, $matcher,
			'0 should not match not false' );
		assert_match(1, $matcher,
			'1 should match not false' );
	}
}
		
our method test_factory_methods() {
	my $dummy := Dummy::NotFactoryTest.new;
	todo( "There's something amok with multisub dispatch in the factory sub");
	
	#_dumper(P6metaclass.get_parrotclass(Matcher::Not).inspect('all_parents'));
	assert_throws_nothing( 'Assertions should pass',
		{$dummy.not_true; });
	assert_throws_nothing( 'Assertions should pass',
		{ $dummy.not_false; });
}

#method main() { self.test_factory_methods; }