# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub main() {
	my @tests := Array::new(
		'test_add_test',
		'test_add_tests',
		'test_add_tests_',
		'test_new',
		'test_run',
	);
	
	# Note: I'm not using the ".suite" facility, since this file has to prove it works.
	# Pass this $result to all testcases to get better TAP listener behavior.
	my $result := UnitTest::Testcase.default_result;
	$result.plan_tests(+@tests);
	
	for @tests {
		Test::UnitTest::Suite.new(:name(~ $_)).run($result);
	}
}

module Kakapo {
	# Tell the Kakapo runtime which library file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

class Test::UnitTest::Suite
	is UnitTest::Testcase {
	
	INIT {
		use(	'P6metaclass' );		# has
		use(	'UnitTest::Testcase' );	# fail, etc.
		
		has(	'$!the_suite' );
	}

	method set_up() {
		self.the_suite(UnitTest::Suite.new);
	}
	
	method test_add_test() {
		my $testcase := Test::UnitTest::WasRun.new;
		self.the_suite.add_test($testcase);
		self.the_suite.add_test($testcase);
		self.the_suite.add_test($testcase);

		unless self.the_suite.members.elements == 3 { fail("Expected 3 tests added"); }
		unless self.the_suite.num_tests == self.the_suite.members.elements {
			fail("Expected num_tests() == members.elements");
		}
	}
	
	method test_add_tests() {
		my $testcase := Test::UnitTest::WasRun.new;
		self.the_suite.add_tests($testcase, $testcase, $testcase, $testcase, $testcase);
		unless self.the_suite.num_tests == 5 { fail("Expected num_tests = 5"); }
		
		self.the_suite.add_tests($testcase, $testcase, $testcase);
		unless self.the_suite.num_tests == 8 { fail("Expected num_tests = 8"); }
	}
	
	method test_add_tests_() {
		my $testcase := Test::UnitTest::WasRun.new;
		self.the_suite.add_tests_(Array::new($testcase, $testcase, $testcase, $testcase));
		unless self.the_suite.num_tests == 4 { fail("Expected num_tests = 4"); }
		
		self.the_suite.add_tests_(Array::new($testcase, $testcase, $testcase));
		unless self.the_suite.num_tests == 7 { fail("Expected num_tests = 7"); }
	}
	
	method test_new() {
		unless self.the_suite.members.defined { fail("Undef @!members"); }
		unless self.the_suite.members.elements == 0 { fail("Expected empty @!members"); }
		unless self.the_suite.num_tests == 0 { fail("Expected num_tests == 0"); }
	}
	
	method test_run() {
		self.the_suite.add_tests(
			Test::UnitTest::WasRun.new,
			Test::UnitTest::WasRun.new,
			Test::UnitTest::WasRun.new,
			Test::UnitTest::WasRun.new,
		);
		
		my $result := self.the_suite.run(UnitTest::Result.new);
		
		unless $result.num_tests == self.the_suite.num_tests {
			fail("Expected result.num_tests == suite.num_tests");
		}
		
		for self.the_suite.members {
			unless $_.was_run {
				fail("Expected all tests to be run");
			}
		}
	}
}	

class Test::UnitTest::WasRun
	is UnitTest::Testcase {
	
	INIT {
		use(	'P6metaclass' );
		use(	'UnitTest::Testcase' );

		has(	'$!was_run' );
	}
	
	method run_test() {
		self.was_run(1);
		fail("error");
	}
}