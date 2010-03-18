#! /usr/bin/env parrot-nqp
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module bootstrap::Classes::P6metaclass ;

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
	
	plan(7);

	test_new();
	test_clone();
	test_defined();
	test_isa();
	
	test_method();
}

class TestClass {
	method foo() {
		return 13;
	}
}

sub make_one() {
	return TestClass.new();
}


sub test_clone() {
	my $obj := make_one();
	my $o2 := $obj.clone;

	ok(pir::isntsame__IPP($obj, $o2), 'Clone is a different object');
}

sub test_defined() {
	my $obj := make_one();
	ok($obj.defined, 'Defined ok');
}

sub test_isa() {
	my $obj := make_one();
	ok($obj.isa('TestClass'), 'isa returns true okay');
	nok($obj.isa('NotMe'), 'isa returns false okay');
	nok($obj.isa('Exception'), 'isa returns false okay 2');
}

sub test_new() {
	my $obj := make_one();
	ok(pir::isa__IPS($obj, 'TestClass'), 'New returns correct type');
}

sub test_method() {
	my $obj := make_one();
	
	is($obj.foo(), 13, 'Method called okay');
}