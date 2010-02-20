#! parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Program
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

class Test::Caller {
	method a($d) { self.b($d); }
	method b($d) { self.c($d); }
	method c($depth) {
		Parrot::caller($depth);
	}
}

method test_caller() {
	my $tc := Test::Caller.new;
	
	fail_unless( ~$tc.a(0) eq 'c', 'caller(0) should return c');
	fail_unless( ~$tc.a(1) eq 'b', 'caller(1) should return b');
	fail_unless( ~$tc.a(2) eq 'a', 'caller(2) should return a');
	fail_unless( ~$tc.a(3) eq 'test_caller', 'caller(3) should return this method');
}
