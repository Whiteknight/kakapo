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

class Test::Cuculus::Cuckoo
	is UnitTest::Testcase ;

has $!sut;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
	use(	'Matcher::Factory' );

	use(	'Cuckoo' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
	#$proto.set_up;
	#$proto.test_verify_was_called;
}

sub get_behavior($egg)	{ pir::getattribute__PPS($egg, '&!CUCULUS_BEHAVIOR'); }
sub get_cuckoo($egg)	{ pir::getattribute__PPS($egg, '$!CUCULUS_CANORUS'); }

class Test::Mock::Parent {
	has $!attr;

	method attr($value?) { $value.defined ?? ($!attr := $value) !! $!attr; }
}

method set_up() {
	$!sut := cuckoo( Test::Mock::Parent );
}

method test_calling() {
	my $egg := $!sut.new;
	my $aegg := calling($egg);

	assert_same( get_behavior($aegg), Cuculus::Canorus::add_antiphon,
		'A calling() egg should be configured to add antiphons');
	assert_same( get_cuckoo($aegg), get_cuckoo($egg),
		'A calling() egg should link to the same cuckoo as the original egg');
}

method test_calling_configures_antiphons() {
	verify_that( 'Using a calling() egg sets up antiphons on the cuckoo' );
	
	my $egg := $!sut.new;
	
	my $ap := calling( $egg ).foo(1).will_return( 1 );
	assert_equal( get_cuckoo($egg).antiphons.elems, 1, 
		'Should have 1 configured antiphon' );

	assert_equal( $egg.foo(1), 1,
		'foo(1) should return 1');
	
	assert_same( $egg.foo(2), $egg,
		'foo(anything-else) should return self' );
		
	assert_equal( $egg.foo(1), 1, 
		'foo(1) should return 1 even after other calls' );
}

method test_cuckoo() {
	assert_not_null( $!sut, 'cuckoo returns an object' );
	assert_isa( $!sut, Cuculus::Canorus::Ovum, 'cuckoo returns an egg' );
	assert_isa( $!sut, P6protoobject, 'the egg is a protoobject' );
}

method test_mock_class() {
	my $obj := $!sut.new;
	
	assert_not_null( $obj,
		'Cuckoo protoegg should created objects with new');
	assert_isa( $obj, Test::Mock::Parent,
		'New objects should be of the right class');
	assert_not_instance_of( $obj, Test::Mock::Parent,
		'New object is a child class of mocked parent' );
}

method test_mock_objects_differ() {
	verify_that( 'Two calls to .new produce separate cuckoo objects' );
	
	my $o1 := $!sut.new;
	my $o2 := $!sut.new;

	assert_not_null( $o1, 'o1 is a valid object' );
	assert_isa( $o1, Test::Mock::Parent, 'o1 is a mocked parent' );
	
	assert_not_null( $o2, 'o2 is a valid object' );
	assert_isa( $o2, Test::Mock::Parent, 'o2 is a mocked parent' );
	
	assert_not_same( get_cuckoo($o1), get_cuckoo($o2), 
		'Two .new objects should point to different cuckoos.' );	
}

method test_verify() {
	my $egg := $!sut.new;
	my $vegg := verify($egg);

	assert_same( get_behavior($vegg), Cuculus::Canorus::verify_calls,
		'A verify() egg should be configured to verify calls');
	assert_same( get_cuckoo($vegg), get_cuckoo($egg),
		'A verify() egg should link to the same cuckoo as the original egg');
}

method test_verify_configures_call_counter() {
	my $egg := $!sut.new;
	
	$egg.foo('a');
	
	verify( $egg ).foo('a');
}

method test_verify_never() {
	my $egg := $!sut.new;
	
	$egg.foo(1);
	
	want_pass('verify_never should pass if a method was never called',
		{ verify_never( $egg ).foo('a'); });
		
	want_pass('verify(:never) should pass if a method was never called',
		{ verify( $egg, :never ).foo(2); });
}

method test_verify_was_called() {
	my $egg := $!sut.new;
	
	$egg.foo(1);
	verify( $egg ).foo(1).was_called( :once );
	
	$egg.foo(1);
	verify( $egg ).foo(1).was_called( :twice );
	
	$egg.foo(1);
	verify( $egg ).foo(1).was_called: :thrice;
}

method test_verify_fails_never() {
	my $egg := $!sut.new;
	
	$egg.never_called;

	want_fail('verify(:never) should fail if the method was ever called',
		{ verify( $egg, :never ).never_called; });
}

method test_verify_never_fails() {
	my $egg := $!sut.new;
	
	$egg.never_called;

	want_fail('verify_never should fail if the method was ever called',
		{ verify_never( $egg ).never_called; });
}

method test_verify_once() {
	$!sut.new;
	verify( $!sut, :once ).new;
}

method test_verify_twice() {
	my $egg := $!sut.new;
	
	$egg.called_twice('a');
	$egg.called_twice('a');
	$egg.called_twice('b');
	$egg.called_twice;
	
	verify( $egg ).called_twice('a').was_called: :twice;
}

method test_verify_thrice() {
	my $egg := $!sut.new;
	
	my $count := 0;
	while $count++ < 3 {
		$egg.three_times('a lady');
	}
	
	verify( $egg ).three_times("a lady").was_called( :thrice );
}

class Test::VtableInits {
	INIT {
		has_vtable('init', Test::VtableInits::init);
	}
	
	method init() {
		my $x := self.foo();
		$x.bar();
	}
}

method test_vtable_init() {
	verify_that( 'A class with init:vtable method counts calls made inside the init' );
	
	$!sut := cuckoo( Test::VtableInits );
	my $egg := $!sut.new;
	
	$egg.foo();
	
	# NOTE: Because inits run in execute mode, 'foo' would be call 3x: once in init() for
	# the $egg, once (above) explicitly by this test method, and then once more
	# in init() for the verify($egg) below. 
	verify( $egg ).foo.was_called( :at_least(2) );
}
