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

class Test::Mimus::Cuculus
	is UnitTest::Testcase ;

has $!sut;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
	use(	'Matcher::Factory' );

	use(	'Mimus::Cuculus' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
	#$proto.set_up;
	#$proto.test_calling;
}

method set_up() {
	$!sut := Mimus::Cuculus.new;
}

method test_new() {
	verify_that( 'SUT is created okay, right class.' );

	assert_isa( $!sut, 'Mimus::Cuculus',
		'SUT should be populated with object of the right class.');
}

method test_new_egg() {
	my $egg := $!sut.new_egg();

	assert_isa( $egg, 'Mimus::Cuculus::Ovum',
		'new_egg should return the right type');

	my $behavior := Opcode::getattribute( $egg, '&!MIMUS_BEHAVIOR' );
	assert_same( $behavior, Mimus::Cuculus::mock_execute,
		'New egg should be execute-configured by default' );
}

method test_calling() {
	my $egg := $!sut.new_egg();
	my $aegg := calling($egg);

	my $behavior := Opcode::getattribute( $aegg, '&!MIMUS_BEHAVIOR' );
	assert_same( $behavior, Mimus::Cuculus::add_antiphon,
		'Calling egg should be antiphon-configured' );

	my $cuc_c := Opcode::getattribute( $egg, '$!MIMUS_CUCULUS' );
	my $cuc_a := Opcode::getattribute( $aegg, '$!MIMUS_CUCULUS' );

	assert_same( $cuc_c, $cuc_a,
		'Both eggs should point to the same cuckoo.' );
}

method test_verify() {
	my $egg := $!sut.new_egg();
	my $vegg := verify($egg);

	my $behavior := Opcode::getattribute( $vegg, '&!MIMUS_BEHAVIOR' );
	assert_same( $behavior, Mimus::Cuculus::verify_calls,
		'Verify egg should be verify-configured' );

	my $cuc_c := Opcode::getattribute( $egg, '$!MIMUS_CUCULUS' );
	my $cuc_v := Opcode::getattribute( $vegg, '$!MIMUS_CUCULUS' );

	assert_same( $cuc_c, $cuc_v,
		'Both eggs should point to the same cuckoo.' );

}
