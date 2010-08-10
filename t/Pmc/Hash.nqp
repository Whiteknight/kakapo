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

INIT {
	pir::load_bytecode('t/Pmc/common-methods.pbc');
}

class Test::Pmc::Hash
	is Test::Pmc::COMMON;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method test_is_equal() {
	verify_that( "'is_equal' performs correctly" );

	my $h1 := $!class.new;
	$h1<a> := 1;
	$h1<z> := 'fizbin';

	my $h2 := $!class.new;
	$h2<z> := 'fizbin';
	$h2<a> := 1;

	assert_true($h1.is_equal($h2), 'The two hashes are equal');

	my %h3 := $!class.new;
	%h3<z> := 'fizbin';
	%h3<a> := 1.0;

	assert_true(%h3.is_equal($h1), 'Float 1.0 equals 1');
}

our method test_merge() {
	my %a := Hash.new(	:a(1),	:b(1),	:c(1) );
	my %b := Hash.new( :a(2),	:d(2),	:e(2) );
	my %c := Hash.new( :b(3),	:d(3),	:f(3) );

	my %m := %a.merge(%b, %c);
	
	assert_same( %a, %m,
		'Merge into %a' );
	
	assert_equal( 1, %a<a>,
		'Leftmost value takes precedence' );
	assert_equal( 1, %a<b>,
		'Leftmost value takes precedence' );
	assert_equal( 1, %a<c>,
		'Leftmost value takes precedence' );
	assert_equal( 2, %a<d>,
		'Leftmost value takes precedence' );
	assert_equal( 2, %a<e>,
		'Leftmost value takes precedence' );
	assert_equal( 3, %a<f>,
		'Leftmost value takes precedence' );
}

our method test_merge_into() {

	my %a := Hash.new(	:a(1),	:b(1),	:c(1) );
	my %b := Hash.new( :a(2),	:d(2),	:e(2) );
	my %c := Hash.new( :b(3),	:d(3),	:f(3) );

	my %m := %a.merge( :into(Hash.new), %b, %c);

	assert_not_same( %a, %m,
		'Should merge into new hash' );
	
	assert_equal( 1, %m<a>,
		'Leftmost value takes precedence' );
	assert_equal( 1, %m<b>,
		'Leftmost value takes precedence' );
	assert_equal( 1, %m<c>,
		'Leftmost value takes precedence' );
	assert_equal( 2, %m<d>,
		'Leftmost value takes precedence' );
	assert_equal( 2, %m<e>,
		'Leftmost value takes precedence' );
	assert_equal( 3, %m<f>,
		'Leftmost value takes precedence' );
}

our method test_merge_right() {
	my %a := Hash.new(	:a(1),	:b(1),	:c(1) );
	my %b := Hash.new( :a(2),	:d(2),	:e(2) );
	my %c := Hash.new( :b(3),	:d(3),	:f(3) );

	my %m := %a.merge( :priority('right'), %b, %c);
	
	assert_same( %a, %m,
		'Merge into %a' );
	
	assert_equal( 2, %a<a>,
		'Rightmost value takes precedence' );
	assert_equal( 3, %a<b>,
		'Rightmost value takes precedence' );
	assert_equal( 1, %a<c>,
		'Rightmost value takes precedence' );
	assert_equal( 3, %a<d>,
		'Rightmost value takes precedence' );
	assert_equal( 2, %a<e>,
		'Rightmost value takes precedence' );
	assert_equal( 3, %a<f>,
		'Rightmost value takes precedence' );
}

our method test_new() {
	verify_that( "'new' returns an object of the right type" );
	my $object := $!class.new;

	assert_not_null($object, 'New should return a valid object');
	assert_isa($object, 'Hash', 'New should return a Hash object');
}

