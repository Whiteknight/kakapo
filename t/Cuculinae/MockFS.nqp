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

class Test::Cuculus::MockFS
	is UnitTest::Testcase ;

has	$!sut;

INIT {
	use(	'UnitTest::Testcase' );	
	use(	'UnitTest::Assertions' );	
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

our method set_up() {
	$!sut := Cuculus::MockFS.new;
}

our method test_new() {
	assert_not_null( $!sut,
		'.new should return a valid object' );

	assert_isa( $!sut, Cuculus::MockFS, 
		'.new should return an instance of the right class' );

	assert_not_null( $!sut.volumes<>,
		'Volumes hash should be initialized' );

	assert_same( $!sut.volumes<>, $!sut.cwd_path[-1],
		'Cwd path should point to /' );
}

our method test_mkpath() {
	assert_false( $!sut.exists( '/tmp/xxx' ),
		'/tmp/xxx should not exist on new mockfs' );
	
	$!sut.mkpath( '/tmp/xxx' );
	
	assert_true( $!sut.exists( '/tmp/xxx' ),
		'/tmp/xxx should exist after mkpath' );
}

our method test_add_entry() {
	my $path_str := '/tmp/xxx/foo.txt';
	
	$!sut.add_entry($path_str, :contents("Howdy\n"), :type(<file>));
	
	assert_true( $!sut.exists( $path_str ),
		"$path_str should exist after add_entry" );
}

our method test_add_entry_relative() {
	my $path_str := 'file.c=';
	
	# Confirm that relative paths work.
	$!sut.add_entry: $path_str, contents => "Contents of file.c=";
	assert_true( $!sut.exists( $path_str ),
		"$path_str should exist after add_entry" );	
}

our method test_add_entry_defaults() {
	verify_that( 'Add_entry uses some sane default values' );

	my $path_str := 'new_entry';
	
	$!sut.add_entry: $path_str;
	
	assert_true( $!sut.is_file( $path_str ),
		'Entry should be file by default' );
	assert_equal( '', $!sut.get_contents( $path_str ), 
		'Entry should be empty by default' );
}

our method test_has_type() {
	$!sut.add_entry: '/etc/motd', type => 'file';
	$!sut.add_entry: '/dev/null', type => 'device';
	$!sut.add_entry: '/usr/bin', type => 'link';

	assert_false( $!sut.is_file( '/dev/null' ), 'is_file: /dev/null -> false');
	assert_true( $!sut.has_type( '/dev/null', 'device'), 'is_device: /dev/null -> true');
	
	assert_true( $!sut.has_type( '/etc', 'directory' ),	'/etc should have type directory' );
	assert_true( $!sut.is_directory( '/etc' ),	'/etc should have type directory' );
	
	assert_true( $!sut.has_type( '/etc/motd', 'file' ),	'/etc/motd should have type file' );
	assert_true( $!sut.is_file( '/etc/motd'), 'is_file: /etc/motd -> true');
	
	assert_false( $!sut.is_file( '/usr/bin' ), 'is_file: /usr/bin -> false');
	assert_true( $!sut.has_type( '/usr/bin', 'link'), 'is_link: /usr/bin -> true');
	
}

our method test_get_contents() {
	$!sut.add_entry: '/etc/motd', type => 'file', contents => "Hello, world\n";
	$!sut.add_entry: '/dev/null', type => 'device';
	$!sut.add_entry: '/usr/bin', type => 'link';

	assert_equal( $!sut.get_contents( '/etc/motd' ), "Hello, world\n",
		'File contents should match' );
	assert_equal($!sut.get_contents( '/' ).sort.join('|'), 'dev|etc|usr',
		'Directory contents should be child names');
}

#method main() { self.set_up; self.test_has_type; }
