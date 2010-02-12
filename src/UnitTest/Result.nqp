# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Failure;
INIT {
	use(	'P6metaclass' );
	
	has(	'$.fault', 
		'$.test_case' 
	);
}

class UnitTest::Result;
INIT {
	use(	'P6metaclass' );
	
	has(	'@!errors',
		'@!failures',
		'@!listeners',
		'$.should_stop',
		'$.num_tests',
	);
}

method add_error($test, $error) {
	return self.add_fault($test, $error, 
		:notify('add_error'), 
		:queue(self.errors));
}

method add_failure($test, $failure) {
	return self.add_fault($test, $failure, 
		:notify('add_failure'), 
		:queue(self.failures));
}

my method add_fault($test, $exception, :$notify, :$queue) {
	my $failure := UnitTest::Failure.new(
		:fault($exception),
		:test_case($test),
	);

	$queue.push($failure);
	self.notify_listeners($notify, $failure);
	return self;
}

method add_listener($listener) {
	self.listeners.push($listener);	
	return self;
}

method end_test($test) {
	self.notify_listeners('end_test', $test);	
	return self;
}

method error_count() {
	return self.errors.elements;
}

method failure_count() {
	return self.failures.elements;
}

method notify_listeners($method, *@pos, *%named) {
	for self.listeners {
		Parrot::call_method_($_, $method, @pos, %named);
	}
	
	return self;
}
	
method plan_tests($num_tests) {
	self.notify_listeners('plan_tests', $num_tests);
}

method remove_listener($listener) {
	my $index := 0;

	while $index < self.listeners.elements {
		if self.listeners[$index] =:= $listener {
			self.listeners.delete($index);
		}
		else {
			$index++;
		}
	}
}

method run_count() {
	return self.num_tests;
}

method start_test($test) {
	self.num_tests(self.num_tests + $test.num_tests);
	self.notify_listeners('start_test', $test);	
}

method stop() {
	self.should_stop(1);
}

method was_successful() {
	return self.error_count == 0 && self.failure_count == 0;
}
