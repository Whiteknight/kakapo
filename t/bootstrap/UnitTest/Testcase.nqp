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
	plan(11);

	our $Class_name := 'UnitTest::Testcase';
	
	test_attrs();
	test_exports();
	test_asserts();
	test_structure();
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
	my $proto := Parrot::get_hll_global(our $Class_name);
	$proto.new();
}

sub test_attrs() {
	my $obj := make_one();
	ok($obj.isa(our $Class_name), 'Make_one returns the right class');
	
	$obj.name('snargle');
	$obj.verify('sizzle');
	
	is($obj.name, 'snargle', 'Attrs: name okay');
	is($obj.verify, 'sizzle', 'Attrs: verify okay');	
}

class TestExport is UnitTest::Testcase {
	INIT {
		use( 'UnitTest::Testcase');
	}
	
	method call_exported_syms() {
		verify_that('verify is set correctly');
	}
}

sub test_exports() {
	my $obj := TestExport.new;
	$obj.call_exported_syms;
	is($obj.verify, 'verify is set correctly', 'Exports: verify_that works okay');
}

class DummyMatcher {
	method matches(*@args) { 0; }
	method describe_self(*@args) { '' }
	method describe_failure(*@args) { '' }
}

class TestAsserts is UnitTest::Testcase {
	INIT {
		use( 'P6metaclass' );
		use( 'UnitTest::Testcase', :tags('DEFAULT', 'ASSERTS'));
		
		has( '$.failure_count');
	}
	
	method fail_assert_true() {
		assert_true(0);
	}
	
	method fail_assert_false() {
		assert_false(1);
	}
	
	method fail_assert_match() {
		my $matcher := DummyMatcher.new();
		assert_that(0, $matcher);
	}
	
	method _fail($why) {
		self.failure_count(1 + self.failure_count);
	}
}
	
sub test_asserts() {
	my $obj := TestAsserts.new();
	ok($obj.failure_count == 0, 'Asserts: setup okay');
	
	$obj.fail_assert_true();
	ok($obj.failure_count == 1, 'Failing assert_true works');
	
	$obj.fail_assert_false();
	ok($obj.failure_count == 2, 'Failing assert_false works');
	
	$obj.fail_assert_match();
	ok($obj.failure_count == 3, 'Failing assert_match works');
}

class TestStructure is UnitTest::Testcase {
	INIT {
		use( 'P6metaclass' );
		use( 'UnitTest::Testcase' );
		
		has(	'$.called_setup',
			'$.called_run_test',
			'$.called_tear_down',
		);
	}

	method set_up(*@args)	{ self.called_setup(1); }
	method run_test(*@args) { self.called_run_test(1); }
	method tear_down(*@args) { self.called_tear_down(1); }
}

sub test_structure() {
	my $obj := TestStructure.new();

	ok(	$obj.called_setup == 0
		&& $obj.called_run_test == 0
		&& $obj.called_tear_down == 0,	'Structure: init okay');
	
	my $result := UnitTest::Result.new;
	$obj.run($result);
	
	ok(	$obj.called_setup == 1
		&& $obj.called_run_test == 1
		&& $obj.called_tear_down == 1,	'Structure: all phases called');		
	ok($result.run_count == 1, 			'Structure: result updated ok');
}