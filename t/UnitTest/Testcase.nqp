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

class Test::UnitTest::Testcase
	is UnitTest::Testcase;
	
INIT {
	use(	'UnitTest::Testcase');
	use(	'UnitTest::Assertions');
	use(	'Matcher::Factory' );		
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method main() {
	my @tests := [
		'test_error', 
		'test_error_and_teardown_fails',
		'test_failure', 
		'test_setup_fails',
		'test_success',
		'test_suite',
		'test_teardown_fails',
	];

	# Note: I'm not using the ".suite" facility, since this file has to prove it works.
	# Pass this $result to all testcases to get better TAP listener behavior.
	my $result := UnitTest::Testcase.default_result;
	$result.plan_tests(+@tests);
	
	for @tests {
		Test::UnitTest::Testcase.new(:name(~ $_)).run($result);
	}
}

class Test::UnitTest::Dummy
	is UnitTest::Testcase {
	
	method default_result() {
		return UnitTest::Result.new;
	}
}

class Test::UnitTest::Error
	is Test::UnitTest::Dummy {

	method run_test() {
		Exception.new("error").throw;
	}
}

our method test_error() {
	verify_that("A thrown exception (an error) bumps both test-count and error-count");
	
	self.verify_error(Test::UnitTest::Error.new);
}
	
class Test::UnitTest::ErrorAndTeardownFails
	is Test::UnitTest::Dummy {

	INIT {
		use(	'P6metaclass' );
		has(	'$.was_torn_down' );
	}
	
	method run_test() {
		Exception.new("error").throw;
	}
	
	method tear_down() {
		self.was_torn_down(1);
		Exception.new("teardown fails").throw;
	}
}

our method test_error_and_teardown_fails() {
	verify_that("When test *and* teardown code both throw exceptions, error-count only bumps +1");
	
	my $test := Test::UnitTest::ErrorAndTeardownFails.new;
	self.verify_error($test);  # Confirm only 1 error counted.
	
	assert_true( $test.was_torn_down,
		'Teardown was skipped' );
}
		
class Test::UnitTest::Failure
	is Test::UnitTest::Dummy {
	
	INIT {
		use(	'UnitTest::Testcase' );
	}
	
	method run_test() {
		fail("failure");
	}
}

our method test_failure() {
	verify_that("When a failure occurs, test-count and failure-count bump");
	
	self.verify_failure(Test::UnitTest::Failure.new);
}
	
class Test::UnitTest::Success
	is Test::UnitTest::Dummy {
	
	method run_test() {
		return 1;
	}
}

our method test_success() {
	verify_that("Success bumps test-count and nothing more.");
	
	self.verify_success(Test::UnitTest::Success.new);
}

class Test::UnitTest::SetupFails
	is Test::UnitTest::Dummy {
	
	method set_up() {
		Exception.new("setup fails").throw;
	}
}

our method test_setup_fails() {
	verify_that("Setup error bumps test-count, error-count");
	
	self.verify_error(Test::UnitTest::SetupFails.new);
}
	
class Test::UnitTest::DummySuite
	is Test::UnitTest::Dummy {
	
	method test1() { 1; }
	method test_all() { 2; }
	method testAny() { 3; }
	method private() { 4; }
	method test() { 5; }
}

our method test_suite() {
	verify_that(".suite method returns a populated suite");
	
	my $suite := Test::UnitTest::DummySuite.suite();
	unless $suite.isa(UnitTest::Suite) { fail("Expected UnitTest::Suite object"); }
	unless $suite.num_tests == 3 { fail("Expected 3 test cases in suite"); }
}
	

class Test::UnitTest::TeardownFails
	is Test::UnitTest::Dummy {

	method run_test() { return 1; }
	method tear_down() {
		Exception.new("teardown fails").throw;
	}
}

our method test_teardown_fails() {
	verify_that("Teardown error bumps test-count, error-count");
	
	self.verify_error(Test::UnitTest::TeardownFails.new);
}
	
our method verify_error($test) {
	my $result := $test.run();
	
	unless $result.run_count		== 1 { fail("Expected 1 tests run"); }
	unless $result.error_count		== 1 { fail("Expected 1 errors"); }
	unless $result.failure_count	== 0 { fail("Expected 0 failures"); }
}
		
our method verify_failure($test) {
	my $result := $test.run();
	
	unless $result.run_count		== 1 { fail("Expected 1 tests run"); }
	unless $result.error_count		== 0 { fail("Expected 0 errors"); }
	unless $result.failure_count	== 1 { fail("Expected 1 failures"); }
}
		
our method verify_success($test) {
	my $result := $test.run();
	
	unless $result.run_count		== 1 { fail("Expected 1 tests run"); }
	unless $result.error_count		== 0 { fail("Expected 0errors"); }
	unless $result.failure_count	== 0 { fail("Expected 0 failures"); }
}
