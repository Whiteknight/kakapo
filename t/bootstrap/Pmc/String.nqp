#! /usr/bin/env parrot-nqp
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module bootstrap::Pmc::String;

MAIN();

INIT {
	# Load the Test::More library
	pir::load_language('parrot');
	pir::compreg__PS('parrot').import('Test::More');
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_base.pbc');
}

sub MAIN() {
	
	plan(9 + 0);

	# Common bits (12)
	#test_new();	# 3 - not used for String
	test_can();		# 3
	test_clone();	# 1
	test_defined();	# 1
	test_does();		# 1
	test_isa();		# 3
	
}

sub make_one() {
	return 'A String';
}

sub test_can() {
	my $obj := make_one();
	
	ok($obj.can('isa'), '... can isa');
	ok($obj.can('trim'), '... can trim');
	nok($obj.can('nosuchmethod'), '... cannot do nsm');
}

sub test_clone() {
	my $obj := make_one();

	my $o2 := $obj.clone;
	is($o2, 'A String', 'Clone is the same as original');
}

sub test_defined() {
	my $obj := make_one();
	ok($obj.defined, 'Defined ok');
}

sub test_does() {
	my $obj := make_one();
	nok($obj.does('anything'), 'Doesnt do anything');
}

sub test_isa() {
	my $obj := make_one();
	ok($obj.isa('String'), 'isa returns true okay');
	nok($obj.isa('NotMe'), 'isa returns false okay');
	nok($obj.isa('Exception'), 'isa returns false okay 2');
}
