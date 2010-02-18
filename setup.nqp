#! /usr/bin/env parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# =head1 NAME
#
# setup.nqp - Configure and build the Kakapo library.
#
# =head1 USAGE
#
#     $ parrot-nqp setup.nqp build
#     $ parrot-nqp setup.nqp test
#     $ sudo parrot-nqp setup.nqp install

INIT {
	pir::load_language('parrot');
	pir::load_bytecode('distutils.pbc');
	
	pir::load_bytecode('dumper.pir');
}

MAIN();

sub new_hash(*%hash) {
	%hash;
}

sub MAIN() {
	my %kakapo := new_hash(
		:name(	'Kakapo' ),
		:abstract(	'Run-time library for NQP programs on the Parrot VM' ),
		:authority(	'http://gitorious.org/austin' ),
		:copyright_holder( 'Austin Hastings' ),
		:doc_files(	<README CREDITS> ),
		:keywords( 	< library  nqp  parrot  runtime  stand alone  xunit 
				unit  testing  matcher  pmc  methods  >),
		:license_type(	'Artistic License 2.0' ),
		:license_uri(	'http://www.perlfoundation.org/artistic_license_2_0' ),
		:checkout_uri(	'git://gitorious.org/kakapo/kakapo.git'),
		:browser_uri(	'http://code.google.com/p/kakapo-parrot/'),
		:project_uri(	'git://gitorious.org/kakapo/kakapo.git'),
		
	);

	my @base_nqp_files := <
		src/Global
		
		src/Parrot/Opcode
		src/Parrot/Parrot
		src/Parrot/Pir
		
		src/Pmc/Array
		src/Pmc/common_methods
		src/Pmc/Exception
			src/Exceptions
		src/Pmc/Hash
		src/Pmc/Namespace
		src/Pmc/String
		src/Pmc/Sub
		src/Pmc/Undef
	>;
	
	for @base_nqp_files {
		%kakapo{'pir_nqp-rx'}{~ $_ ~ '.pir'} := ~$_ ~ '.nqp';
	}
	
	my @full_nqp_files := <
		src/Classes/P6object
		src/Classes/P6metaclass
		src/UnitTest/Listeners
		src/UnitTest/Loader
		src/UnitTest/Result
		src/UnitTest/Suite
		src/UnitTest/Testcase
	>;
	
	for @full_nqp_files {
		%kakapo{'pir_nqp-rx'}{~ $_ ~ '.pir'} := ~$_ ~ '.nqp';
	}

	%kakapo<pbc_pir>{'library/kakapo_base.pbc'} := < library/kakapo_base.pir >;
	%kakapo<pbc_pir>{'library/kakapo_full.pbc'} := < library/kakapo_full.pir >;
	
	Q:PIR {
		$P0 = find_lex '%kakapo'
		'setup'($P0 :flat :named)
	};
}

sub cat_files(*%config) {
	if %config<cat_files> {
		
	}
}
