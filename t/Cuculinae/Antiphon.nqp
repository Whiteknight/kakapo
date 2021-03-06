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

class Test::Cuculus::Antiphon
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
	use(	'Matcher::Factory' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

our method test_new() {
	verify_that( 'SUT is created okay, right class.' );
	
	my $sut := Cuculus::Antiphon.new;
	
	assert_isa( $sut, 'Cuculus::Antiphon',
		'SUT should be populated with object of the right class.');
}

our method test_match() {
	my $sut := Cuculus::Antiphon.new(:sig_matcher(pass()));	
	my $sig := CallSignature.new(:object('obj'), :method('meth'));
	
	assert_match($sig, $sut,
		'Should match any signature');
}

our method test_match_fails() {
	my $sut := Cuculus::Antiphon.new(:sig_matcher(fail()));
	my $sig := CallSignature.new(:object('obj'), :method('meth'));
	
	assert_not_match($sig, $sut,
		'Should always fail');
}

our method test_invoke_returns() {
	my $sut := Cuculus::Antiphon.new(:sig_matcher(pass()));
	
	$sut.will_return('abc');
	
	assert_equal( $sut.invoke(CallSignature.new()), 'abc', 
		'Invoke should return configured value');
}

class Exception::TestInvoke is Exception::Wrapper {
}

our method test_invoke_throws() {
	my $sut := Cuculus::Antiphon.new(:sig_matcher(pass()));
	
	$sut.will_throw(Exception::TestInvoke.new);
	
	assert_throws( Exception::TestInvoke, 'Invoke should throw configured exception',
		{ $sut.invoke(CallSignature.new); });
}

our method test_invoke_side_effects() {
	my $sut := Cuculus::Antiphon.new;
	
	my $x := 0;
	$sut.will_do( {$x++ } );
	$sut.will_do( {$x := $x * 2; } );
	$sut.will_do( {$x := $x + 7; } );
	
	$sut.invoke(CallSignature.new);
	
	assert_equal( $x, 9, 
		'Invoke should run the blocks in the right order.' );
}
