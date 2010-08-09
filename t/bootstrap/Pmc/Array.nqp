#! parrot-nqp

module bootstrap::Pmc::Array;

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
	
	plan(14 + 26);

	# Common bits (14)
	test_new();
	test_can();
	test_clone();
	test_defined();
	test_does();
	test_isa();
	
	# Specific bits
	test_append();
	test_bsearch();
	test_contains();
}

sub make_rsa() {
	my $str := "a::b::c";
	$str.split('::');
}

sub test_append() {
	my @a1 := (1, 2, 3);
	is(+@a1, 3, 'Array has 3 elements');
	
	my @a2 := (4, 5);
	is(+@a2, 2, 'Array has 2 elements');
	
	@a1.append(@a2);
	is(+@a1, 5, 'First array now has 5 elements');
	is(+@a2, 2, 'Second still has 2');
	
	my @rsa1 := make_rsa();
	is(@rsa1.elems, 3, 'RSA has 3 elements');
	my $str := 'd::e::f::g';
	@rsa1.append($str.split('::'));
	is(@rsa1.elems, 7, 'RSA has 7 elements');
}

sub test_bsearch() {
	my @dense := (3, 4, 5, 6, 7, 8, 9);
	
	is(@dense.bsearch(3), 0, 'Good indices for known contents');
	is(@dense.bsearch(9), 6, 'Good indices for known contents');
	is(@dense.bsearch(4), 1, 'Good indices for known contents');
	is(@dense.bsearch(8), 5, 'Good indices for known contents');
	is(@dense.bsearch(7), 4, 'Good indices for known contents');
	is(@dense.bsearch(5), 2, 'Good indices for known contents');
	is(@dense.bsearch(6), 3, 'Good indices for known contents');
	
	my @sparse := (11, 13, 15, 17, 19, 21, 23, 25);
	
	is(@sparse.bsearch(10), -1, 'Good indices for absent items');
	is(@sparse.bsearch(26), -9, 'Good indices for absent items');
	is(@sparse.bsearch(12), -2, 'Good indices for absent items');
	is(@sparse.bsearch(14), -3, 'Good indices for absent items');
	is(@sparse.bsearch(24), -8, 'Good indices for absent items');
	is(@sparse.bsearch(22), -7, 'Good indices for absent items');
	is(@sparse.bsearch(20), -6, 'Good indices for absent items');
	is(@sparse.bsearch(16), -4, 'Good indices for absent items');
	is(@sparse.bsearch(18), -5, 'Good indices for absent items');
}

sub test_can() {
	my @rpa := (1, 2, 3, 4);
	
	ok(@rpa.can('bsearch'), 'RPA can bsearch');
	nok(@rpa.can('nosuchmethod'), 'RPA cannot do nsm');
	
	my $str := "foo::bar::baz";
	my @rsa := $str.split('::');
	
	ok(@rsa.can('bsearch'), 'RSA can bsearch');
	nok(@rsa.can('nosuchmethod'), 'RSA cannot do nsm');
}

sub test_clone() {
	my @a1 := (1, 2, 3, 4);
	my @a2 := @a1.clone;
	
	ok(pir::isa__IPS(@a2, 'ResizablePMCArray'), 'clone works');
}

sub test_contains() {
	my @a1 := (1, 1, 2, 3, 5, 8, 13);
	
	ok(@a1.contains(8), 'Contains works okay');
	nok(@a1.contains(10), 'Contains fails okay');
	
	my @a2 := make_rsa();
	ok(@a2.contains('c'), 'RSA contains okay');
	nok(@a2.contains('d'), 'RSA fails okay');
}

sub test_defined() {
	my @a1 := (1, 2, 3, 4);
	ok(@a1.defined, 'RPA is defined');
	
	my $str := 'a::b::c';
	my @rsa := $str.split('::');
	ok(@rsa.defined, 'RSA is defined');
}

sub test_does() {
	my @a1 := (1, 2, 3, 4);
	ok(@a1.does('array'), "RPA does array");
}

sub test_isa() {
	my @a1 := (1, 2, 3, 4);
	
	ok(@a1.isa('ResizablePMCArray'), 'RPA isa RPA');
	nok(@a1.isa('String'), 'RPA not a string');
	
	my @a2 := make_rsa();
	ok(@a2.isa('ResizableStringArray'), 'RSA isa RSA');
	nok(@a2.isa('ResizablePMCArray'), 'RSA not an RSA');
}

sub test_new() {
	my @rpa := ResizablePMCArray.new();
	ok(pir::isa__IPS(@rpa, 'ResizablePMCArray'), 'RPA Created correctly');
	
	my @rsa := ResizableStringArray.new();
	ok(pir::isa__IPS(@rsa, 'ResizableStringArray'), 'RSA Created correctly');
}
