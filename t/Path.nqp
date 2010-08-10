#! /usr/bin/env parrot-nqp
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Path
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method test_new() {
	my $sut := Path.new;

	assert_not_null( $sut,
		'.new should return a valid object' );
	assert_isa( $sut, Path,
		'.new should return correct type' );
}

our method test_parse_rootdir() {
	my $sut := Path.new('/');

	assert_true( $sut.is_absolute,
		'/ should be parsed as absolute' );
	assert_equal( '/', ~$sut,
		'/ should re-stringify as /' );
}

our method test_parse_strings_rooted() {
	my $sut := Path.new('/', 'x');

	assert_equal('/x', ~$sut,
		'/, x should stringify as /x' );
	assert_true( $sut.is_absolute,
		'/x should be absolute' );
}

our method test_parse_strings_unrooted() {
	my $sut := Path.new( 'a/b', 'c/d');
	
	assert_equal( 'a/b/c/d', ~$sut,
		'a/b, c/d should stringify to a/b/c/d');

	assert_true( $sut.is_relative,
		'a/b/c/d should be relative' );
}

our method test_parse_static_path() {
	my $old := Path.new( '/x' );
	my $sut := Path.new( $old, 'y');

	assert_equal( '/x/y', ~$sut,
		'Path:/x + y should = /x/y' );
	assert_true( $sut.is_absolute,
		'Should inherit absolute from old path' );
}

our method test_parse_static_path_late() {
	my $old := Path.new( 'x' );
	my $sut := Path.new( 'w', $old, 'y' );
	
	assert_equal( 'w/x/y', ~$sut,
		'w + path:x + y should = w/x/y' );
	assert_true( $sut.is_relative,
		'relative string + path should be relative' );
}

our method test_parse_dynamic_first() {
	my $old := Path.new( 'x' );
	my $sut := Path.new( $old, 'y', 'z', :dynamic);

	assert_equal( 'x/y/z', ~$sut,
		'dynamic path:x + y + z should = x/y/z' );
	assert_true( $sut.is_relative,
		'relative first path should mean relative new path' );
	
	$old.append: 'a';
	assert_equal( 'x/a/y/z', ~$sut,
		'dynamic path update should reflect in this path' );
		
	$old.absolute;
	assert_equal( '/x/a/y/z', ~$sut,
		'dynamic path update to absolute should reflect in this path' );
		
}

#method main() { self.set_up; self.test_parse_dynamic_first; }