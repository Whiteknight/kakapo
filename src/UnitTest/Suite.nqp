# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Suite;
INIT {
	use(	'P6metaclass' );
	
	has(	'@!members',
		'$.num_tests',
	);
}

method add_test($test) {
	self.members.push($test);
	self.num_tests(self.num_tests + $test.num_tests);
	return self;
}

method add_tests(*@tests) {
	self.add_tests_(@tests);
	return self;
}

method add_tests_(@tests) {
	for @tests {
		self.add_test($_);
	}
	return self;
}

my method default_result() {
	my $result := UnitTest::Result.new();
	$result.add_listener(UnitTest::Listener::TAP.new);
	return $result;
}

method run($result?) {
	unless $result.defined {
		$result := self.default_result;
	}

	$result.plan_tests(self.num_tests);
	
	for self.members {
		unless $result.should_stop {
			$_.run($result);
		}
	}
	
	return $result;
}

method suite() {
	return self.new;
}