#! /usr/bin/env parrot-nqp
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module bootstrap::Classes::P6metaclass ;

MAIN();

INIT {
	# Load the Test::More library
	pir::load_language('parrot');
	pir::compreg__PS('parrot').import('Test::More');
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR>;
	
	unless $root_dir {
		$root_dir := '.';
	}

	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');	
}

sub MAIN() {	
	plan(16);

	test_base();
	test_derived();
	test_attributes();
	test_deferred();
}

class Base {
	method m1() {
		17;
	}
	
	method m2() {
		19;
	}
}

sub test_base() {
	my $obj := Base.new();
	ok($obj.defined, 'Got Simple object');
	is($obj.m1, 17, 'Got expected method result');
	is($obj.m2, 19, 'Got expected method result');
}

class Derived is Base {
	method m1() {
		16;
	}

	method m3() {
		21;
	}
}

sub test_derived() {
	my $obj := Derived.new();
	ok($obj.isa(Derived), 'Got right class');
	ok($obj.isa('Base'), 'isa Base okay');
	is($obj.m3, 21, 'Independent method okay');
	is($obj.m2, 19, 'Inherited method okay');
	is($obj.m1, 16, 'Overridden method okay');
}

class Attributes is Base {
	INIT {
		use(	'P6metaclass' );
		
		has(	'$!attr' );
	}	
}

sub test_attributes() {
	my $obj := Attributes.new();
	
	ok($obj.isa('Attributes'), 'Attributes: Right class');
	ok($obj.isa('Base'), 'Attributes: isa Base');
	ok(Attributes.HOW.can(Attributes, 'attr'), 'Attributes: Has accessor');
	
	$obj.attr(11);
	my $value := 6;
	$value := $obj.attr;
	is($value, 11, 'Attributes: Stored and fetched okay.');	
}

module Deferred {
	INIT {
		use(	'P6metaclass' );
		
		extends( 'Attributes' );
		has(	'@.list' );
	}
}

sub test_deferred() {
	my $obj := Deferred.new();
	ok($obj.isa('Deferred'), 'Deferred: right class');
	ok($obj.isa('Attributes'), 'Deferred: right hierarchy');
	
	$obj.attr(17);
	is($obj.attr, 17, 'Deferred: inherited attr okay');
	$obj.list.push(5);
	is($obj.list, 1, 'Deferred: list attr okay');
}

sub test_global_export() {

}
