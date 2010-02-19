# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::UnitTestFailure is Exception::Wrapper {
	method severity() { Exception::Severity.ERROR; }
}

module UnitTest::Testcase;

INIT {
	has(	'$.name',
		'$!verify',
	);
	
	export( 'assert_match',
		'assert_that',
		'fail',
		'fail_if',
		'fail_unless',
		'verify_that'
	);
}

method assert_match($target, $matcher) {
	unless $matcher.matches($target) {
		my $explain := $matcher.describe_self("Expected: ")
			~ $matcher.describe_failure($target, "\n     but: ");		
		self._fail($explain);
	}
}

sub assert_that($target, $matcher) {
	get_self().assert_match($target, $matcher);
}

my method default_loader() {
	UnitTest::Loader.new;
}

my method default_result() {
	my $result := UnitTest::Result.new;
	$result.add_listener(UnitTest::Listener::TAP.new);
	return $result;
}

my method _fail($why) {
	Exception::UnitTestFailure.new(:message($why)).throw;
}

sub fail($why) {
	get_self()._fail($why);
}

sub fail_if($condition, $why) {
	if ($condition) {
		get_self()._fail($why);
	}
}

sub fail_unless($condition, $why) {
	unless ($condition) {
		get_self()._fail($why);
	}
}

sub get_self() {
	my $self := pir::find_dynamic_lex__PS('self');
	
	if pir::isnull($self) {
		pir::die("Fatal: No 'self' lexical in any caller scope");
	}
	
	return $self;
}

our method num_tests() {
	return 1;
}

# NOTE: Don't call this directly!! Call .suite.run instead.
method run($result?) {
	unless $result.defined {
		$result := self.default_result;
	}
	
	$result.start_test(self);
	my $exception;
	
	try {
		self.set_up();
		self.run_test();
	
		CATCH {
			$exception := $!;
			$!.handled(1);
		}
	};
	
	try {
		self.tear_down();

		CATCH {
			$!.handled(1);
			
			unless $exception.defined {
				$exception := $!;
			}
		}
	};

	if $exception.defined {
		if $exception.type == Exception::UnitTestFailure.type {
			$result.add_failure(self, $exception);
		}
		else {
			$result.add_error(self, $exception);
		}
	}
	else {
		$result.end_test(self);
	}
	
	$result;
}

method run_test() {
	Parrot::call_method(self, self.name);
}

our method set_up() { }

our method suite() {
	self.default_loader.load_tests_from_testcase(self);
}

our method tear_down() { }

sub verify_that(*@text) {
	get_self().verify(@text.join);
}
