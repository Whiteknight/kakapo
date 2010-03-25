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

class Test::Pmc::NameSpace
	is UnitTest::Testcase;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

MAIN();

sub MAIN() {

	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

method test_string_name() {
	my $sut := pir::get_namespace__P();

	fail_unless( $sut.WHO.can( 'string_name' ),
		'NameSpace should have string_name method');
	fail_unless( $sut.string_name eq 'Test::Pmc::NameSpace',
		'Default name is no-hll with ::');
	fail_unless( $sut.string_name(:with_hll) eq 'parrot::Test::Pmc::NameSpace',
		':with_hll should prepend parrot::');
	fail_unless( $sut.string_name(:format('pir')) eq "['Test'; 'Pmc'; 'NameSpace']",
		':format(pir) should use [ ; ; ] style');
}

method test_fetch_basic() {
	my $nsp := NameSpace.fetch: 'No::Such::Namespace'; 
	
	assert_isa( $nsp, 'NameSpace',
		'Fetch should return a NameSpace instance');
	
	assert_equal( $nsp.get_name, <parrot::No::Such::Namespace>.split('::'),
		'Fetch should automatically add hll name');
}

