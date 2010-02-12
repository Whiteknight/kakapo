# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub main() {
	my @tests := Array::new(
		'test_error', 
		'test_error_and_teardown_fails',
		'test_failure', 
		'test_setup_fails',
		'test_success',
		'test_suite',
		'test_teardown_fails',
	);

	# Note: I'm not using the ".suite" facility, since this file has to prove it works.
	# Pass a common $result to get TAP listener behavior.
	my $result := UnitTest::Testcase.default_result;
	
	for @tests {
		Test::UnitTest::Testcase.new(:name(~ $_)).run($result);
	}
}

module Kakapo {
	# Tell the Kakapo runtime which library file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

class Test::UnitTest::Testcase
	is UnitTest::Testcase {
	
	INIT {
		use(	'UnitTest::Testcase');
		use(	'Matcher::Factory' );		
	}

	method test_error() {
		self.verify_error(Test::UnitTest::Error.new);
	}
	
	method test_error_and_teardown_fails() {
		my $test := Test::UnitTest::ErrorAndTeardownFails.new;
		self.verify_error($test);  # Confirm only 1 error counted.
		unless $test.was_torn_down { fail("Teardown was skipped"); }
	}
		
	method test_failure() {
		self.verify_failure(Test::UnitTest::Failure.new);
	}
	
	method test_success() {
		self.verify_success(Test::UnitTest::Success.new);
	}

	method test_setup_fails() {
		self.verify_error(Test::UnitTest::SetupFails.new);
	}
	
	method test_suite() {
		my $suite := Test::UnitTest::Suite.suite();
		
		unless $suite.isa(UnitTest::Suite) { fail("Expected UnitTest::Suite object"); }
		unless $suite.num_tests == 3 { fail("Expected 3 test cases in suite"); }
	}
	
	method test_teardown_fails() {
		self.verify_error(Test::UnitTest::TeardownFails.new);
	}
	
	method verify_error($test) {
		my $result := $test.run();
		
		unless $result.run_count	== 1 { fail("Expected 1 tests run"); }
		unless $result.error_count	== 1 { fail("Expected 1 errors"); }
		unless $result.failure_count	== 0 { fail("Expected 0 failures"); }
	}
		
	method verify_failure($test) {
		my $result := $test.run();
		
		unless $result.run_count	== 1 { fail("Expected 1 tests run"); }
		unless $result.error_count	== 0 { fail("Expected 0 errors"); }
		unless $result.failure_count	== 1 { fail("Expected 1 failures"); }
	}
		
	method verify_success($test) {
		my $result := $test.run();
		
		unless $result.run_count	== 1 { fail("Expected 1 tests run"); }
		unless $result.error_count	== 0 { fail("Expected 0errors"); }
		unless $result.failure_count	== 0 { fail("Expected 0 failures"); }
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

class Test::UnitTest::Failure
	is Test::UnitTest::Dummy {
	
	INIT {
		use(	'Test::UnitTest' );
	}
	
	method run_test() {
		fail("failure");
	}
}

class Test::UnitTest::Success
	is Test::UnitTest::Dummy {
	
	method run_test() {
		return 1;
	}
}

class Test::UnitTest::SetupFails
	is Test::UnitTest::Dummy {
	
	method set_up() {
		Exception.new("setup fails").throw;
	}
}

class Test::UnitTest::Suite
	is Test::UnitTest::Dummy {
	
	method test1() { 1; }
	method test_all() { 2; }
	method testAny() { 3; }
	method private() { 4; }
	method test() { 5; }
}

class Test::UnitTest::TeardownFails
	is Test::UnitTest::Dummy {

	method run_test() { return 1; }
	method tear_down() {
		Exception.new("teardown fails").throw;
	}
}
