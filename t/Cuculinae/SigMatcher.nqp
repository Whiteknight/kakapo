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

class Test::Cuculus::SigMatcher
	is UnitTest::Testcase ;

has $!sut;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
	#$proto.set_up;
	#$proto.test_cuckoo_match;
}

method set_up() {
	$!sut := Cuculus::SigMatcher.new;
}

method test_new() {
	verify_that( '.new creates right class.' );

	_dumper($!sut);
	assert_isa( $!sut, Matcher::CallSig,
		'SUT should be populated with object of the right class.');

	assert_isa( $!sut, Cuculus::SigMatcher,
		'SUT should be populated with object of the right class.');

}

method test_cuckoo_match() {
	my $mc := Cuckoo::cuckoo('UnitTest::Testcase');
	my $cuckoo := Opcode::getattribute($mc, '$!CUCULUS_CANORUS');
	my $mc2 := $cuckoo.new_egg( :behavior(Cuculus::Canorus::mock_execute) );
	
	my $want := CallSignature.new(:object($mc), :method('foo'));
	$!sut.expecting($want);
	my $got := CallSignature.new(:object($mc2), :method('foo'));	
	
	assert_match( $got, $!sut, 
		'SigMatcher should follow links when comparing objects');
}

method test_default_sig_matches_anything() {
	my $want := CallSignature.new;
	$!sut.expecting( $want );
	
	my $object := self;
	my $method := 'foo';
	my $got := CallSignature.new(
		:method($method),
		:named( Hash.new( :rx(7), :t(1), :z(3))),
		:object($object), 
		:positional( [ 1, 'a' ] ), 
	);

	assert_match( $got, $!sut,
		'Should match' );

	$got.method('bar');
	$got.object(1);
	assert_match( $got, $!sut,
		'Still matches' );
}

method test_matcher() {
	my $object := self;
	my $method := 'foo';

	my $want := CallSignature.new(
		:method($method),
		:named( Hash.new( :z(3) ) ),
		:object($object), 
		:positional( [ 1, 'a' ]), 
	);
	$!sut.expecting($want);

	my $got := CallSignature.new(
		:method($method),
		:named( Hash.new( :rx(7), :t(1), :z(3))),
		:object($object), 
		:positional( [ 1, 'a' ]), 
	);

	assert_match( $got, $!sut,
		'Should match' );
}

method test_matcher_fails_method() {
	my $want := CallSignature.new(:method('foo'));
	$!sut.expecting($want);

	my $got := CallSignature.new(:method('bar'));

	assert_not_match( $got, $!sut,
		'Should not match');
}

method test_matcher_fails_named() {
	my $want := CallSignature.new();
	$!sut.expecting($want);
	
	my $got := CallSignature.new(:named(Hash.new( :z(3), :a(2))));

	assert_match( $got, $!sut, 
		'Default callsig should always match');
		
	$want.named(Hash.new( :z(3), :a(1)));
	assert_not_match( $got, $!sut,
		'Should not match due to :a() value');
}

method test_matcher_fails_object() {
	my $other := Hash.new;
	my $method := 'foo';

	my $want := CallSignature.new(:object(self), :method($method));
	my $got := CallSignature.new(:object($other), :method($method));
	$!sut.expecting($want);

	assert_not_match( $got, $!sut,
		'Should not match');
}

method test_matcher_fails_pos() {
	my $want := CallSignature.new(:object(self), :method('foo'),
		:positional(<a b c>));
	my $got := CallSignature.new(:object(self), :method('bar'),
		:positional(<a b c d>));
	$!sut.expecting($want);

	assert_not_match( $got, $!sut,
		'Should not match');
}
