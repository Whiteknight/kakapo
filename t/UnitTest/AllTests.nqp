#! parrot-nqp
# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {	
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::UnitTest::AllTests
	is UnitTest::Suite {

INIT {
	use(	'UnitTest::Testcase' );	
	
	has(	'$.namespace');
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
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
