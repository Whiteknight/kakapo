#! parrot-nqp

MAIN();

sub MAIN() {
	# Load the Test::More library
	pir::load_language('parrot');
	pir::compreg__PS('parrot').import('Test::More');
	
	# run the tests
	run_tests();
}

sub run_tests() {
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR>;
	
	unless $root_dir {
		$root_dir := '.';
	}
	
	pir::load_bytecode($root_dir ~ '/library/kakapo_base.pbc');
	
	plan(27);
	
	test_new();
	test_contains();
	test_defined();
	test_delete();
	test_elements();
	test_keys();
}

sub test_defined() {
	my $object := Hash.new();
	
	isa_ok($object, 'Hash', 'Created a hash okay');
	ok($object.defined, 'Hash::defined returns true');
}

sub test_new() {
	my $object := Hash.new();
	isa_ok($object, 'Hash', 'Created a Hash okay');
	
	$object := Hash.new( :a(2), :b(3), :c(5));
	isa_ok($object, 'Hash', 'Created a Hash okay');
	is(3, +$object, 'Created with 3 elements');
	
	is($object<b>, 3, 'Elements right');
	is($object<c>, 5, 'Elements right');
	is($object<a>, 2, 'Elements right');
}

sub test_contains() {
	my $object := Hash.new();
	
	nok($object.contains('apple'), 'No apple in hash, yet.');
	nok($object.contains('banana'), 'No banana in hash, yet.');
	
	$object<apple> := 'Macintosh';
	ok($object.contains('apple'), 'Now hash contains an apple.');
	nok($object.contains('banana'), 'Still no banana');
	
	$object<banana> := 'Chiquita';
	ok($object.contains('banana'), 'Finally, a banana.');
}

sub test_delete() {
	my $object := Hash.new(:car('beep'), :boat('ding'), :train('choo'));
	
	ok($object.contains('boat'), 'Hash contains boat.');
	is($object.delete('boat'), $object, '.delete returns self');
	nok($object.contains('boat'), 'Boat is gone.');
	
	my $saved := $object;
	is($object.delete('boat').delete('car').delete('train').delete('plane'), $saved, 'Same object');
	nok($object.contains('car'), 'No car');
	nok($object.contains('train'), 'No train');
}

sub test_elements() {
	my $object := Hash.new(:a(1), :b(2), :c(3));
	is($object.elems, 3, '3 items in hash');
	
	$object<z> := 'zzz';
	is($object.elems, 4);
	
	$object.delete('a');
	is($object.elems, 3);
}

sub test_keys() {
	my $object := Hash.new(:dog('woof'), :cat('meow'));
	
	my @keys := $object.keys;
	is(+@keys, +$object, 'Same number of items');
	ok(@keys[0] eq 'dog' || @keys[0] eq 'cat', 'Contents right');
	ok(@keys[1] eq 'dog' || @keys[1] eq 'cat', 'Contents right');
	ok(@keys[0] ne @keys[1], 'Contents right');
	
	$object<cow> := 'moo';
	isnt(+@keys, +$object.keys, 'Different, now');
}
