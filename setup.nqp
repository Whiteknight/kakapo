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

MAIN(get_args());

sub new_hash(*%hash) {
	%hash;
}

sub MAIN(@argv) {
	
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
		:checkout_uri(	'git://gitorious.org/kakapo/kakapo.git' ),
		:browser_uri(	'http://code.google.com/p/kakapo-parrot/' ),
		:project_uri(	'git://gitorious.org/kakapo/kakapo.git' ),

		:harness_files(	't/bootstrap' ),
		
		:release_id(		'release-3' ),
		:release_dir_format( 'released/%s'),
		:vdd_file(		'vdd.txt' ),
	);

	%kakapo<copy_templates><library/krt0.pir>				:= <src/Internals/krt0.pir_tmpl>;
	%kakapo<copy_templates><src/Internals/kakapo_bottom.pir>	:= <src/Internals/kakapo_bottom.pir_tmpl>;
	%kakapo<copy_templates><src/Internals/kakapo_top.pir>		:= <src/Internals/kakapo_top.pir_tmpl>;
	

	%kakapo<pir_nqp-rx><src/Internals/Base.pir>				:= <src/Internals/Base.nqp>;
	%kakapo<pir_nqp-rx><src/Internals/Full.pir>				:= <src/Internals/Full.nqp>;

	my @base_pir_files := <
		src/Global.pir
		
		src/Parrot/Opcode.pir
		src/Parrot/Parrot.pir
		src/Parrot/Pir.pir
		
		src/Pmc/Array.pir
		src/Pmc/common_methods.pir
		src/Pmc/Exception.pir
			src/Exceptions.pir
		src/Pmc/Hash.pir
		src/Pmc/Namespace.pir
		src/Pmc/String.pir
		src/Pmc/Sub.pir
		src/Pmc/Undef.pir
	>;
	
	for @base_pir_files {
		%kakapo<pir_nqp-rx>{~ $_} := change_ext(~$_, :from('.pir'), :to('.nqp'));
	}
	
	%kakapo<build_libs><library/kakapo_base.pir> := <
		src/Internals/kakapo_top.pir
		src/Internals/Base.pir
	>;
	%kakapo<build_libs><library/kakapo_base.pir>.append( @base_pir_files );
	%kakapo<build_libs><library/kakapo_base.pir>.push( <src/Internals/kakapo_bottom.pir>);
	
	my @full_pir_files := <
		src/Classes/P6object.pir
		src/Classes/P6metaclass.pir
		src/UnitTest/Listeners.pir
		src/UnitTest/Loader.pir
		src/UnitTest/Result.pir
		src/UnitTest/Suite.pir
		src/UnitTest/Testcase.pir
	>;
	
	for @full_pir_files {
		%kakapo<pir_nqp-rx>{~ $_} := change_ext(~$_, :from('.pir'), :to('.nqp'));
	}

	%kakapo<build_libs><library/kakapo_full.pir> := <
		src/Internals/kakapo_top.pir
		src/Internals/Full.pir
	>;
	%kakapo<build_libs><library/kakapo_full.pir>.append( @base_pir_files );
	%kakapo<build_libs><library/kakapo_full.pir>.append( @full_pir_files );
	%kakapo<build_libs><library/kakapo_full.pir>.push( <src/Internals/kakapo_bottom.pir>);
	
	%kakapo<pbc_pir><library/kakapo_base.pbc>	:= <library/kakapo_base.pir>;
	%kakapo<pbc_pir><library/kakapo_full.pbc>	:= <library/kakapo_full.pir>;

	%kakapo<release_files><kakapo_base.pir> := <library/kakapo_base.pir>;
	%kakapo<release_files><kakapo_base.pbc> := <library/kakapo_base.pbc>;
	%kakapo<release_files><kakapo_full.pir>	:= <library/kakapo_full.pir>;
	%kakapo<release_files><kakapo_full.pbc>	:= <library/kakapo_full.pbc>;
	%kakapo<release_files><krt0.pir>		:= <library/krt0.pir>;
	
	register_step_before('build', Setup::Step::copy_templates);
	register_step_before('clean', Setup::Step::clean_templates);
	
	install_build_libs();
	register_step_before('clean', Setup::Step::clean_libs);
	
	register_step('release', Setup::Step::make_release);
	
	pir::shift(@argv);
	setup_(@argv, %kakapo);
}

sub change_ext($file, :$from!, :$to!) {
	my $len := pir::length__IS($file) - pir::length__IS($from);
	
	unless pir::substr__SSI($file, $len) eq $from {
		pir::die("No matching extension '$from' on file: $file");
	}
	
	my $base := pir::substr__SSI($file, 0, $len);
	$base ~ $to;	
}

sub get_args() {
	my $interp := pir::getinterp__P();
	$interp[2];
}

sub install_build_libs() {
	our %step;
	my @inches := %step<build>;
	my $index := 0;
	
	for @inches {
		if ~ $_ eq '_build_pbc_pir' {
			my @new;
			@new.push(Setup::Step::build_libs);
			pir::splice__vppii(@inches, @new, $index, 0);
			return 0;
		}
		
		$index++;
	}
	
	pir::die("Unable to insert build_libs step into build - could not find _build_pbc_pir");
}

sub is_dir($path) {
	pir::stat__ISI($path, 2);
}

sub setup_(@steps, %config) {
	Q:PIR {
		$P0 = find_lex '@steps'
		$P1 = find_lex '%config'
		'setup'($P0 :flat, $P1 :flat :named)
	};
}

module Setup::Step;

sub build_libs(*%config) {
	for %config<build_libs> {
		my $output := ~ $_;
		my @inputs := %config<build_libs>{$output};

		my $command := 'cat ' 
			~ pir::join(' ', @inputs)
			~ ' > '
			~ $output;
		system($command, :verbose(1));
	}
}

sub clean_libs(*%config) {
	clean_key(%config<build_libs>);
}

sub clean_templates(*%config) {
	clean_key(%config<copy_templates>);
}
	
sub copy_templates(*%config) {
	my %cfg := %config<copy_templates>;
	for %cfg {
		cp(%cfg{$_}, ~$_, :verbose(1));
	}
}

sub make_release(*%config) {
	my $release_id := %config<release_id>;
	unless $release_id {
		pir::die("Cannot release: <release_id> config not set");
	}
	
	my @args;
	@args.push( $release_id );
	
	my $release_dir := pir::sprintf__SSP(%config<release_dir_format>, @args);

	if file_exists($release_dir) {
		pir::die("Cannot release: '$release_dir' already exists.");
	}
	
	my $vdd := %config<vdd_file>;
	
	unless $vdd && file_exists($vdd) {
		pir::die("Cannot release: no Version Description Document provided. Set <vdd_file> config.");
	}
	
	my $fh := pir::open__PSS($vdd, 'r');
	my $leader := $fh.readline;
	$fh.close;
	
	if pir::index__ISS($leader, $release_id) < 0 {
		pir::die("Cannot release: VDD file '$vdd' does not contain '$release_id' in line 1");
	}
	
	my %cfg := %config<release_files>; 
	my $installed_vdd := 0;
	
	for %cfg {
		install(%cfg{~$_}, $release_dir ~ '/' ~$_, :verbose(1));
		
		if %cfg{~$_} eq $vdd {
			$installed_vdd++;
		}
	}

	unless $installed_vdd {
		install($vdd, $release_dir ~ '/VERSION', :verbose(1));
	}
	
	unlink($vdd, :verbose(1));
}
