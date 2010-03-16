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

method test_composing() {
	my $root := Path.new('/xxx');
	my $sut := Path.new($root, 'yyy');
	
	assert_equal( ~$sut, '/xxx/yyy',
		'Composing two paths should catenate them');
}

method test_composing_rooted() {
	my $root := Path.new('/xxx');
	my $sut := Path.new($root, '/yyy');
	
	assert_equal( ~$sut, '/yyy',
		'Composing should be ignored if path is absolute');
}

method test_new() {
	my $sut := Path.new;
	
	assert_instance_of( $sut, 'Path',
		'.new should return object of correct type');
}

method test_get_string() {
	my $sut := Path.new('xxx', 'yyy', 'zzz');
	
	assert_equal( ~ $sut, 'xxx/yyy/zzz',
		'Get-string should return the full path');
}

method test_parsing_dir_file() {
	my $sut := Path.new('/tmp/xxx');
	
	assert_equal( $sut.filename, 'xxx',
		'Path should treat final part as a filename');
}

method test_parsing_dir_nofile() {
	my $sut := Path.new('/tmp/xxx', :nofile);
	
	assert_equal( $sut.filename, '',
		'Path should *not* treat final part as a filename if :nofile specified' );
}

method test_exists() {
	my $sut := Path.new('.');

	assert_true( $sut.exists,
		'CWD should exist');
		
	$sut := Path.new('/tmp/no-such-file');
	
	assert_false( $sut.exists,
		'Bogus file should not exist');
}

method test_slurp() {
	my $path := Path.new( 't/test-data/text-file-1' );
	my $text := $path.slurp;
	
	assert_not_equal( -1, $text.index( 'text file 1.' ),
		'Text file 1 should be read in.' );
	assert_equal( 4, $text.split("\n").elems,
		'File 1 should have 4 lines');
}
	
method main() {
	self.set_up;
	self.test_slurp ;
}

