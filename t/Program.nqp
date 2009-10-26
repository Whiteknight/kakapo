=file t/Program.nqp

Test the Program component of the Kakapo library.

=cut

module Kakapo::Test::Program;

our @results := Array::empty();

_ONLOAD();

#Kakapo::Test::Program.run_all_tests;
Kakapo::Test::Program.run_tests('test_queue');

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	Global::use('Dumper');
	Parrot::IMPORT('Matcher::Factory');
	Program::_ONLOAD();
	
	my $class_name := 'Kakapo::Test::Program';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Testcase',
	);
}

sub sub1() {
	return 'foo';
}

sub sub2() {
	return 3;
}

method test_call() {
	
	self.note("Testing Program::call() function");
	
	my $result := Program::call('Kakapo::Test::Program::sub1');
	self.assert_that('Result of call to sub1', $result, is('foo'));
	
	$result := Program::call(Kakapo::Test::Program::sub2);
	self.assert_that('Result of call to sub2', $result, is(3));
}

sub q1() {
	@results.push('x1');
}

sub q2() {
	@results.push('x2');
}

sub q3() {
	@results.push('x3');
}

sub q4() {
	@results.push('x4');
}

sub q5() {
	@results.push('x5');
}

method test_queue() {
	
	self.note("Testing queue processing");
	
	Program::init('III', 'Kakapo::Test::Program::q3');
	Program::init('V',  'Kakapo::Test::Program::q5');
	Program::init('I', 'Kakapo::Test::Program::q1', :first(1));
	Program::init('II',  'Kakapo::Test::Program::q2', :before('III'));
	Program::init('IV',  'Kakapo::Test::Program::q4', :after('III', 'V'));
	
	self.assert_that('Results array', @results, is(empty()));
	
	Program::process_init_queue();
	
	self.assert_that('Results array[0]', @results[0], is('x1'));
	self.assert_that('Results array[1]', @results[1], is('x2'));
	self.assert_that('Results array[2]', @results[2], is('x3'));
	self.assert_that('Results array[3]', @results[3], is('x5'));
	self.assert_that('Results array[4]', @results[4], is('x4'));
}
