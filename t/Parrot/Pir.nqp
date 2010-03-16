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

class Test::Pir
	is UnitTest::Testcase ;

INIT {
	use(	UnitTest::Testcase );
	use(	UnitTest::Assertions );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

#~ method main() {
	#~ self.test_compile;
#~ }

method test_compile() {
	verify_that( 'compile($string) works' );

	assert_throws( Exception::NullRegAccess, 'test_compiled_string should NOT be defined already',
		{ Test::Pir::CompiledString::test_compiled_string(); });

	my $str := q{
.namespace ['Test';'Pir';'CompiledString']
.sub 'test_compiled_string'
	$S0 = "success!"
	.return ($S0)
.end
};

	Pir::compile($str);

	my $result;

	assert_throws_nothing( 'test_compiled_string should be defined now',
	{
		$result := Test::Pir::CompiledString::test_compiled_string();
	});

	assert_equal( $result, 'success!',
		'The test_compiled_string function should be alive and returning success');
}

class Dummy::CompileSub1 {
	method test() {
		compiled_sub();
	}
}

method test_compile_sub() {
	my $dummy := Dummy::CompileSub1.new;

	assert_throws( Exception::GlobalNotFound, 'compiled_sub should NOT be defined already',
		{ $dummy.test(); });

	Pir::compile_sub(
		:body( ".return (1)" ),
		:name( 'compiled_sub' ),
		:namespace( $dummy.WHO ),
	);

	assert_equal( $dummy.test, 1,
		'test sub should return 1' );
}

class Dummy::CompileSub2 {
	method test() {
		self.compiled_method();
	}
}

method test_compile_method() {
	my $dummy := Dummy::CompileSub2.new;

	assert_throws( Exception::MethodNotFound, 'compiled method should NOT be defined already',
		{ $dummy.test(); });

	Pir::compile_sub(
		:body( ".return (2)" ),
		:name( 'compiled_method' ),
		:method,
		:namespace( $dummy.WHO ),
	);

	assert_equal( $dummy.test, 2,
		'test method should return 2' );
}

class Dummy::CompileSub3 {

	has $!attr;

	method test() {
		$!attr;
	}
}

method test_compile_vtable() {
	verify_that( 'Compiling with :vtable produces a vtable override method' );
	
	my $dummy := Dummy::CompileSub3.new;

	assert_not_defined( $dummy.test, 'No sub compiled yet');

	Pir::compile_sub(
		:body( ['	$P0 = box 3',
			'	setattribute self, "$!attr", $P0',
		] ),
		:name( 'init' ),
		:method,
		:namespace( $dummy.WHO ),
		:vtable,
	);

	$dummy := Dummy::CompileSub3.new;

	assert_equal( $dummy.test, 3,
		'test method should return 3' );
}

class Dummy::CompileSub4 {

	INIT {
		has( <$!attr> );
	}
}

method test_compile_vtable_labeled() {
	verify_that( 'A sub with a name not related to vtable-ism can still be a vtable with a :vtable(label)' );
	
	my $dummy := Dummy::CompileSub4.new;

	Pir::compile_sub(
		:body( ['	$P0 = getattribute self, "$!attr"',
			'	$S0 = $P0',
			'	.return ($S0)',
		] ),
		:name( 'wibble' ),
		:method,
		:namespace( $dummy.WHO ),
		:vtable('get_string'),
	);

	$dummy.attr('dog');
	
	assert_equal( ~$dummy, 'dog', 
		'get_string vtable should use value of $!attr');
}

method test_pir_namespace_string() {
	assert_equal( Pir::pir_namespace('Foo::Bar'), "[ 'Foo'; 'Bar' ]",
		'String rewrite Foo::Bar should be okay');
	assert_equal( Pir::pir_namespace(''), '[ ]',
		'String rewrite empty string should be okay');
}

module Foo::Baz {
}

method test_pir_namespace_nsp() {
	assert_equal( Pir::pir_namespace( Foo::Baz ), "['Foo'; 'Baz']",
		'Format of namespace name should be okay');
}
