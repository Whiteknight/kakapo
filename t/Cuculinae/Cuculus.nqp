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

class Test::Mock::Parent {
	method a() { 1; }
	method b() { 1; }
	method c() { 1; }
}

class Test::Cuculus::Canorus
	is UnitTest::Testcase ;

has $!sut;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
	use(	'Matcher::Factory' );

	use(	'Cuculus::Canorus' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
	#$proto.set_up;
	#$proto.test_mock_object_isa_parent;
}


# For named mocks, check the mock is installed correctly.
method check_class_namespace($class, $namespace) {
	my $parrot_class := P6metaclass.get_parrotclass($class);

	my $proto_obj := Parrot::get_hll_global($namespace);
	assert_same($proto_obj, $class,
		'Protoobject should be installed as $namespace global symbol');

	my $nsp := Parrot::get_hll_namespace($namespace);
	assert_same($parrot_class.get_namespace, $nsp,
		'Class should be linked to $namespace namespace' );
}

method check_created_class($class, :@parents) {
	my $parrot_class := P6metaclass.get_parrotclass($class);

	# Check parents against specified list. Stringify to get name, transform "A;B" style into A::B, and sort.
	my @mock_parents := $parrot_class.inspect('parents'
		).map( -> $parent { ~ $parent }
		).map( -> $name { $name.split(';').join('::') }
		);
	@mock_parents.sort;

	@parents.sort;

	assert_equal( @mock_parents, @parents,
		'Inspected "parents" attribute should have: ' ~ @parents.join(', '));

	# Verify that the species attribute gets set
	my $species := Opcode::getattribute($class, '$!CUCULUS_CANORUS');

	assert_not_null( $species,
		'$!CUCULUS_CANORUS attribute should always be set on generated classes');
	assert_same( $species, $!sut,
		'$!CUCULUS_CANORUS should point back to cuckoo object that generated the class');
}

method set_up() {
	$!sut := Cuculus::Canorus.new;
}

method test_new() {
	verify_that( 'SUT is created okay, right class.' );

	assert_isa( $!sut, 'Cuculus::Canorus',
		'SUT should be populated with object of the right class.');
}

method test_mock_class() {
	verify_that( 'mock_class() creates an anonymous class based on P6object' );

	my $class := $!sut.mock_class();
	self.check_created_class($class, :parents( [ 'Cuculus::Canorus::Ovum' ] ));
}

method test_mock_class_named() {
	verify_that( 'mock_class(:named("Foo::Bar") creates a class in the right namespace' );

	my $class := $!sut.mock_class(:named('Foo::Bar'));

	self.check_created_class($class, :parents( [ 'Cuculus::Canorus::Ovum' ] ));
	self.check_class_namespace($class, 'Foo::Bar');
}

method test_mock_object_isa_parent() {
	my $class := $!sut.mock_class('Test::Mock::Parent');
	my $obj := $class.new;
	
	assert_not_null( $obj, 
		'Mock class new() should create objects');
	assert_isa( $obj, 'Test::Mock::Parent',
		'Mock objects should be isa parent class');		
}

method test_mock_subclass() {
	verify_that( 'mock_class(parent_class) creates an anonymous class with the right parents' );

	my $class := $!sut.mock_class('Test::Mock::Parent');
	self.check_created_class($class, :parents(<Cuculus::Canorus::Ovum Test::Mock::Parent>));
}

method test_mock_subclass_named() {
	verify_that( 'mock_class(parent_class, :named("Foo::Baz")) has right parents, right namespace' );
	
	my $class := $!sut.mock_class('Test::Mock::Parent', :named('Foo::Baz'));
	self.check_created_class($class, :parents(<Cuculus::Canorus::Ovum Test::Mock::Parent>));
	self.check_class_namespace($class, 'Foo::Baz');
}

method test_new_egg() {
	$!sut.class('Cuculus::Canorus::Ovum');
	my $egg := $!sut.new_egg();

	assert_isa( $egg, 'Cuculus::Canorus::Ovum',
		'new_egg should return the right type');

	my $behavior := Opcode::getattribute( $egg, '&!CUCULUS_BEHAVIOR' );
	assert_same( $behavior, Cuculus::Canorus::mock_execute,
		'New egg should be execute-configured by default' );
}
