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

class Test::Pmc::Key
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
	use(	'UnitTest::Assertions' );	
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method test_new() {
	my $key := Key.new(1, 2);
	my $row := 0;
	my $col := 0;
	
	pir::assign__vPI($row, $key);
	assert_equal( 1, $row, 
		'First part of key should be 1');
	
	$key := pir::shift__PP($key);
	pir::assign__vPI($col, $key);
	assert_equal( 2, $col,
		'Second part of key should be 2');
}
