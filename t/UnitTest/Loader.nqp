#! /usr/bin/env parrot-nqp
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::UnitTest::Loader
	is UnitTest::Testcase ;

has	$!loader;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method set_up() {
	$!loader := UnitTest::Loader.new;
}

class Dummy::UnitTest::Testcase
	is UnitTest::Testcase {
	method not_at_all()	{ Exception.new("not a valid test").throw; }
	method not_a_test()	{ Exception.new("not a valid test").throw; }
	method _test()		{ Exception.new("not a valid test").throw; }
	method _test_x()		{ Exception.new("not a valid test").throw; }
	method testall()		{ Exception.new("not a valid test").throw; }
	method test_all()		{ 1; }
	method testAll()		{ 1; }
	method test1()		{ 1; }
}

our method test_load_tests_from_testcase() {
	my $suite := $!loader.load_tests_from_testcase(
		Dummy::UnitTest::Testcase
	);

	assert_equal( $suite.num_tests, 3,
		'Expected 3 tests');
}

sub str_cmp($a, $b) {
	my $aname := pir::getattribute__PPS($a, '$!name');
	my $bname := pir::getattribute__PPS($b, '$!name');
	(~$aname le ~$bname) ?? -1 !! 1;
}

class Dummy::Loader is UnitTest::Loader {
}

# NB: Lots of methods here to lower the probability of a failure because
# unsort happens to randomly put them back in order. (Weak, but hey!)
class Dummy::LoadOrder is UnitTest::Testcase {
	method test_alpha() { 1; }
	method test_bravo() { 1; }
	method test_charlie() { 1; }
	method test_delta() { 1; }
	method test_echo() { 1; }
	method test_foxtrot() { 1; }
	method test_golf() { 1; }
	method test_hotel() { 1; }
	method test_india() { 1; }
	method test_juliet() { 1; }
}

our method test_ordering() {
	$!loader := Dummy::Loader.new;

	my $suite := $!loader.load_tests_from_testcase(
		Dummy::LoadOrder
	);
	
	assert_false( Opcode::getattribute($suite, '@!members').is_sorted( cmp => Test::UnitTest::Loader::str_cmp ),
		'Default loader should unsort methods' );
}
