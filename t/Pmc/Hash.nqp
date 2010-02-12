# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell krt0 which file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

INIT {
	pir::load_bytecode('t/Pmc/COMMON.pbc');
}

class Test::Pmc::Undef
	is Test::Pmc::COMMON {
	
	INIT {
		use(	'P6metaclass' );
		use(	'UnitTest::Testcase' );
		
		Program::register_main();
	}
	
	sub main() {
		my $proto := Opcode::get_root_global(Opcode::get_namespace().get_name);
		$proto.suite.run;
	}
	
	method test_defined() {
		verify_that( "Defined returns false" );
		my $object := self.class.new;

		if $object.defined { fail( "Undef.defined reports yes" ); }
	}
	
	method test_new() {
		verify_that( "'new' returns an object of the right type" );		
		my $object := self.class.new;
		
		if Opcode::isnull($object) { fail( "New returned null" ); }
		if Opcode::defined($object) { fail( "New returned 'defined' undef object" ); }
		unless pir::isa($object, Opcode::typeof(self.class)) { fail("New returned wrong type"); }
	}
		
}
