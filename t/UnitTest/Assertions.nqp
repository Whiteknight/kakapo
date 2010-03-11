#! /usr/bin/env parrot-nqp
# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::UnitTest::Assertions
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

method test_assert_block_pass() {
	verify_that( 'assert_block does nothing if the block passes' );
	want_pass('Should pass - block throws nothing', { assert_block("Block passed", { 1 }); });
}

method test_assert_block_fail() {
	verify_that( 'assert_block throws an UnitTestFailure if block fails' );
	want_fail('Should fail - block returns 0', { assert_block('Block failed', { 0 }); });
}

method test_assert_block_false() {
	verify_that( 'assert_block_false does nothing if the block fails' );
	assert_block_false("Block failed", {0});
}

method test_assert_block_false_pass() {
	verify_that( 'assert_block_false throws an UnitTestFailure if block passes' );

	try {
		assert_block_false("Block passed", { 1 });
		fail('Assert_block_false should throw an exception');

		CATCH {
			unless $!.type == Exception::UnitTestFailure.type {
				$!.rethrow;
			}
		}
	};
}

class Exception::TestAssertThrows is Exception::Wrapper {
}

method test_assert_throws() {
	verify_that( 'assert_throws catches thrown exception and passes' );
	assert_throws(Exception::TestAssertThrows, 'Throws exception', {
		Exception::TestAssertThrows.new.throw;
	});
}

class Exception::TestAssertThrowsWrongType is Exception::Wrapper {
}

method test_assert_throws_wrong_type() {
	verify_that( 'assert_throws catches wrong exceptions and marks a failure' );

	my $pass := 0;

	try {
		assert_throws(Exception::TestAssertThrows, 'Throws exception', {
			Exception::TestAssertThrowsWrongType.new.throw;
		});

		CATCH {
			if $!.type == Exception::UnitTestFailure.type {
				$pass := 1;
			}
		}
	};

	unless $pass {
		Exception::UnitTestFailure.new(:message("assert_throws didn't throw an error, or threw wrong type"));
	}
}

method test_assert_throws_doesnt_throw() {
	verify_that( 'assert_throws requires an exception be thrown' );

	my $pass := 0;

	try {
		assert_throws(Exception::TestAssertThrows, 'Throws exception', { 1 });

		CATCH {
			if $!.type == Exception::UnitTestFailure.type {
				$pass := 1;
			}
		}
	};

	unless $pass {
		Exception::UnitTestFailure.new(:message("assert_throws didn't throw an error, but should"));
	}
}

method test_assert_throws_nothing() {
	assert_throws_nothing("Throws nothing", { 0 });
}

method test_assert_throws_nothing_fails() {
	assert_throws(Exception::UnitTestFailure, 'Throws something unexpected', {
		assert_throws_nothing('Throws nothing',
			{ Exception::TestAssertThrowsWrongType.new.throw }); });
}

method test_assert_same() {
	my $s := "Hello, world.";

	assert_same($s, $s, "Same objects");
}

method test_assert_same_fails() {
	my $s := "Hello, world.";
	my $t := "Hello, world.";

	assert_throws(Exception::UnitTestFailure, 'Should throw error - not same objects',
		{ assert_same($s, $t, 'Same object'); });
}

method test_assert_not_same() {
	my $s := "Hello, world.";
	my $t := "Hello, world.";

	assert_not_same($s, $t, 'Not same object');
}

method test_assert_not_same_fails() {
	my $s := "Hello, world.";
	my $t := $s;

	want_fail('Should fail - not same objects', { assert_not_same($s, $t, 'Not same object'); });
}

method test_assert_null() {
	my $s := NoSuchSymbol;
	want_pass('Should pass with null arg', { assert_null($s, 'Null pmc'); });
}

method test_assert_null_fails() {
	my $s := 'foo';
	want_fail('Should fail - not null', { assert_null($s, 'Null pmc'); });
}

method test_assert_not_null() {
	my $s := 'foo';
	want_pass('Should pass - not null', { assert_not_null($s, 'Not null'); });
}

method test_assert_not_null_fails() {
	my $s := NoSuchSymbol;
	want_fail('Should fail - null symbol', { assert_not_null($s, 'Not null'); });
}

class Test::AssertCan {
	method xyzzy() { 0 }
}

method test_assert_can() {
	my $obj := Test::AssertCan.new;
	want_pass('Should pass - has method', { assert_can($obj, 'xyzzy', 'Has method'); });
}

