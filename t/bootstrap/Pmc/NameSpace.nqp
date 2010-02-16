#! parrot-nqp

MAIN();

sub MAIN() {
	# Load the Test::More library
	pir::load_language('parrot');
	pir::compreg__PS('parrot').import('Test::More');
	
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR>;
	
	unless $root_dir {
		$root_dir := '.';
	}
	
	# -----------
	
	pir::load_bytecode($root_dir ~ '/library/kakapo_base.pbc');
	
	plan(11 + 5);

	# Common bits (11)
	test_new();		# 1
	test_can();		# 3
	test_clone();	# 2
	test_defined();	# 1
	test_does();		# 1
	test_isa();		# 3
	
	test_contains();
}

sub make_one() {
	return pir::new__PS('NameSpace');
}

sub test_can() {
	my $obj := make_one();
	
	ok($obj.can('isa'), '... can isa');
	ok($obj.can('find_var'), '... can find_var');
	nok($obj.can('nosuchmethod'), '... cannot do nsm');
}

sub test_clone() {
	my $obj := make_one();
	my $v := 'A variable';
	$obj.add_var('var', $v);

	my $o2 := $obj.clone;
	is($obj.find_var('var'), $o2.find_var('var'), 'Clone is the same as original');
	
	$obj.add_var('xxx', $v);
	nok( pir::isnull__IP($obj.find_var('xxx')), 'Should find new entry xxx in original');
	ok( pir::isnull__IP($o2.find_var('xxx')), '... but not in clone');
}

sub test_contains() {
	my $obj := make_one();
	
	nok($obj.contains('foo'), 'No foo in namespace');
	$obj.add_var('foo', 100);
	ok($obj.contains('foo'), 'Now there is');
	
	nok($obj.contains('Bar'), 'No subnamespace Bar');
	$obj.add_namespace('Bar', pir::new__PS('NameSpace'));
	ok($obj.contains('Bar'), 'Now there is');
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
	ok($obj.isa('NameSpace'), 'isa returns true okay');
	nok($obj.isa('NotMe'), 'isa returns false okay');
	nok($obj.isa('Exception'), 'isa returns false okay 2');
}

sub test_new() {
	my $obj := make_one();
	ok(pir::isa__IPS($obj, 'NameSpace'), 'New returns correct type');
}