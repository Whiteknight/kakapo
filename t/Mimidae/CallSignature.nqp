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

class Test::Mimus::CallSignature
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


method test_new() {
	verify_that( 'CallSignature.new creates right class.' );
	
	my $sut := Mimus::CallSignature.new;
	
	assert_isa( $sut, 'Mimus::CallSignature', 
		'SUT should be populated with object of the right class.');
}

method test_new_matcher() {
	verify_that( 'CallSignature::SigMatcher.new creates right class.' );
	
	my $sut := Mimus::CallSignature::SigMatcher.new;
	
	assert_isa( $sut, 'Mimus::CallSignature::SigMatcher', 
		'SUT should be populated with object of the right class.');
}

method test_matcher() {
	my $object := self;
	my $method := 'foo';
	
	my $want := Mimus::CallSignature.new(:object($object), :method($method),
		:positional(Array::new(1, 'a')), :named( Hash.new( :z(3) ) ));
	my $matcher := Mimus::CallSignature::SigMatcher.new(:expecting($want));

	my $got := Mimus::CallSignature.new(:object($object), :method($method),
		:positional(Array::new(1, 'a')), :named( Hash.new( :rx(7), :t(1), :z(3))) );
	
	assert_match( $got, $matcher,
		'Should match' );
}

method test_matcher_fails_object() {
	my $other := Hash.new;
	my $method := 'foo';

	my $want := Mimus::CallSignature.new(:object(self), :method($method));
	my $got := Mimus::CallSignature.new(:object($other), :method($method));
	my $matcher := Mimus::CallSignature::SigMatcher.new(:expecting($want));
	
	assert_not_match( $got, $matcher, 
		'Should not match');
}

method test_matcher_fails_method() {
	my $want := Mimus::CallSignature.new(:object(self), :method('foo'));
	my $got := Mimus::CallSignature.new(:object(self), :method('bar'));
	my $matcher := Mimus::CallSignature::SigMatcher.new(:expecting($want));
	
	assert_not_match( $got, $matcher, 
		'Should not match');
}

method test_matcher_fails_named() {
	my $want := Mimus::CallSignature.new(:object(self), :method('foo'),
		:positional(<a b c>), :named(Hash.new( :z(3), :a(1))));
	my $got := Mimus::CallSignature.new(:object(self), :method('bar'),
		:positional(<a b c>), :named(Hash.new( :z(3), :a(2))));
	my $matcher := Mimus::CallSignature::SigMatcher.new(:expecting($want));
	
	assert_not_match( $got, $matcher, 
		'Should not match');
}

method test_matcher_fails_pos() {
	my $want := Mimus::CallSignature.new(:object(self), :method('foo'),
		:positional(<a b c>));
	my $got := Mimus::CallSignature.new(:object(self), :method('bar'),
		:positional(<a b c d>));
	my $matcher := Mimus::CallSignature::SigMatcher.new(:expecting($want));
	
	assert_not_match( $got, $matcher, 
		'Should not match');
}
