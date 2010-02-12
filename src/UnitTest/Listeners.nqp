# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class UnitTest::Listener {
	method add_error($failure)	{ }
	method add_failure($failure) { }
	method end_test($test)	{ }
	method start_test($test)	{ }
}

class UnitTest::Listener::TAP;
INIT {
	use(	'P6metaclass' );
	
	has(	'$.plan',
		'$.test_number',
	);
}

method add_error($fault)		{ self.handle_fault($fault); }
method add_failure($fault)		{ self.handle_fault($fault); }

method end_test($test) {
	say(self.format_tap_report("ok", $test));
}

method format_tap_report($outcome, $test) {
	my $comment := self.get_test_label($test);
	
	return $outcome
		~ ' ' ~ self.test_number
		~ ($comment ?? ' - ' ~ $comment !! '');
}

method get_test_label($test) {
	if $test.verify {
		return $test.verify;
	}
	
	if $test.name {
		return $test.name;
	}
	
	return '';
}

method handle_fault($f) {
	say(self.format_tap_report("not ok", $f.test_case));
	say('# ' ~ $f.fault.message);
}

method plan_tests($num_tests) {
	unless self.plan.defined {
		if $num_tests > 0 {
			self.plan($num_tests);
			say("1..$num_tests");
		}
		else {
			self.plan("no plan");
			say("no plan");
		}
	}
}

method start_test($test) {
	self.test_number(1 + self.test_number);
}