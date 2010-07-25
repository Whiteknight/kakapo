# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::UnitTestFailure is Exception::Wrapper {
	method severity() { Exception::Severity.ERROR; }
}

module UnitTest::Testcase;

has $!todo;
has $!verify;

my method default_loader() {
	UnitTest::Loader.new;
}

my method default_result() {
	my $result := UnitTest::Result.new;
	$result.add_listener(UnitTest::Listener::TAP.new);
	return $result;
}

our sub fail($why) {
	Exception::UnitTestFailure.new(:message($why)).throw;
}

# DEPRECATED
sub fail_if($condition, $why) {
	fail($why) if $condition;
}

# DEPRECATED
sub fail_unless($condition, $why) {
	fail($why) unless $condition;
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
	my $suite := self.default_loader.load_tests_from_testcase(self);
	$suite.name: "Test suite for " ~ pir::typeof__SP(self.WHAT);
	$suite;
}

our method tear_down() { }

sub TEST_MAIN(:$namespace = Parrot::caller_namespace()) {
	my $parent_nsp := $namespace.get_parent;
	my $namespace_name := ~ $namespace;
	my $proto_obj := $parent_nsp.get_sym: $namespace_name;

	if ! is_null( $proto_obj ) && isa( $proto_obj, 'P6protoobject' ) {
		$proto_obj.MAIN();
	}
	elsif $namespace.contains: 'MAIN' {
		if ! is_null( $proto_obj ) {
			$namespace<MAIN>($proto_obj);
		}
		else {
			$namespace<MAIN>();
		}
	}
	else {
		my $ns_name := $namespace.string_name;
		die( "Could not locate proto-object for namespace $ns_name. Could not find 'MAIN()' in namespace. Nothing to do." );
	}
}

sub todo_test( *@text ) {
	Parrot::get_self().todo: @text.join;
}

sub verify_that(*@text) {
	Parrot::get_self().verify: @text.join;
}
