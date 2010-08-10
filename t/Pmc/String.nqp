#! /usr/bin/env parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Pmc::String
	is UnitTest::Testcase ;

has 	$!s1;
has	$!s2;

INIT {
	use(	'UnitTest::Testcase' );	
	use(	'UnitTest::Assertions' );	
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method set_up() {
	$!s1 := "Hello, ";
	$!s2 := "world!";
}

our method test_substr_positive_values() {
	assert_equal( "el", $!s1.substr(1, 2),
		"Simple positive offsets 1,2 should get 'el'" );
	
	assert_equal( "wor", $!s2.substr(0, 3),
		"Simple positive offsets 0,3 should get 'wor'");

	my $bad_start := $!s1.length + 1;
	assert_throws( Control::Error, 'Too-large start offset should die',
	{
		$!s1.substr($bad_start, 2);
	});
}

our method test_substr_default_limit() {
	assert_equal( "lo, ", $!s1.substr(3),
		"Default limit is eos");
}

our method test_substr_negative_start() {
	assert_equal( ',', $!s1.substr(-2, 1),
		"Negative start -2,1 should get ','");

	my $bad_start := -( $!s1.length + 1 );
	assert_throws( Control::Error, 'Too-low negative index should die', 
		{ $!s1.substr($bad_start, 2); });
}

our method test_substr_negative_limit() {
	assert_equal( 'rl', $!s2.substr(2, -2),
		'Negative limit should remove chars from end of string: 2,-2 -> rl' );
}