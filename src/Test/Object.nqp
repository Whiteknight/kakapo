# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Kakapo::Test::Object;

INIT {
	use(	'P6metaclass' );
	
	has(	'test_method' );
}

method run($result) {
	$result.start_test(self);
	Parrot::call_method(self, self.test_method);
	$result.end_test(self);
	$result.add_passing_test(self);
}
