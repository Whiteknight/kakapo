# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell krt0 which file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

class Test::UnitTest::AllTests
	is UnitTest::Suite {
	INIT {
		use(	'P6metaclass' );
		Program::register_main(Test::UnitTest::AllTests::main);
	}
	
	method suite() {
		my @sub_suites := Array::new(
			'Testcase',
			'Suite',
			'Loader',
		);
		
		my $suite := self.new();
		
		for @sub_suites {
			say("Loading t/UnitTest/$_.pbc");
			pir::load_bytecode("t/UnitTest/$_.pbc");
			say("Pulling suite from Test::UnitTest::$_");
			$suite.add_test(P6metaclass.get_proto('Test::UnitTest::' ~ $_).suite);
		}

		return $suite;		
	}
	
	sub main() {
		Test::UnitTest::AllTests.suite.run;
	}
}
