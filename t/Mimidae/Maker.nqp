#! parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Mimus::Maker
	is UnitTest::Testcase ;

	has $!sut;
	
INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.set_up;
	$proto.test_mock_logs_calls;
	#$proto.suite.run;
}

method set_up() {
	$!sut := Mimus::Maker.new();
}

method test_new() {
	verify_that( 'SUT is created okay, right class.' );
	
	fail_unless( $!sut.isa('Mimus::Maker'),
		'SUT should be populated with object of the right class.');
}

method test_mock_parent() {
	verify_that( 'Mock :of a parent has that parent as an ancestor' );
	
	my $mc := $!sut.mock(:of('String'));
	fail_if( pir::isnull($mc), 'Result must not be null' );
	fail_unless( $mc.WHO.isa('String'), 'Result must be of the correct class' );
	fail_unless( $mc.new.can('length'), 'Result must inherit methods' );
}

method test_mock_logs_calls() {
	my $mc := $!sut.mock(:of('String'));

	my $mo := $mc.new;
	$mo.length(2, 3, 5, 8, :z(26));
	$mo.trim('a', 'b');
	$mo.repeat(:a, :b, :c('zero'));
	
	my @log :=  pir::getattribute__PPS($mo, '@!MIMUS_CALLS');
	fail_unless( @log.elements == 3, '@log should record 3 calls');
	fail_unless( @log[0][0] eq 'length', 'First entry should be length');
	fail_unless( @log[1][1].elements == 2, 'Second entry, two positional args' );
	fail_unless( @log[2][2].elements == 3, 'Third entry, 3 named args' );
}

method test_mock_new_class() {
	my $mc := $!sut.mock();
	
	fail_if( pir::isnull($mc), 'Result must not be null');
	fail_unless( $mc.isa('P6object'), 'Result must be of the correct class');
}