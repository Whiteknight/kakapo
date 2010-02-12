# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell krt0 which file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

class Test::Pmc::COMMON
	is UnitTest::Testcase {
	
	INIT {
		use(	'P6metaclass' );
		use(	'UnitTest::Testcase' );
		
		has(	'$!class' );

		Program::register_main();
	}

	sub main() {
		Test::Pmc::COMMON.suite.run;
	}
	
	method set_up() {
		my $nsp := self.HOW.get_parrotclass(self).get_namespace;
		my $name := $nsp.get_name.pop;

		if $name eq 'COMMON' {
			$name := 'Float';	# Fix up so this class runs stand-alone.
		}
		
		self.class(P6metaclass.get_proto($name));
	}
	
	method test_can() {
		verify_that( "A 'can' method exists, and returns known results" );
		my $object := self.class.new;
		
		unless Opcode::can($object, 'can') { fail("No 'can' method"); }
		
		my @methods := Array::new(
			'can', 'clone', 'defined', 'does', 'isa', 'new',
		);
		
		for @methods {
			unless $object.can(~ $_) { fail( "No can($_)" ); }
		}
	}
	
	method test_clone() {
		verify_that( "Clone returns a different, valid object" );
		my $object := self.class.new;		
		my $other := $object.clone;
	
		if $object =:= $other { fail( "Clone returns same object" ); }
	}
	
	method test_defined() {
		verify_that( "Defined returns correct result" );
		my $object := self.class.new;
		
		unless $object.defined { fail( "Object reports not defined" ); }
	}
	
	method test_isa() {
		verify_that( "'isa' returns correct results" );
		my $object := self.class.new;
		
		unless $object.isa(self.class) { fail( "Object reports not isa(class)" ); }
		if $object.isa('Exception') { fail( "Object reports isa(Exception)" ); }
		if $object.isa('No::Such::Class') { fail( "isa true for bogus class" ); }
	}
	
	method test_new() {
		verify_that( "'new' returns an object of the right type" );		
		my $object := self.class.new;
		
		if Opcode::isnull($object) { fail( "New returned null" ); }
		unless Opcode::defined($object) { fail( "New returned undef" ); }
		unless pir::isa($object, Opcode::typeof(self.class)) { fail("New returned wrong type"); }
	}
}
