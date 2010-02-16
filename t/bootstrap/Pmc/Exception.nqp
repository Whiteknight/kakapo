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
	
	plan(11 + 3);

	# Common bits (11)
	test_new();		# 1
	test_can();		# 3
	test_clone();	# 4
	test_defined();	# 1
	test_does();		# 1
	test_isa();		# 1
	
	test_type();		# 1
	test_throw();	# 2
}

sub test_can() {
	my $e := Exception.new;
		
	ok($e.can('throw'), 'Exception can throw');
	ok($e.can('clone'), '... can clone');
	nok($e.can('nosuchmethod'), '... cannot do nsm');
}

sub test_clone() {
	my $e := Exception.new;
	
	$e.type(1234);
	is($e.type, 1234, 'Set type okay');
	my $f := $e.clone;
	#ok($f.type, 1234, 'Clone type okay');
	todo($f.type == 1234, 'Clone type not set.');
	$e.type(43);
	is($e.type, 43, 'Reset type okay');
	#ok($f.type, 1234, 'Clone type unchanged');
	todo($f.type == 1234, 'Clone type unchanged');
}

sub test_defined() {
	my $e := Exception.new;	
	ok($e.defined, 'Defined ok');
}

sub test_does() {
	my $e := Exception.new;	
	nok($e.does('array'), 'Not an array');
}

sub test_isa() {
	my $e := Exception.new;
	ok($e.isa('Exception'), 'Exception isa Exception');
	nok($e.isa('String'), '... but not a String');	
}

sub test_new() {
	my $e := Exception.new();
	ok(pir::isa__IPS($e, 'Exception'), 'Created correctly.');
}

sub test_type() {
	my $e := Exception.new();
	$e.type(1066);
	is($e.type, 1066, 'Type set okay');
}

sub test_throw() {
	my $e := Exception.new();
	
	$e.message('test message');
	$e.throw;
	nok(1, 'This is not reached');
	
	CATCH {
		is($!.message, 'test message', 'Got the right exception');
	}
}