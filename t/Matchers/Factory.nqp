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

class Test::Matcher::Factory
	is UnitTest::Testcase ;
	
INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

class Test::ExportSub {
	method a() {
		use( 'Matcher::Factory' );
	}
	
	method b() {
		test_export_sub();
	}
}

sub foo() {
	'Pass!'
}

our method test_export_sub() {
	my $sut := Test::ExportSub.new();
	
	try {
		$sut.b();
		fail( 'Sut should throw a null-invoke exception');
		
		CATCH { }
	};

	Matcher::Factory::export_sub(Test::Matcher::Factory::foo,  :as('test_export_sub'));
	$sut.a();
	fail_unless( $sut.b() eq 'Pass!',
		'foo() should be exported via M::Factory as test_export_sub()');
}
