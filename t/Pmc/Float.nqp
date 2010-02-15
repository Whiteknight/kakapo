# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell krt0 which file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

INIT {
	pir::load_bytecode('t/Pmc/COMMON.pbc');
}

class Test::Pmc::Float
	is Test::Pmc::COMMON {
	
	INIT {
		use(	'P6metaclass' );
		use(	'UnitTest::Testcase' );
		
		Program::register_main();
	}
	
	sub main() {
		my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
		$proto.suite.run;
	}
}