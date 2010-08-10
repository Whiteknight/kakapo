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

class Test::Matcher::InstanceOf
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

our method test_new() {
	verify_that( 'SUT is created okay, right class.' );
	
	my $sut := Matcher::InstanceOf.new();
	fail_unless( $sut.isa('Matcher::InstanceOf'),
		'Matcher should be of correct type.' );
}

our method test_match() {
	my $sut := Matcher::InstanceOf.new(:type('String'));
	
	fail_unless( $sut.matches('foo'),
		'Should match string constant as String');
}

our method test_nonmatch() {
	my $sut := Matcher::InstanceOf.new(:type('Matcher'));
	
	fail_if( $sut.matches('bar'),
		'Should not match string');
}

our method test_null_type() {
	my $sut := Matcher::InstanceOf.new();
	
	fail_if( $sut.matches('baz'),
		'Should not match any type' );
}

our method test_null_match() {
	my $sut := Matcher::InstanceOf.new(:type('String'));
	
	fail_if( $sut.matches(NoSuchAnimal),
		'Should match null - could be anything');
}

class Test::Factory::InstanceOf {
	method a() {
		use( 'Matcher::Factory' );
		
		instance_of('String');
	}
}

our method test_instance_of() {
	verify_that( 'The Factory namespace includes an instance_of sub that returns M::IO objects' );
	
	my $sut := Test::Factory::InstanceOf.new();
	
	my $matcher := $sut.a();
	
	fail_unless( $matcher.isa('Matcher::InstanceOf'),
		'Should create M::IO object');
	fail_unless( $matcher.matches('foo'),
		'Should match a string');
}