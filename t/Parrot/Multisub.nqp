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

class Test::Multisub
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
	use(	'UnitTest::Assertions' );	
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

class Dummy::ParseMultisig {
	method f0() { 1 }
	method f1__bar() { 1 }
	method f2__bar__baz() { 1 }
	method f3__bar__Dummy_ParseMultisig() { 1 }
}

method test_parse_multisig() {
	my @methods := P6metaclass.get_parrotclass( Dummy::ParseMultisig ).inspect('methods').keys.sort;

	my %expected;
	%expected<f0> := [ ];
	%expected<f1> := [ <bar> ];
	%expected<f2> := < bar baz >;
	%expected<f3> := < bar Dummy_ParseMultisig >;
	
	for @methods -> $method {
		my $name := $method.substr(0, 2);
		assert_true( %expected.contains( $name ),
			'Expected list should contain all the methods defined in class');
		assert_equal( %expected{$name}, Parrot::parse_multisig($method),
			"Multisig $method was not parsed correctly: { Parrot::parse_multisig($method) }" );
	}
}

class Dummy::DefineMultisub {
	sub a() { 1 }
	sub b() { 2 }
}

method test_define_multisub_sub() {
	verify_that( 'Plain old define_multisub creates a multi-sub' );
	
	Parrot::define_multisub('msub', 
		[ 
			Dummy::DefineMultisub::a, 
			Dummy::DefineMultisub::b, 
		],
		:signatures([ 
			[ <String> ], 
			[ <Integer> ],
		]),
	);
	
	assert_equal( 1, Test::Multisub::msub('xor'),
		'Multisub(str) should return 1');
	assert_equal( 2, Test::Multisub::msub(100),
		'Multisub(int) should return 2');
}

class Dummy::DefineMultimethod {
	has $!attr;
	
	method set_attr($x) {
		$!attr := $x;
	}
	
	method get_attr() {
		$!attr;
	}
}

method test_define_multisub_method() {
	verify_that( 'define_multisub with :method creates a multi-method' );
	Parrot::define_multisub('attr',
		[ 
			Dummy::DefineMultimethod::set_attr,
			Dummy::DefineMultimethod::get_attr,
		],
		:method,
		:namespace( 'Dummy::DefineMultimethod' ),
		:signatures([
			< _ _ >,
			[ '_' ],
		]),
	);
	
	my $obj := Dummy::DefineMultimethod.new;
	
	assert_not_defined($obj.get_attr,
		'New object should have attr undefined');
	
	$obj.set_attr('pi');
	assert_equal( 'pi', $obj.get_attr,
		'Fetch accessor should return set value' );
	assert_equal( 'pi', $obj.attr,
		'No-args accessor should return value');

	$obj.attr('rho');
	assert_equal( 'rho', $obj.get_attr,
		'Store accessor should set value');
		
}

class Dummy::MultiSignatureDecoding {
	has $!attr;
	
	method getter() { $!attr; }
	method setter__Integer($int) { $!attr := $int + 1; }
	method setter__Float($f) { $!attr := $f }
	method setter__String($s) {
		die("No strings!");
	}
}

method test_multi_signature_decode() {
	Parrot::define_multisub('matter', :method,
		:namespace(Dummy::MultiSignatureDecoding),
		[
			Dummy::MultiSignatureDecoding::getter,
			Dummy::MultiSignatureDecoding::setter__Integer,
			Dummy::MultiSignatureDecoding::setter__Float,
			Dummy::MultiSignatureDecoding::setter__String,
		],
	);
	
	my $obj := Dummy::MultiSignatureDecoding.new;

	$obj.matter( 1 );
	assert_equal( 2, $obj.matter,
		'Ints should be bumped by 1');
	
	$obj.matter(4.13);
	assert_equal( 4.13, $obj.matter,
		'Floats should be stored as-is');
		
	assert_throws( Control::Error, 'Strings should not be allowed',
		{ $obj.matter( <foo> ); });
}

class Dummy::MultiStartingWith {
	has $!dog;
	
	method dog() { $!dog; }
	method dog__Integer($i) { $!dog := "int: $i"; }
	method dog__String($s) { $!dog := "string: $s"; }
	method dog__Float($f) { die("no float"); }
	method dog__ANY__Integer($x, $i) { $!dog := $i + 1; }
	method dog__ANY__Float($x, $f) { $!dog := $f / 2; }
	
	INIT {
		Parrot::define_multisub('mutt', :method, :starting_with('dog'));
	}
}

method test_multi_starting_with() {
	my $obj := Dummy::MultiStartingWith.new;

	$obj.mutt( 1 );
	assert_equal( "int: 1", $obj.mutt,
		'Ints should be stored');

	assert_throws( Control::Error, 'Floats should die',
		{ $obj.mutt(6.02E23); });
		
	$obj.mutt('spot');
	assert_equal( 'string: spot', $obj.mutt,
		'Strings should be stored');
		
	$obj.mutt(self, 1);
	assert_equal( 2, $obj.mutt,
		'ANY+Int should be bumped by 1');
	
	$obj.mutt(self, 1.01);
	assert_equal( 0.505, $obj.mutt,
		'ANY+Float should be divided by 2');
	
}
