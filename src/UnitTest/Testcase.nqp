# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Testcase;

INIT {
	use(	'P6metaclass' );
	
	has(	'$.name',
		'$!verify',
	);
	
	export( 'assert_that', 'fail', 'verify_that' );
	export( 'assert_false', 'assert_true', :tags('ASSERTS'));
}

my method assert_match($target, $matcher) {
	unless $matcher.matches($target) {
		my $explain := $matcher.describe_self("Expected: ")
			~ $matcher.describe_failure($target, "\n     but: ");		
		self._fail($explain);
	}
}

sub assert_that($target, $matcher) {
	get_self().assert_match($target, $matcher);
}

sub assert_false($bool, $message?) {
	if $bool {
		get_self()._fail($message);
	}
}

sub assert_true($bool, $message?) {
	unless $bool {
		get_self()._fail($message);
	}
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
			
			if $!.type == Exception::UnitTestFailure.type {
				$result.add_failure(self, $!);
			}
			else {
				$result.add_error(self, $!);
			}
		}
	};
	
	try {
		self.tear_down();
		
		CATCH {
			$!.handled(1);
			
			unless $exception.defined {
				$exception := $!;
				
				if $!.type == Exception::UnitTestFailure.type {
					$result.add_failure(self, $!);
				}
				else {
					$result.add_error(self, $!);
				}
			}
		}
	};
	
	unless $exception.defined {
		# say("Caught: $exception");
		# say($exception.backtrace_string);
		
		$result.end_test(self);
	}
	
	return $result;
}

method run_test() {
	Parrot::call_method(self, self.name);
}

our method set_up() { }

our method suite() {
	return self.default_loader.load_tests_from_testcase(self);
}

our method tear_down() { }

sub verify_that(*@text) {
	get_self().verify(@text.join);
}
