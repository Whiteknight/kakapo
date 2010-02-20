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

class Test::Exit is Program {
	method main(@args) {
		foo();
		exit(1);
	}
	
	method do_exit() {
		self.exit_value;
	}
	
	sub foo() {
		exit(4);
	}
}

method test_exit() {
	verify_that( 'Calling global exit() immediately ends program' );
	
	my $pgm := Test::Exit.new;
	my $status := $pgm.run;
	
	fail_unless($status == 4, 'Exit 4 should have passed through');	
}

class Test::InitQueue is Program {
	INIT {
		has( < $.a $.b $.c > );
	}
	
	method do_exit() {	self.exit_value; }
	
	sub set_a($pgm) {	$pgm.a($pgm.b + 1); }
	sub set_b($pgm) {	$pgm.b(3); }
	sub set_c($pgm) {	$pgm.c($pgm.a + 5); }
}

method test_init_queue() {
	verify_that( 'Program calls the entries in the init_queue correctly' );

	my $pgm := Test::InitQueue.new;
	
	$pgm.at_init(Test::InitQueue::set_c, 'c', :requires('a'));
	$pgm.at_init(Test::InitQueue::set_a, 'a', :requires('b'));
	$pgm.at_init(Test::InitQueue::set_b, 'b');

	$pgm.do_init();
}