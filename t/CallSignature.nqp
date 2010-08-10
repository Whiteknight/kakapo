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

class Test::CallSignature
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
}

our method set_up() {
	$!sut := CallSignature.new;
}

our method test_new() {
	verify_that( '.new creates right class.' );
	
	assert_isa( $!sut, 'CallSignature', 
		'SUT should be populated with object of the right class.');
}

our method test_empty() {
	verify_that( 'An empty callsig has an empty pos array and empty named hash' );
	
	assert_isa( $!sut.positional, 'ResizablePMCArray',
		'Sut should have positional array');
	assert_equal( $!sut.positional.elems, 0, 
		'Pos array should be empty');
		
	assert_isa( $!sut.named, 'Hash',
		'Sut should have named hash');
	assert_equal( $!sut.named.elems, 0,
		'Named hash should be empty');
}

