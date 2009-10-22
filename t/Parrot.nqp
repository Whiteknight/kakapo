module Kakapo::Test::Parrot;

_ONLOAD();

say("Onload done");
Kakapo::Test::Parrot.run_all_tests;

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	Q:PIR { load_bytecode 'library/kakapo.pbc' };
	
	Parrot::IMPORT('Dumper');
	Parrot::IMPORT('Matcher::Factory');
	
	my $class_name := 'Kakapo::Test::Parrot';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Testcase',
	);
	
	#Parrot::load_bytecode('src/Parrot.pbc');
}

method test_defined() {
	my $one := 1;
	my $zero := 0;
	my $empty := '';
	my $nonempty := 'foo';
	my $undef;
	my @empty := Array::empty();
	my %empty := Hash::empty();
	
	self.assert_that('defined(1)', Parrot::defined($one), returns(true()));
	self.assert_that('defined(0)', Parrot::defined($zero), returns(true()));
	self.assert_that('defined(q<>)', Parrot::defined($empty), returns(true()));
	self.assert_that('defined("foo")', Parrot::defined($nonempty), returns(true()));
	self.assert_that('defined(undef)', Parrot::defined($undef), returns(false()));
	self.assert_that('defined(null)', Parrot::defined(Bogus::symbol), returns(false()));
	self.assert_that('defined(@())', Parrot::defined(@empty), returns(true()));
	self.assert_that('defined(%())', Parrot::defined(%empty), returns(true()));
}

method test_is_null() {
	my $one := 1;
	my $zero := 0;
	my $empty := '';
	my $nonempty := 'foo';
	my $undef;
	my @empty := Array::empty();
	my %empty := Hash::empty();
	
	self.assert_that('is_null(1)', Parrot::is_null($one), returns(false()));
	self.assert_that('is_null(0)', Parrot::is_null($zero), returns(false()));
	self.assert_that('is_null(q<>)', Parrot::is_null($empty), returns(false()));
	self.assert_that('is_null(undef)', Parrot::is_null($undef), returns(false()));
	self.assert_that('is_null(null)', Parrot::is_null(Bogus::symbol), returns(true()));
	self.assert_that('is_null(@())', Parrot::is_null(@empty), returns(false()));
	self.assert_that('is_null(%())', Parrot::is_null(%empty), returns(false()));
}
