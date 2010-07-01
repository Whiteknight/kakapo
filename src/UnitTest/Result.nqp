# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Failure {
    has $!fault;
    has $!test_case;
}

class UnitTest::Result;

    has @!errors;
    has @!failures;
    has @!listeners;
    has $!should_stop;
    has $!num_tests;
    has $!planned_tests;

method add_error($test, $error) {
	self.add_fault($test, $error, :notify('add_error'), :queue(@!errors));
}

method add_failure($test, $failure) {
	self.add_fault($test, $failure, :notify('add_failure'), :queue(@!failures));
}

my method add_fault($test, $exception, :$notify, :$queue) {
	my $failure := UnitTest::Failure.new(
		:fault($exception),
		:test_case($test),
	);

	$queue.push($failure);
	self.notify_listeners($notify, $failure);
}

method add_listener($listener) {
	@!listeners.push($listener);
	self;
}

method end_test($test) {
	self.notify_listeners('end_test', $test);
}

method error_count() {
	@!errors.elems;
}

method failure_count() {
	@!failures.elems;
}

my method notify_listeners($method, *@pos, *%named) {
	for @!listeners {
		Parrot::call_method_($_, $method, @pos, %named);
	}

	self;
}

method plan_tests($num_tests) {
	# Ignore repeats in hierarchy of suites.
	unless $!planned_tests {
		$!planned_tests := $num_tests;
		self.notify_listeners: 'plan_tests', $num_tests;
	}
}

method remove_listener($listener) {
	my $index := 0;

	while $index < self.listeners.elems {
		if self.listeners[$index] =:= $listener {
			self.listeners.delete($index);
		}
		else {
			$index++;
		}
	}

	self;
}

method run_count() {
	$!num_tests;
}

method start_test($test) {
	$!num_tests := $!num_tests + $test.num_tests;
	self.notify_listeners('start_test', $test);
}

method stop() {
	$!should_stop := 1;
	self;
}

method was_successful() {
	self.error_count == 0 && self.failure_count == 0;
}
