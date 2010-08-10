#! parrot-nqp
# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::P6object
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

class Test::Abstract {
	method abstr() { self.__ABSTRACT__; }
}

our method test_abstract() {
	my $ta := Test::Abstract.new;
	my $exception;
	
	try {
		$ta.abstr;
		fail( 'Abstract method should throw an exception' );
		
		CATCH {
			$exception := $!;
		}
	};
	fail_unless( $exception.message eq "Invalid call to abstract method 'abstr'",
		'Abstract method should throw a helpful diagnostic exception');
}