# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class UnitTest::Suite
	is UnitTest::Standalone;

has	@!members;
has	$!num_tests;

INIT {
	auto_accessors( :private );
}

our method add_test($test) {
	@!members.push($test);
	$!num_tests := $!num_tests + $test.num_tests;
	self;
}

our method add_tests(*@tests) {
	for @tests {
		self.add_test($_);
	}

	self;
}

my method default_result() {
	my $result := UnitTest::Result.new();
	$result.add_listener(UnitTest::Listener::TAP.new);
	$result;
}

our method _init_obj(*@pos, *%named) {
        $!num_tests := 0;
        @!members := [ ];

        self._init_args(|@pos, |%named);
}

our method run($result = self.default_result) {

	$result.plan_tests(self.num_tests);

	for self.members {
		unless $result.should_stop {
			$_.run($result);
		}
	}

	$result;
}

sub sort_cmp($a, $b) {
	$a.name lt $b.name ?? -1 !! 1;
}

our method sort() {
	self.members.sort(UnitTest::Suite::sort_cmp);
	self;
}

our method suite() {
	self;
}