method test_assert_can_fails() {
	my $obj := Test::AssertCan.new;
	want_fail('Should fail - lacks method', { assert_can($obj, 'mumble', 'Lacks method'); });
}

method test_assert_can_not() {
	my $obj := Test::AssertCan.new;
	want_pass('Should pass - lacks method', { assert_can_not($obj, 'mumble', 'Lacks method'); });
}

method test_assert_can_not_fails() {
	my $obj := Test::AssertCan.new;
	want_fail('Should fail - has method', { assert_can_not($obj, 'xyzzy', 'Has method'); });
}

method test_assert_equal() {
	want_pass('Equal objects', { assert_equal(1, 1, 'equal'); });
}

method test_assert_equal_fails() {
	my $s1 := 'foo';
	my $s2 := 'food';
	want_fail('Inequal objects', { assert_equal($s1, $s2, 'inequal'); });
}

method test_assert_equal_fails2() {
	my $n1 := 10.0001;
	my $n2 := 10.00001;
	want_fail('Inequal objects', { assert_equal($n1, $n2, 'inequal2'); });
}

method test_assert_not_equal() {
	want_pass('Inequal objects', { assert_not_equal(1, 0, 'not equal'); });
}

method test_assert_not_equal_fails() {
	my $s1 := 'foo';
	my $s2 := 'foo';
	want_fail('equal objects', { assert_not_equal($s1, $s2, 'equal'); });
}

method test_within_delta() {
	my $n1 := 10.00000001;
	my $n2 := 10.00000002;
	want_pass('Within a smidge', { assert_within_delta($n1, $n2, 0.0001, 'close enough'); });
}

method test_within_delta_fails() {
	my $n1 := 10.0001;
	my $n2 := 10.0002;
	want_fail('Not close enough', { assert_within_delta($n1, $n2, 0.000001, 'close enough'); });
}

class Test::AssertIsa is Test::AssertCan {
	method foo() {1 }
}

method test_assert_isa() {
	my $obj := Test::AssertIsa.new();
	want_pass('AssertIsa is  a AssertCan', { assert_isa($obj, Test::AssertCan, 'isa'); });
}

method test_assert_isa_fails() {
	my $obj := Test::AssertIsa.new();
	want_fail('AssertIsa is not a Testcase', { assert_isa($obj, UnitTest::Testcase, '!isa'); });
}

method test_assert_not_isa() {
	my $obj := Test::AssertIsa.new();
	want_pass('AssertIsa is not a Testcase', { assert_not_isa($obj, UnitTest::Testcase, '!isa'); });
}

method test_assert_not_isa_fails() {
	my $obj := Test::AssertIsa.new();
	want_fail('AssertIsa is a AssertCan', { assert_not_isa($obj, Test::AssertCan, 'isa'); });
}

method test_instance_of() {
	my $obj := Test::AssertIsa.new();
	want_pass('instance of assert-isa', { assert_instance_of($obj, Test::AssertIsa, 'assert-isa'); });
}

method test_instance_of_fails() {
	my $obj := Test::AssertIsa.new();
	want_fail("instance - subclasses don't count", { assert_instance_of($obj, Test::AssertCan, 'assert-can'); });
}

method test_not_instance_of() {
	my $obj := Test::AssertIsa.new();
	want_pass('not instance of assert-isa', { assert_not_instance_of($obj, Test::AssertCan, 'assert-can'); });
}

method test_not_instance_of_fails() {
	my $obj := Test::AssertIsa.new();
	want_fail("is instance of assert-isa", { assert_not_instance_of($obj, Test::AssertIsa, 'assert-isa'); });
}

method test_assert_true() {
	want_pass("true should pass", { assert_true(1, 'true'); });
}

method test_assert_true_fails() {
	want_fail("false should fail", { assert_true(0, 'false'); });
}

method test_assert_false() {
	want_pass("false should pass", { assert_false(0, 'false'); });
}

method test_assert_false_fails() {
	want_fail("true should fail", { assert_false(1, 'true'); });
}

method test_assert_defined_fails() {
    want_fail("Undef should fail", { assert_defined(Parrot::new("Undef"), "Undef"); });
}

method test_assert_defined() {
    want_pass("not-Undef should not fail", { assert_defined(1, "Not Undef"); });
}

method test_assert_not_defined_fails() {
    want_fail("not Undef should fail", { assert_not_defined(1, "Not Undef"); });
}

method test_assert_not_defined() {
    want_pass("Undef should pass", { assert_not_defined(Parrot::new("Undef"), "Undef"); });
}
