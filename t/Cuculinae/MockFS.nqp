#! /usr/bin/env parrot-nqp 
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Cuculus::MockFS
	is UnitTest::Testcase ;

has	$!sut;

INIT {
	use(	'UnitTest::Testcase' );	
	use(	'UnitTest::Assertions' );	
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

method set_up() {
	$!sut := Cuculus::MockFS.new;
}

method test_new() {
	assert_not_null( $!sut,
		'.new should return a valid object' );
	assert_instance_of( Cuculus::MockFS, $!sut,
		'.new should return an instance of the right class' );
}

method test_configure() {
	assert_false( $!sut.exists( '/tmp/xxx' ),
		'/tmp/xxx should not exist on new mockfs' );
	
	$!sut.mkpath( '/tmp/xxx' );
	
	assert_true( $!sut.exists( '/tmp/xxx' ),
		'/tmp/xxx should exist after mkpath' );
}

