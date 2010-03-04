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

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

method test_is_equal() {
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

method test_new() {
	verify_that( "'new' returns an object of the right type" );		
	my $object := $!class.new;

	assert_not_null($object, 'New should return a valid object');
	assert_isa($object, 'Hash', 'New should return a Hash object');
}

