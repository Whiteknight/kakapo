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

TEST_MAIN();

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

module Dummy::DeclareRole {
	sub set_up() {
		does_role( 'Dummy::Role' );
	}

}

method test_declare_role() {
	my $role := P6metaclass.declare_role('Dummy::Role');

	assert_isa( $role, 'Role',
		'Declare role should return a role');
	assert_not_null( Parrot::get_hll_global('Dummy::Role'),
		'Declared role should be installed in namespace' );

	Dummy::DeclareRole::set_up();

	my $class := P6metaclass.get_parrotclass( Dummy::DeclareRole );
	assert_same( $role, $class.inspect('roles')[0],
		'Role should be part of class roles list');
}

module Dummy::RoleWithAttrs {
	INIT {
		role();
		has(<$!atr1 @!atr2>);
	}
}

method test_get_role() {
	my $role_obj := Dummy::RoleWithAttrs;
	
	assert_same( $role_obj, P6metaclass.get_parrotrole('Dummy::RoleWithAttrs'),
		'String lookup should return role');
	
	my $nsp := NameSpace.fetch: 'Dummy::RoleWithAttrs';
	assert_same( $role_obj, P6metaclass.get_parrotrole($nsp),
		'NameSpace lookup should return role' );
	
	assert_same( $role_obj, P6metaclass.get_parrotrole($role_obj),
		'Role should return itself');
}

class Dummy::ClassWithRoleAttrs {
	sub init() {
		does_role( Dummy::RoleWithAttrs );
	}
}

method test_role_attributes() {
	#todo("This doesn't work at the Parrot level. See TT#1527");
	
	Dummy::ClassWithRoleAttrs::init();

	my $obj := Dummy::ClassWithRoleAttrs.new;
	my $class := pir::class__PP($obj);
	
	my %attrs := $class.inspect('attributes');
	assert_true( %attrs.contains( <$!atr1> ),
		'Role attributes should be composed into class.');
}
#method main() { self.set_up; self.test_role_attributes; }

method test_role_creation() {
	my $role := Q:PIR {
		%r = get_hll_global [ 'Dummy' ], 'RoleWithAttrs'
	};
	
	assert_isa( $role, 'Role',
		'Global symbol should be a role' );

	assert_same( Dummy::RoleWithAttrs, $role,
		'Named symbol should look up role' );
}

module Dummy::RoleWithMethods {
	INIT { role(); }

	method rwm_method1() { 1; }
	method rwm_method2() { 2; }
}

class Dummy::ClassWithRoleMethods {
	sub init() {
		does_role( Dummy::RoleWithMethods );
	}
}

method test_role_methods() {
	Dummy::ClassWithRoleMethods::init();

	my $class := P6metaclass.get_parrotclass( Dummy::ClassWithRoleMethods );

	assert_true( $class.inspect('methods').contains( <rwm_method1> ),
		'Role method 1 should be composed into class');
	assert_true( $class.inspect('methods').contains( <rwm_method2> ),
		'Role method 2 should be composed into class');
}
