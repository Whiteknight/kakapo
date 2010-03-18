#! /usr/bin/env parrot-nqp
# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module bootstrap::UnitTest::Testcase ;

MAIN();

INIT {
	# Load the Test::More library
	pir::load_language('parrot');
	pir::compreg__PS('parrot').import('Test::More');
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

sub MAIN() {	
	plan(7);

	our $Class_name := 'UnitTest::Testcase';
	
	test_attrs();
	test_exports();
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