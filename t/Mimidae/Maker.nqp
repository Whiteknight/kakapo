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

class Test::Mimus::Maker
	is UnitTest::Testcase ;

	has $!sut;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
#	$proto.suite.run;
	$proto.set_up;
	$proto.test_new_object;
}

method set_up() {
	$!sut := Mimus::Maker.new();
}

method test_new() {
	verify_that( 'SUT is created okay, right class.' );
	assert_isa( $!sut, 'Mimus::Maker', 	
		'SUT should be populated with object of the right class.');
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
	my $species := Opcode::getattribute($class, '$!MIMUS_SPECIES');

	assert_not_null( $species,
		'$!MIMUS_SPECIES attribute should always be set on generated classes');
	assert_same( $species.maker, $!sut,
		'Species should point back to Maker object that generated the class');
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

method test_make() {
	verify_that( 'make() creates an anonymous class based on P6object' );

	my $class := $!sut.make();
	self.check_created_class($class, :parents(Array::new('Mimus::Cuculus::Ovum')));
}

method test_make_named() {
	verify_that( 'make(:named("Foo::Bar") creates a class in the right namespace' );

	my $class := $!sut.make(:named('Foo::Bar'));

	self.check_created_class($class, :parents(Array::new('Mimus::SuiGeneris')));
	self.check_class_namespace($class, 'Foo::Bar');
}

class Test::Mock::Parent {
	method a() { 1; }
	method b() { 1; }
	method c() { 1; }
}

class Test::Mock::Child is Test::Mock::Parent {
	method d() { 1; }
	method e() { 1; }
}

method test_make_subclass() {
	verify_that( 'make(parent_class) creates an anonymous class with the right parents' );

	my $class := $!sut.make('Test::Mock::Parent');
	self.check_created_class($class, :parents(<Mimus::SuiGeneris Test::Mock::Parent>));
}

method test_make_subclass_named() {
	verify_that( 'make(parent_class, :named("Foo::Baz")) has right parents, right namespace' );
	
	my $class := $!sut.make('Test::Mock::Parent', :named('Foo::Baz'));
	self.check_created_class($class, :parents(<Mimus::SuiGeneris Test::Mock::Parent>));
	self.check_class_namespace($class, 'Foo::Baz');
}

method test_mock_object_isa_parent() {
	my $class := $!sut.make('Test::Mock::Parent');
	my $obj := $class.new;
	
	assert_not_null( $obj, 
		'Mock class new() should create objects');
	assert_isa( $obj, 'Test::Mock::Parent',
		'Mock objects should be isa parent class');
}

method test_new_object() {
	my $class := $!sut.make();
	my $obj := $class.new;
	
	_dumper($obj, "New instance of mock class");
}


method Xtest_mock_logs_calls() {
	my $mc := $!sut.mock(:of('String'));

	my $mo := $mc.new;
	$mo.length(2, 3, 5, 8, :z(26));
	$mo.trim('a', 'b');
	$mo.repeat(:a, :b, :c('zero'));

	my @log :=  pir::getattribute__PPS($mo, '@!MIMUS_CALLS');
	fail_unless( @log.elems == 3, '@log should record 3 calls');
	fail_unless( @log[0][0] eq 'length', 'First entry should be length');
	fail_unless( @log[1][1].elems == 2, 'Second entry, two positional args' );
	fail_unless( @log[2][2].elems == 3, 'Third entry, 3 named args' );
}
