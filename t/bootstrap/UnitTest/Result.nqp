#! parrot-nqp

MAIN();

INIT {
	# Load the Test::More library
	pir::load_language('parrot');
	pir::compreg__PS('parrot').import('Test::More');
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR>;
	
	unless $root_dir {
		$root_dir := '.';
	}
	
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

sub MAIN() {	
	plan(22);

	test_failure();
	test_attrs();
	test_add_error();
	test_add_failure();
	test_add_listener();
	test_counters();
	test_plan_tests();
	test_start_test();
}

sub test_failure() {
	my $failure := UnitTest::Failure.new(:fault('mine'), :test_case(11));
	is($failure.fault, 'mine', 'Failure: New initializes .fault attr');
	is($failure.test_case, 11, 'Failure: New initializes .test_case attr');
	
	$failure.fault('yours');
	is($failure.fault, 'yours', 'Failure: Accessors okay - fault');
	$failure.test_case('fnord');
	is($failure.test_case, 'fnord', 'Failure: Accessors okay - test_case');
}

sub make_one() {
	UnitTest::Result.new();
}

sub test_attrs() {
	my $obj := make_one();
	
	$obj.errors.push(1);
	$obj.errors.push(2);
	$obj.failures.push('a');
	$obj.failures.push('b');
	$obj.listeners.unshift('z');
	$obj.listeners.unshift('y');
	$obj.should_stop(2);
	$obj.num_tests(3);
	
	ok($obj.errors[0] == 1 && $obj.errors[1] == 2, 'Result: Accessors okay - errors');
	ok($obj.failures[0] eq 'a' && $obj.failures[1] eq 'b', 'Result: Accessors okay - failures');
	ok($obj.listeners[0] eq 'y' && $obj.listeners[1] eq 'z', 'Result: Accessors okay - listeners');
	is($obj.should_stop, 2, 'Result: Accessors okay - should_stop');
	is($obj.num_tests, 3, 'Result: Accessors okay - num_tests');
}

sub test_add_error() {
	my $obj := make_one();
	
	$obj.add_error('test', 'error');
	ok($obj.errors == 1, 'add_error adds to errors queue');
	my $f := $obj.errors.shift;
	ok($f.fault eq 'error', 'add_error gets right fault');
	ok($f.test_case eq 'test', 'add_error gets right test case');
}

sub test_add_failure() {
	my $obj := make_one();
	
	$obj.add_failure('test', 'failure');
	ok($obj.failures == 1, 'add_failure adds to failures queue');
	my $f := $obj.failures.shift;
	ok($f.fault eq 'failure', 'add_failure gets right fault');
	ok($f.test_case eq 'test', 'add_failure gets right test case');
}

class DummyListener {
	INIT {
		use( 'P6metaclass' );
		has( '%!call_count' );
		has( '%!parameters' );
	}
	
	my method save($key, $value) {
		self.call_count{$key} := 1 + self.call_count{$key};
		self.parameters{$key} := $value;
	}
	
	method add_error($f)		{ self.save('add_error', $f); }
	method add_failure($f)		{ self.save('add_failure', $f); }
	method end_test($test)		{ self.save('end_test', $test); }
	method plan_tests($num_tests) { self.save('plan_tests', $num_tests); }
	method start_test($test)		{ self.save('start_test', $test); }
}	
	
sub test_add_listener() {
	my $obj := make_one();
	$obj.add_listener(1);
	is($obj.listeners, 1, 'add_listener adds to list');
}

sub test_end_test() {
	my $obj := make_one();
	my $listener := DummyListener.new();
	$obj.add_listener($listener);
	$obj.end_test('test1');
	is($listener.parameters<end_test>, 'test1', 'end_test gave test to listeners okay');
}

sub test_counters() {
	my $obj := make_one();
	is($obj.error_count, 0, 'error_count starts at 0');
	$obj.add_error('test', 'error');
	is($obj.error_count, 1, 'error_count moves to 1');
	
	is($obj.failure_count, 0, 'failure_count starts at 0');
	$obj.add_failure('test', 'failure');
	is($obj.failure_count, 1, 'failure_count moves to 1');
}

sub test_plan_tests() {
	my $obj := make_one();
	my $listener := DummyListener.new();
	$obj.add_listener($listener);
	$obj.plan_tests(21);
	is($listener.parameters<plan_tests>, 21, 'Plan tests passing through okay');
}

class DummyTestcase {
	method num_tests() { 3; }
}

sub test_start_test() {
	my $obj := make_one();
	my $listener := DummyListener.new();
	$obj.add_listener($listener);
	$obj.start_test(DummyTestcase.new());
	is($obj.run_count, 3, 'Start tests passes through okay');
}