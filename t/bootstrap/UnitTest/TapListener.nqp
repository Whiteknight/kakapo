#! parrot-nqp

MAIN();

INIT {
	# Load the Test::More library
	pir::load_language('parrot');
	#pir::compreg__PS('parrot').import('Test::More');
	pir::compreg__PS('parrot').import('Test::Builder::Tester');
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR>;
	
	unless $root_dir {
		$root_dir := '.';
	}
	
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

sub MAIN() {
	our $Class_name := 'UnitTest::Listener::TAP';
	
	# Make Test::Builder objects dump nicely.
	my $nsp := Parrot::get_hll_namespace('Test::Builder');
	$nsp.add_sub('__dump', P6object::__dump);
	$nsp := Parrot::get_hll_namespace('Test::Builder::Tester::Output');
	$nsp.add_sub('__dump', P6object::__dump);

	our $TEST := pir::new__PP(Test::Builder);
	
	Test::Builder::Tester::plan(3);
	
	test_attrs();
	test_listener();
}

sub make_one() {
	my $proto := Parrot::get_hll_global(our $Class_name);
	$proto.new(:test_builder(our $TEST));
}

sub test_attrs() {
	my $obj := make_one();
	
	Test::Builder::Tester::test_pass('Attrs: test builder okay');
	our $TEST.ok(Opcode::defined($obj.test_builder), 'Attrs: test builder okay');
	Test::Builder::Tester::test_test( 'passing attr test' );
}

class Dummy is UnitTest::Testcase {
	INIT {
		use( 'UnitTest::Testcase' );
	}
	
	method test_fails() {
		Test::Builder::Tester::test_fail('test_fails');
		Test::Builder::Tester::test_diag('now is the winter of our discontent');
		
		fail('now is the winter of our discontent');
	}
	
	method test_passes() {
		Test::Builder::Tester::test_pass( 'test_passes' );
		0;
	}
	
	method test_error() {
		Test::Builder::Tester::test_fail('test_error');
		Test::Builder::Tester::test_diag('the sky is falling');
		
		my $e := Exception.new();
		$e.message('the sky is falling');
		$e.throw;
	}
}

sub test_listener() {
	my $tc := Dummy.new();
	my $listener := make_one();
	our $TEST;
	
	Test::Builder::Tester::test_pass( 'Listener: Got right type' );
	$TEST.ok($listener.isa('UnitTest::Listener::TAP'), 'Listener: Got right type');
	
	Test::Builder::Tester::test_pass( 'Listener: Got right parents' );
	$TEST.ok($listener.isa('UnitTest::Listener'), 'Listener: Got right parents');
	Test::Builder::Tester::test_test( 'inheritance tests pass' );
	
	Test::Builder::Tester::test_out( '1..3' );
	
	my $result := UnitTest::Result.new;
	$result.add_listener($listener);
	$tc.suite.sort.run($result);
	
	Test::Builder::Tester::test_test( 'test run complete' );
	
	$TEST.finish();
}
