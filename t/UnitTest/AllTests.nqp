#! /usr/bin/env parrot-nqp
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
	is UnitTest::Suite ;

INIT {
	use(	'UnitTest::Testcase' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

method suite() {
	my @sub_suites := <
		Assertions
		Loader
		Suite
		TapListener
		Testcase
	>;

	my $suite := self.new();
	
	for @sub_suites -> $file {
		say("Loading t/UnitTest/$file.nqp");

		my &code := Nqp::compile_file( "t/UnitTest/$file.nqp" );
		&code();

		my $name := $file;
		$name := 'Listener::TAP' if $name eq 'TapListener';
		
		$suite.add_test:
			P6metaclass.get_proto('Test::UnitTest::' ~ $name).suite;
	}

	return $suite;
}
