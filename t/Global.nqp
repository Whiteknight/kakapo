=file t/Global.nqp

Test the Global component of the Kakapo library.

=cut

module Kakapo::Test::Global;

Q:PIR { load_bytecode 'library/kakapo.pbc' };

_ONLOAD();

Kakapo::Test::Global.run_all_tests;
#Kakapo::Test::Global.run_tests('test_register_global');

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	Parrot::IMPORT('Dumper', q<ASSERT DUMP DUMP_ NOTE>);
	Parrot::IMPORT('Matcher::Factory');
	
	my $class_name := 'Kakapo::Test::Global';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Testcase',
	);	
}

method test_export() {
	
	self.note("Testing Global::export() function");
	
	my $nsp := Opcode::get_namespace();
	
	self.assert_that("Tag FOO namespace", $nsp<EXPORT><FOO>, is(not(defined())));
	our $foo := 'oof';
	Global::export('$foo', :tags('FOO'));
	self.assert_that("Tag FOO namespace", $nsp<EXPORT><FOO>, is(defined()));
	self.assert_that("Tag FOO namespace", $nsp<EXPORT><FOO>, is(instance_of('NameSpace')));
	self.assert_that("Tag FOO's $foo", $nsp<EXPORT><FOO>{'$foo'}, is('oof'));
	
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
	
	self.assert_that("ALL $foo", $nsp<EXPORT><ALL>{'$foo'}, is(same_as($foo)));
	self.assert_that("ALL $bar", $nsp<EXPORT><ALL>{'$bar'}, is(same_as($bar)));
	self.assert_that("ALL hamilton", $nsp<EXPORT><ALL>{'hamilton'},
		is(same_as(Kakapo::Test::Global::test_export)));
	self.assert_that("ALL $x", $nsp<EXPORT><ALL>{'$x'}, is(same_as($x)));
	self.assert_that("ALL $y", $nsp<EXPORT><ALL>{'$y'}, is(same_as($y)));
}

method test_register_global() {
	
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

method test_use() {
	
	self.note("Testing Global::use() function");
	
	my $nsp := Opcode::get_namespace();
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
