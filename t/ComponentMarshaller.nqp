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

class Test::ComponentMarshaller
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
	verify_that( '.new() returns the correct class' );
	
	my $sut := ComponentMarshaller.new;
	
	assert_instance_of( $sut, 'ComponentMarshaller',
		'.new should return the right class');
}

# NB: The Library.nqp test file does the majority of the work testing ComponentMarshaller.