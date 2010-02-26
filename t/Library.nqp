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

class Test::Library
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {
	
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

class Test::Queue 
	is Library {
	INIT {
		has( < $.a $.b $.c > );
	}
	
	sub set_a($lib) {	$lib.a($lib.b + 1); }
	sub set_b($lib) {	$lib.b(3); }
	sub set_c($lib) {	$lib.c($lib.a + 5); }
}

method test_init_queue() {
	verify_that( 'Library calls the entries in the init_queue correctly' );

	my $lib := Test::Queue.new(:a(0), :b(0), :c(0));
	
	$lib.at_init(Test::Queue::set_c, 'c', :requires('a'));
	$lib.at_init(Test::Queue::set_a, 'a', :requires('b'));
	$lib.at_init(Test::Queue::set_b, 'b');

	$lib.do_init();
	
	fail_unless( $lib.b == 3 && $lib.a == 4 && $lib.c == 9,
		'Subs should run in correct order.' );
}

method test_load_queue() {
	verify_that( 'Library calls the entries in the load_queue correctly' );

	my $lib := Test::Queue.new(:a(0), :b(0), :c(0));
	
	$lib.at_load(Test::Queue::set_c, 'c', :requires('a'));
	$lib.at_load(Test::Queue::set_a, 'a', :requires('b'));
	$lib.at_load(Test::Queue::set_b, 'b');

	$lib.do_load();
	
	fail_unless( $lib.b == 3 && $lib.a == 4 && $lib.c == 9,
		'Subs should run in correct order.' );
}

