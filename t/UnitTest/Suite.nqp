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
	
	for @tests {
		Test::UnitTest::Suite.new(:name(~ $_)).run();
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
		
		has(	'$!suite' );
	}

	method set_up() {
		self.suite(UnitTest::Suite.new);
	}
	
	method test_add_test() {
		self.suite.add_test(1);
		self.suite.add_test(2);
		self.suite.add_test(3);
		
		unless self.suite.members.elements == 3 { fail("Expected 3 tests added"); }
		unless self.suite.num_tests == self.suite.members.elements {
			fail("Expected num_tests() == members.elements");
		}
	}
	
	method test_add_tests() {
		self.suite.add_tests(1, 2, 3, 4, 5);
		unless self.suite.num_tests == 5 { fail("Expected num_tests = 5"); }
		
		self.suite.add_tests(0, 0, 0);
		unless self.suite.num_tests == 8 { fail("Expected num_tests = 8"); }
	}
	
	method test_add_tests_() {
		self.suite.add_tests_(Array::new(1, 2, 3, 4));
		unless self.suite.num_tests == 4 { fail("Expected num_tests = 4"); }
		
		self.suite.add_tests_(Array::new(7, 8, 9));
		unless self.suite.num_tests == 7 { fail("Expected num_tests = 7"); }
	}
	
	method test_new() {
		unless self.suite.members.defined { fail("Undef @!members"); }
		unless self.suite.members.elements == 0 { fail("Expected empty @!members"); }
	}
	
	method test_run() {
		self.suite.add_tests(
			Test::UnitTest::WasRun.new,
			Test::UnitTest::WasRun.new,
			Test::UnitTest::WasRun.new,
			Test::UnitTest::WasRun.new,
		);
		
		my $result := self.suite.run;
		
		unless $result.num_tests == self.suite.num_tests {
			fail("Expected result.num_tests == suite.num_tests");
		}
		
		for self.members {
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