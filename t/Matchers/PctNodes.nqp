#! /usr/bin/env parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load PCT *first* (see TT#1520)
	pir::load_bytecode( <PCT.pbc> );
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Matcher::PAST::Node
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
	
	use(	'Matcher::PAST::Node' );
}

TEST_MAIN();

sub check_matcher($m, $class, $node_type) {

	assert_isa( $m, Matcher::PCT::Node,
		'Should be a PCT Node matcher.' );
		
	assert_same( $node_type, $m.node_type,
		"Node type should be $node_type");
		
	assert_equal( [1, 2, 3], $m.children,
		'Children should be set to [1, 2, 3]');
	
	my %named := Hash.new( :a<A>, :b<B> );
	assert_equal( %named, $m.attrs,
		'Attrs should have :a<A>, :b<B>' );
}

sub check_past_matcher($node_type, $m) {
	check_matcher($m, Matcher::PAST::Node, $node_type);
}

method test_factory() {
	verify_that( "All the factory methods return the right configuration" );
	
	check_past_matcher(PAST::Block, block(1, 2, 3, :a<A>, :b<B>) );
	check_past_matcher(PAST::Control, control(1, 2, 3, :a<A>, :b<B>) );
	check_past_matcher(PAST::Op, op(1, 2, 3, :a<A>, :b<B>) );
	check_past_matcher(PAST::Stmts, stmts(1, 2, 3, :a<A>, :b<B>) );
	check_past_matcher(PAST::Val, val(1, 2, 3, :a<A>, :b<B>) );
	check_past_matcher(PAST::Var, var(1, 2, 3, :a<A>, :b<B>) );
	check_past_matcher(PAST::VarList, varlist(1, 2, 3, :a<A>, :b<B>) );
}

method test_val() {
	my $past := PAST::Val.new: :name<one>, :value<1>;
	
	my $matcher := val( value => 1 );
	assert_match( $past, $matcher, 
		'PAST node should match {value=1} matcher');
		
	$matcher := val( :name<one> );
	assert_match( $past, $matcher,
		'PAST node should match {name=one} matcher');
	
	$matcher := val( :name<one>, :value(1));
	assert_match( $past, $matcher,
		'PAST node should match {name=one, value=1} matcher');
}

method test_var() {
	my $past := PAST::Var.new: :name<foo>, :namespace<Foo>;
	
	my $matcher := var( :name<foo> );
	assert_match( $past, $matcher,
		'PAST Var should match {name:foo} matcher');
}
