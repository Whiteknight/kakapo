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
		:name(		'Kakapo' ),
		:abstract(		'Run-time library for NQP programs on the Parrot VM' ),
		:authority(		'http://gitorious.org/austin' ),
		:copyright_holder(	'Austin Hastings' ),
		:doc_files(		<README CREDITS> ),
		:keywords( 		< library  nqp  parrot  runtime  stand alone  xunit 
					unit testing  matcher  pmc  methods  >),
		:license_type(	'Artistic License 2.0' ),
		:license_uri(		'http://www.perlfoundation.org/artistic_license_2_0' ),
		:checkout_uri(	'git://gitorious.org/kakapo/kakapo.git' ),
		:browser_uri(	'http://code.google.com/p/kakapo-parrot/' ),
		:project_uri(		'git://gitorious.org/kakapo/kakapo.git' ),

		:harness_files(		pir::join(' ', < 
			!t/Pmc
			!t/Structure
			t
		>) ),
		
		:release_id(			'release-9' ),
		:release_dir_format(	'released/%s'),
		:vdd_file(			'vdd.txt' ),
	);

	%kakapo<copy_templates><library/krt0.pir>			:= <src/Internals/krt0.pir_tmpl>;
	%kakapo<copy_templates><src/Internals/kakapo_bottom.pir> := <src/Internals/kakapo_bottom.pir_tmpl>;
	%kakapo<copy_templates><src/Internals/kakapo_top.pir>	:= <src/Internals/kakapo_top.pir_tmpl>;
	
	%kakapo<pir_nqp-rx><src/Internals/Base.pir>	:= <src/Internals/Base.nqp>;
	%kakapo<pir_nqp-rx><src/Internals/Full.pir>	:= <src/Internals/Full.nqp>;

	my @base_pir_files := <
		src/Global.pir
		src/Syntax.pir

		src/Internals/Kakapo.pir 
		
		src/Parrot/Opcode.pir
		src/Parrot/Parrot.pir
		src/Parrot/Pir.pir
		
		src/Pmc/Array.pir
		src/Pmc/Class.pir
		src/Pmc/common-methods.pir
		src/Pmc/Exception.pir
			src/Exceptions.pir
		src/Pmc/File.pir
		src/Pmc/Key.pir
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
		src/CallSignature.pir
		
		src/Classes/P6object.pir
		src/Classes/P6metaclass.pir

		src/ComponentMarshaller.pir
		src/DependencyQueue.pir
		src/FileSystem.pir
		src/Library.pir

		src/Matchers/Boolean.pir
		src/Matchers/CallSig.pir
		src/Matchers/Factory.pir
		src/Matchers/InstanceOf.pir
		src/Matchers/Matcher.pir
		src/Matchers/Not.pir
		src/Matchers/Null.pir
		src/Matchers/PassFail.pir
		
		src/Cuculinae/Antiphon.pir
		src/Cuculinae/Cuculus.pir
		src/Cuculinae/Cuckoo.pir
		src/Cuculinae/Ovum.pir
		src/Cuculinae/SigMatcher.pir
		src/Cuculinae/Verifier.pir
		
		src/Path.pir
		src/Program.pir
		
		src/UnitTest/Assertions.pir
		src/UnitTest/Listeners.pir
		src/UnitTest/Loader.pir
		src/UnitTest/Result.pir
		src/UnitTest/Standalone.pir
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

	%kakapo<strip_annotations> := %kakapo<build_libs>;
	
	%kakapo<pbc_pir><library/kakapo_base.pbc>	:= <library/kakapo_base.pir>;
	%kakapo<pbc_pir><library/kakapo_full.pbc>	:= <library/kakapo_full.pir>;
	%kakapo<pbc_pir><library/krt0.pbc>		:= <library/krt0.pir>;

	%kakapo<release_files><kakapo_base.pir>	:= <library/kakapo_base.pir>;
	%kakapo<release_files><kakapo_base.pbc>	:= <library/kakapo_base.pbc>;
	%kakapo<release_files><kakapo_full.pir>	:= <library/kakapo_full.pir>;
	%kakapo<release_files><kakapo_full.pbc>	:= <library/kakapo_full.pbc>;
	%kakapo<release_files><krt0.pir>			:= <library/krt0.pir>;
	%kakapo<release_files><krt0.pbc>		:= <library/krt0.pbc>;

	# This test file needs compiling so the others can load it.
	%kakapo<pir_nqp-rx><t/Pmc/common-methods.pir> := <t/Pmc/common-methods.nqp>;
	
	register_step_before('build', Setup::Step::copy_templates);
	register_step_before('clean', Setup::Step::clean_templates);
	
	#install_build_libs();
	install_substep('build', Setup::Step::build_libs, :before('_build_pbc_pir'));
	install_substep('build', Setup::Step::strip_annotations, :before('_build_pbc_pir'));
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

sub install_substep($step, &func, :$before, :$after) {
	my $target := $before // $after;
	my @insert;
	@insert.push(&func);
	
	our %step;
	my $index := ?$after;
	for %step{$step} {
		if ~ $_ eq $target {
			pir::splice__vppii(%step{$step}, @insert, $index, 0);
			return 0;
		}
		
		$index++;
	}
	
	pir::die("Unable to insert substep &func into $step - could not find $target");
}


# distutils functions are not in a namespace, so Step:: methods can't address them 
# directly.

sub needs_update($src, $dst, :$verbose) {
	
	! file_exists($dst) ||newer(~$src, $dst, :verbose($verbose));
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
	my $output_file;
	my @inputs;
	my $needs_update;
	my $command;
	
	for %config<build_libs> {
		$output_file := ~ $_;
		@inputs := %config<build_libs>{$output_file};
		$needs_update := 0;
		
		unless newer(~$output_file, @inputs) {
			$command := 'cat ' 
				~ pir::join(' ', @inputs)
				~ ' > '
				~ $output_file;
			system($command, :verbose(1));
		}
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
		my $src := %cfg{$_};
		my $dst := ~ $_;
		
		unless newer(~$dst, ~$src) {
			cp($src, $dst, :verbose(1));
		}
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

sub strip_annotations(*%config) {
	for %config<strip_annotations> {
		if file_exists(~$_) {
			my $fh := pir::open__PSS(~$_, 'r');
			my $body := $fh.readall();
			$fh.close;

			if pir::index__ISS($body, "\n.annotate ") >= 0 {
				say("Removing annotations from $_");
				$body.replace("\n.annotate ", "\n# .annotate ");
				$fh := pir::open__PSS(~$_, 'w');
				$fh.puts($body);
				$fh.close;
			}				
		}
	}
}
