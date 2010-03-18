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

class Test::FileSystem
	is UnitTest::Testcase ;

has	$!sut;

INIT {
	use(	'UnitTest::Testcase' );	
	use(	'UnitTest::Assertions' );	
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

method set_up() {
	$!sut := FileSystem.instance;
}

method test_cwd() {
	my $cwd := $!sut.cwd;	
	my @parts := $cwd.split( $!sut.directory_separator );

	# NOTE: I don't have a better way to test this ATM. If you think of one, please implement it.
	assert_equal( 'kakapo', @parts[-1],
		'cwd should end with "kakapo"' );
}

method test_exists() {

	assert_false( $!sut.exists('/tmp/this-PrOBAbly-doesnt-eXXXI$+'),
		"File really shouldn't exist." );
		
	assert_true( $!sut.exists('.'),
		"Current directory had better exist.");
}
	
method test_instance() {
	
	assert_not_null( $!sut,
		'FileSystem.instance should never return null' );
		
	assert_isa( $!sut, 'FileSystem',
		'FileSystem.instance should return an object of the right type' );
}

method test_new() {
	my $sut := FileSystem.new;
	
	assert_isa( $sut, FileSystem,
		'.new should return object of correct type');
}

# NB: Assumes this is run from $KAKAPO root dir.
method test_get_contents_file() {
	my $t1 := $!sut.get_contents( 't/test-data/text-file-1' );
	
	assert_not_equal( -1, $t1.index( 'text file 1.'),
		'Text file 1 should be read in.' );
	assert_equal( 4, $t1.split("\n").elems,
		'File 1 should have 4 lines');
	
	my $t2 := $!sut.get_contents( 't/test-data/text-file-2' );
	
	assert_not_equal( -1, $t2.index( 'text file 2.' ),
		'Text file 2 should be read in.' );
	assert_equal( 4, $t2.split("\n").elems,
		'File 2 should have 4 lines');
}

method test_get_contents_dir() {
	my @d1 := $!sut.get_contents( 't' );
	
	my %dir := Hash.new;
	@d1.map: -> $key { %dir{$key} := 1; };
	
	assert_true( %dir.contains( <test-data> ),
		't/ directory should have a test-data child' );
}

method test_is_file() {
	assert_true( $!sut.is_file( '/etc/passwd' ),
		'/etc/passwd should be a file' );
	assert_false( $!sut.is_file( '/etc' ),
		'/etc should not be a file' );
}
