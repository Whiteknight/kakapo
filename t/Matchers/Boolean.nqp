# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell krt0 which file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

INIT {
}

class Test::Matcher::Boolean
	is UnitTest::Testcase {
	
	INIT {
		use(	'P6metaclass' );
		use(	'UnitTest::Testcase' );
		
		has(	'$!matcher' );
		Program::register_main();
	}
	
	sub main() {
		my $proto := Opcode::get_root_global(Opcode::get_namespace().get_name);
		$proto.suite.run;
	}
	
	method test_describe_false() {
		verify_that( "Generated description of false is correct" );

		my $m := Matcher::Boolean.new( :expected(0) );
		unless $m.describe_self('') eq 'a false value' { fail( "Bad formatting" ); }
	}
	
	method test_describe_true() {
		verify_that( "Generated description of true is correct" );
		my $m := Matcher::Boolean.new( :expected(1) );
		unless $m.describe_self('') eq 'a true value' { fail( "Bad formatting" ); }
	}
	
	method test_constructor_true() {
		verify_that( "True expectation is passed through ctor");
		
		my $m := Matcher::Boolean.new( :expected(100) );
		unless $m.expected { fail("Bad expectation set"); }
	}

	method test_constructor_false() {
		verify_that( "False expectation is passed through ctor");
		
		my $m := Matcher::Boolean.new( :expected(0) );
		if $m.expected { fail("Bad expectation set"); }
	}
}