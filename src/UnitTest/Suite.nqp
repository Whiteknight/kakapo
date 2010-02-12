# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Suite;
INIT {
	use(	'P6metaclass' );
	
	has(	'@!members' );
}

method add_test($test) {
	self.members.push($test);
	return self;
}

method add_tests(*@tests) {
	self.add_tests_(@tests);
	return self;
}

method add_tests_(@tests) {
	self.members.append(@tests);
	return self;
}

my method default_result($result) {
	return $result.defined ?? $result !! UnitTest::Result.new();
}

method num_tests() {
	return self.members.elements;
}

method run($result?) {
	unless $result.defined {
		$result := self.default_result;
	}

	for self.members {
		unless $result.should_stop {
			$_.run($result);
		}
	}
	
	return $result;
}