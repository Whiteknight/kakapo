#! parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {	
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	say("Root dir is: ", $root_dir);
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Global 
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
	
	has(	'$.namespace');
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

method set_up() {
	self.namespace(pir::get_namespace__P());
}

# NOTE: While Testcase runs these tests with a new object, the namespace is persistent. So
# be sure to allow for sub-namespaces, symbols, and names carrying over from test to test.

method test_export_adds_shared_object_to_correct_subnamespace() {
	my $nsp := self.namespace;

	if $nsp<EXPORT><test1>.defined {
		fail("Did not expect 'test1' export namespace to be defined");
	}
	
	our $var1 := 'var-1';
	Global::export('$var1', :tags('test1'));
	
	unless $nsp<EXPORT><test1>.defined {
		fail("Export namespace 'test1' not created by export()");
	}
	
	# Namespace doesn't get a good isa method, I think. Use pir
	unless pir::isa__IPS($nsp<EXPORT><test1>, 'NameSpace') {
		fail("Export namespace 'test1' is not a NameSpace");
	}
	
	unless $nsp<EXPORT><test1><$var1> eq 'var-1' {
		fail("Exported symbol $var1 has wrong value: wrong object?");
	}
}

method test_() {
	my $bar := 212;
	
	
}

method foo() {	
	my $nsp;
	my $foo;
	self.assert_that("Tag DEFAULT nsp", $nsp<EXPORT><DEFAULT>, is(not(defined())));
	our $bar := 212;
	Global::export('$bar');
	self.assert_that("DEFAULT $bar", $nsp<EXPORT><DEFAULT>{'$bar'}, is(212));
	
	self.assert_that("DEFAULT hamilton", $nsp<EXPORT><DEFAULT><hamilton>, is(not(defined())));
	Global::export(Kakapo::Test::Global::test_export, :as('hamilton'));
	self.assert_that("Exported hamilton", $nsp<EXPORT><DEFAULT><hamilton>, 
		is(same_as(Kakapo::Test::Global::test_export)));

	self.assert_that("FOO $x", $nsp<EXPORT><FOO>{'$x'}, is(not(defined())));
	self.assert_that("FOO $y", $nsp<EXPORT><FOO>{'$y'}, is(not(defined())));
	our $x := 0;
	our $y := 0;
	Global::export('$x', '$y', :tags('FOO'));
	self.assert_that("FOO $x", $nsp<EXPORT><FOO>{'$x'}, is(defined()));
	self.assert_that("FOO $y", $nsp<EXPORT><FOO>{'$y'}, is(defined()));
	
	# Check that everything from above was copied into 'ALL'
	
	self.assert_that('ALL $foo', $nsp<EXPORT><ALL>{'$foo'}, is(same_as($foo)));
	self.assert_that('ALL $bar', $nsp<EXPORT><ALL>{'$bar'}, is(same_as($bar)));
	self.assert_that('ALL hamilton', $nsp<EXPORT><ALL>{'hamilton'},
		is(same_as(Kakapo::Test::Global::test_export)));
	self.assert_that('ALL $x', $nsp<EXPORT><ALL>{'$x'}, is(same_as($x)));
	self.assert_that('ALL $y', $nsp<EXPORT><ALL>{'$y'}, is(same_as($y)));
}

method Xtest_register_global() {
	
	self.note("Testing Global::register_global() function");
	
	Global::register_global('ONE', 1);
	
	self.assert_that('Registered symbol', Global::ONE, is(1));
	
	our $x := '10';
	Global::register_global('$X', $x);
	
	our $X;
	Global::use(:symbols('$X'));
	self.assert_that('Imported global', $X, is(10));
	
	self.assert_that('Other global', OtherGlobal::Y, is(not(defined())));
	our $y := 'wye';
	Global::register_global('Y', $y, :namespace('OtherGlobal'));
	self.assert_that('Other global', OtherGlobal::Y, is('wye'));
}

method Xtest_use() {
	
	self.note("Testing Global::use() function");
	
	my $nsp := pir::get_namespace__P();
	GlobalTest::_ONLOAD();
	
	self.assert_that('Imported symbol', $nsp{'hamilton'}, is(not(defined())));
	
	Global::use(GlobalTest, :import('BEAR'));

	self.assert_that('Imported function', hamilton(), returns("oh, bother"));
	self.assert_that('External symbol', $nsp{'$x'}, is(not(defined())));
	
	Global::use(GlobalTest);
	
	self.assert_that('Imported var', $nsp{'$x'}, is(defined()));
	
	self.assert_that('Imported symbol', $nsp{'lucifer'}, is(not(defined())));
	Global::use(GlobalTest, :symbols('lucifer'));
	self.assert_that("Imported function", lucifer(), returns(true()));
}

module GlobalTest {

	our $x;

	sub foo() {
		return 'oof';
	}

	sub pooh() {
		return 'oh, bother';
	}

	sub lucifer() {
		return "we don't need no stinking matchers!";
	}
	
	_ONLOAD();

	sub _ONLOAD() {
		$x := 1;
		Global::export(GlobalTest::pooh, :as('hamilton'), :tags('BEAR'));
		Global::export('lucifer', :tags('NONESUCH'));
		Global::export('$x', 'foo');
	}
}
