# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell the Kakapo runtime which library file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

class Test::UnitTest::Loader
	is UnitTest::Testcase {
	
	INIT {
		use(	'P6metaclass' );		# has
		use(	'UnitTest::Testcase' );	# fail, etc.
		

		Program::register_main();
		has(	'$!loader' );
		
		my $loader := UnitTest::Loader.new();
	}
	
	sub main() {
		my $proto := Opcode::get_root_global(Opcode::get_namespace().get_name);
		$proto.suite.run;
	}

	method set_up() {
		self.loader(UnitTest::Loader.new);
	}
	
	method test_load_tests_from_testcase() {
		my $suite := self.loader.load_tests_from_testcase(
			Test::UnitTest::WhichMethods
		);
		
		unless $suite.num_tests == 3 {
			fail("Expected 3 tests");
		}
	}
}

class Test::UnitTest::WhichMethods
	is UnitTest::Testcase {
	method not_at_all()	{ Exception.new("not a valid test").throw; }
	method not_a_test()	{ Exception.new("not a valid test").throw; }
	method _test()		{ Exception.new("not a valid test").throw; }
	method _test_x()		{ Exception.new("not a valid test").throw; }
	method testall()		{ Exception.new("not a valid test").throw; }
	method test_all()		{ 1; }
	method testAll()		{ 1; }
	method test1()		{ 1; }
}