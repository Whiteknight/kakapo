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

	has $!sut;
	
INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
#~ $proto.test_mock_gets_parent_methods();
}

method test_new() {
	verify_that( 'SUT is created okay, right class.' );
	
	my $sut := Matcher::InstanceOf.new();
	fail_unless( $sut.isa('Matcher::InstanceOf'),
		'Matcher should be of correct type.' );
}
