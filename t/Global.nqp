#! parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {	
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Global 
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
	
	has(	'$.namespace');
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

our method set_up() {
	self.namespace(pir::get_namespace__P());
}

# NOTE: While Testcase runs these tests with a new object, the namespace is persistent. So
# be sure to allow for sub-namespaces, symbols, and names carrying over from test to test.

our method test_export_adds_shared_object_to_correct_subnamespace() {
	my $id := 'test1';
	my $nsp := self.namespace;

	our $var1 := 'var-1';
	Global::export('$var1', :tags($id));
	
	unless $nsp<EXPORT>{$id}.defined {
		fail("Export namespace '$id' not created by export()");
	}
	
	# Namespace doesn't get a good isa method, I think. Use pir
	unless pir::isa__IPS($nsp<EXPORT>{$id}, 'NameSpace') {
		fail("Export namespace '$id' is not a NameSpace");
	}

	unless $nsp<EXPORT>{$id}.contains('$var1') {
		fail("Symbol '$var1' not exported");
	}
}

our method test_export_gets_correct_object() {
	my $id := 'test2';
	my $nsp := self.namespace;
	
	our $var2 := 212;
	Global::export('$var2', :tags($id));
	
	unless $nsp<EXPORT>{$id}<$var2> == $var2 {
		fail("Exported wrong value");
	}
	
	unless $nsp<EXPORT>{$id}<$var2> =:= $var2 {
		fail("Exported wrong pmc");
	}	
}

our method test_export_to_default_tag() {
	my $nsp := self.namespace;
	
	fail_if( $nsp<EXPORT><DEFAULT><bear>.defined,
		"Default export symbol 'bear' already exists");
		
	my $pmc := 3.14;
	Global::export($pmc, :as('pi'));
	
	fail_unless($nsp<EXPORT><DEFAULT><pi>.defined,
		"Symbol not exported to correct name in DEFAULT");
}

our method test_multiple_export_to_tag() {
	my $id := 'test3';
	my $nsp := self.namespace;

	our $v31 := '3.1';
	our $v32 := '3.2';
	our $v33 := '3.3';
	
	Global::export('$v31', '$v32', '$v33',  :tags($id));
	
	for < $v31 $v32 $v33 > {
		fail_unless( $nsp<EXPORT>{$id}{~ $_}.defined,
			"Failed to export symbol $_");
			
		fail_unless( $nsp{ ~$_ } =:= $nsp<EXPORT>{$id}{~ $_},
			"Exported wrong pmc: $_");
	}
}

our method test_exports_go_to_all() {
	my $nsp := self.namespace;
	
	our $v41 := 41;
	our $v42 := 42;
	
	Global::export('$v41');
	fail_unless($nsp<EXPORT><ALL><$v41> =:= $v41,
		"Default export not installed in all");
	
	Global::export('$v42', :tags('OTHER'));
	fail_unless($nsp<EXPORT><ALL><$v42> =:= $v42,
		"Tagged export not installed in all");
}

our method test_registering_global_from_constant() {
	Global::register_global('ONE', 1);
	
	fail_unless(Global::ONE == 1,
		"Constant 1 not globally registered");
}

our method test_registering_global_from_var() {
	my $x := 2;

	Global::register_global('TWO', $x);
	
	$x++;
	
	fail_unless(Global::TWO == 3,
		"Variable not globally registered");
}

our method test_using_registered_global() {
	my $eleven := 10;
	
	Global::register_global('$X', $eleven);

	Global::use(:symbols('$X'));

	fail_unless(self.namespace.contains('$X'),
		"Failed to import global variable");
		
	our $X;
	fail_unless($X == 10,
		"Imported global variable is wrong pmc");
	
	$X++;
	fail_unless($eleven == 11,
		"Global variable no longer original pmc");
}

our method test_registering_in_other_namespace() {
	our $y := 'wye';
	Global::register_global('Y', $y, :namespace('OtherGlobal'));
	
	fail_unless(OtherGlobal::Y eq 'wye',
		"Global not registered in target namespace");
}

module Dummy {
	INIT {
		our $MMX := 2010;
		export('$MMX', 'foo');
		export('pooh', :as('edward'), :tags('BEAR'));
		export('lucifer', :tags('NOT_USED'));
	}
	
	sub foo() {
		'bar';
	}
	
	sub lucifer() {
		'smoking!';
	}
	
	sub pooh() {
		'oh, bother';
	}
}

our method test_use_with_tag() {
	use( 'Dummy', :tags('BEAR'));
	
	fail_unless(edward() eq 'oh, bother',
		"Use w/ tag gets wrong symbol");
}

our method test_use_default() {
	our $MMX;
	
	use('Dummy');
	
	fail_unless($MMX == 2010,
		'Plain use did not import $MMX as part of DEFAULT set');
	
	fail_unless(foo() eq 'bar',
		'Plain use did not import foo() correctly');
}

our method test_use_by_name() {
	use('Dummy', :symbols('lucifer'));
	fail_unless(lucifer() eq 'smoking!',
		'Use by name of lucifer did not work correctly');
}
