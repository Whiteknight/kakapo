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

class Test::Program
	is UnitTest::Testcase ;

INIT {
	use(	UnitTest::Testcase );	
	use(	UnitTest::Assertions );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

class Test::Caller {

	method arg1($arg = 1) { self.with_arg($arg); }
	method arg2() { self.arg1(2); }
	
	method no_arg() { Parrot::caller(); }
	
	method with_arg($depth) { Parrot::caller($depth); }
}

our method test_caller() {
	my $tc := Test::Caller.new;
	
	assert_same( Test::Caller::with_arg, $tc.with_arg(0),
		'Calling caller(0) should return present sub' );

	assert_same( Test::Caller::arg1, $tc.arg1(),
		'Calling caller(1) should return immediate caller' );

	assert_same( Test::Caller::arg2, $tc.arg2(),
		'Calling caller(2) should return callers caller.' );
		
	assert_same( $tc.no_arg, $tc.with_arg(1),
		'Calling caller() should return same as calling caller(1)' );
}

class Test::New {
}

our method test_new() {
	my $test := Parrot::new('Test::New');

	assert_not_null( $test,  'Parrot::new should return new object' );
	assert_instance_of( $test, Test::New, 'New object should be of correct pmc type' );
}

sub get_global_testSetGlobal() {
	Q:PIR { 
		%r = get_hll_global 'testSetGlobal'
	};
}

our method test_set_hll_global() {
	assert_null( get_global_testSetGlobal(),
		'Global should not be set yet' );
	
	Parrot::set_hll_global( 'testSetGlobal', 'now set' );
	
	assert_equal( 'now set', get_global_testSetGlobal(),
		'Global should now be set.' );
}