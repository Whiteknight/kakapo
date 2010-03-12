#! /usr/bin/env parrot-nqp 
# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::UnitTest::Listener::TAP
	is UnitTest::Testcase;

has	$!sut;
	
INIT {
	use(	'UnitTest::Testcase');
	use(	'UnitTest::Assertions');
	use(	'Cuckoo' );
	
	pir::load_bytecode('Test/Builder.pbc');
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

method set_up() {
	my $class := cuckoo( Test::Builder );
	my $tb := $class.new;
	
	$!sut := UnitTest::Listener::TAP.new( :test_builder( $tb ));
}

class Test::Dummy is UnitTest::Testcase {
	
}

method test_pass() {
	my $test := Test::Dummy.new( :name( 'passing test' ));
	
	$!sut.plan_tests(1);
	$!sut.end_test($test);

	my $tb := $!sut.test_builder;
	
	# Confirm these calls on the test builder
	verify( $tb ).plan( 1 );
	verify( $tb ).ok( 1, 'passing test' );
}

method test_fail() {
	my $test := Test::Dummy.new( :name( 'failing test' ));
	
	$!sut.plan_tests: 1;
	$!sut.add_failure: UnitTest::Failure.new(
		:fault( Exception::UnitTestFailure.new( :message('test failed') ) ),
		:test_case($test));
	

	my $tb := $!sut.test_builder;
	
	# Confirm these calls on the test builder
	verify( $tb ).plan( 1 );
	verify( $tb ).ok( 0, 'failing test' );
	verify( $tb ).diag( 'test failed' );
}

method test_error() {
	my $test := Test::Dummy.new( :name( 'failing test' ));
	
	$!sut.plan_tests: 1;
	$!sut.add_error: UnitTest::Failure.new(
		:fault( Exception::UnitTestFailure.new( :message('test failed') ) ),
		:test_case($test));
	

	my $tb := $!sut.test_builder;
	
	# Confirm these calls on the test builder
	verify( $tb ).plan( 1 );
	verify( $tb ).ok( 0, 'failing test' );
	verify( $tb ).diag( 'test failed' );
}
