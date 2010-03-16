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

class Test::P6metaclass
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
	use(	'UnitTest::Assertions' );	
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

class Dummy::Accessors {
	has $!private1;
	has %!private2;
	has @public1;
	has &public2;
	
	INIT {
		auto_accessors();
	}
}

method test_accessors() {
	my $dummy := Dummy::Accessors.new;

	assert_throws_nothing( 'Accessor functions should be defined for public by default',
		{ 
			$dummy.public1('c');
			$dummy.public2('d');
		});
		
	assert_throws( Exception::MethodNotFound, 'Accessor functions should NOT exist for private attrs',
		{ $dummy.private1; });
}

class Dummy::Private {
	has $!a; has &!b; has @c; has %d;
	
	INIT { auto_accessors(:private); }
}

method test_auto_accessors_private() {
	my $dummy := Dummy::Private.new;
	
	assert_throws_nothing( 'Accessor functions should be defined for public by default',
		{ $dummy.c(1); $dummy.d(0); });
		
	assert_throws_nothing( 'Accessor functions should be defined for private attrs by :private',
		{ $dummy.a(1); $dummy.b(0); });		
}

class Dummy::Backwards {
	has $a; has @b; has %!c; has &!d;
	INIT { auto_accessors(:private, :public(0)); }
}

method test_auto_accessors_nopublic() {
	my $dummy := Dummy::Backwards.new;
	
	assert_throws( Exception::MethodNotFound, 'Accessor functions should NOT exist for public attrs',
		{ $dummy.a(1); $dummy.b; });
	
	assert_throws_nothing( 'Accessor functions should be defined for public by default',
		{ $dummy.c(1); $dummy.d(0); });		
}