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

class Test::Streams is Program {
	method main(@args) {
		say("12345");
	}
	
	method do_exit() {
		self.exit_value;
	}
}

method test_run_switches_streams() {
	verify_that( "'run' swaps in its std* parameters" );
	
	my $original_stdout := pir::getstdout__P();
	
	my $new_stdout := Parrot::new('StringHandle');
	$new_stdout.open('any value', 'w');
	
	my $sut := Test::Streams.new(
		:stdout($new_stdout)
	);
	
	fail_unless( $sut.stdout =:= $new_stdout,
		'Ctor should stash stdout value');
	
	$sut.run();

	fail_unless(pir::getstdout__p() =:= $original_stdout,
		'Original file should have been restored');
	fail_if($sut.stdout =:= $original_stdout,
		'Program should keep its own');
		
	$new_stdout.open('different name');

	fail_unless( $new_stdout.readall eq "12345\n",
		'Should be able to read back stdout');
}
