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

class Test::Path
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

method test_new() {
	my $sut := Path.new;

	assert_not_null( $sut,
		'.new should return a valid object' );
	assert_instance_of( $sut, Path,
		'.new should return correct type' );
}

method test_parse_rootdir() {
	my $sut := Path.new('/');

	assert_true( $sut.is_absolute,
		'/ should be parsed as absolute' );
	assert_equal( '/', ~$sut,
		'/ should re-stringify as /' );
}


#~ method main() {
	#~ self.set_up;
	#~ self.;
#~ }
