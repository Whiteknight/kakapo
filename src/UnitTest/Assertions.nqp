# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Assertions;

INIT {
	Kakapo::depends_on( <UnitTest::Testcase> );
}

our sub _initload() { }

INIT {
	use( <UnitTest::Testcase> );

	export(<
		assert_block
		assert_block_false
		assert_can
		assert_can_not
		assert_defined
		assert_not_defined
		assert_equal
		assert_not_equal
		assert_instance_of
		assert_not_instance_of
		assert_isa
		assert_not_isa
		assert_match
		assert_not_match
		assert_null
		assert_not_null
		assert_same
		assert_not_same
		assert_throws
		assert_throws_nothing
		assert_true
		assert_false
		assert_within_delta
		want_fail
		want_pass
	> );
}

our sub assert_block($message, &block) {
	UnitTest::Testcase::fail($message) unless &block();
}

our sub assert_block_false($message, &block) {
	UnitTest::Testcase::fail($message) if &block();
}

our sub assert_can($obj, $method, $message) {
	UnitTest::Testcase::fail($message) unless pir::can($obj, $method);
}

our sub assert_can_not($obj, $method, $message) {
	UnitTest::Testcase::fail($message) if pir::can($obj, $method);
}

our sub assert_defined($obj, $message) {
    UnitTest::Testcase::fail($message) unless pir::defined($obj);
}

our sub assert_not_defined($obj, $message) {
    UnitTest::Testcase::fail($message) if pir::defined($obj);
}

our sub assert_does($obj, $role, $message) {
	UnitTest::Testcase::fail($message) unless pir::class__PP($obj).does($role);
}

our sub assert_does_not($obj, $role, $message) {
	UnitTest::Testcase::fail($message) if pir::class__PP($obj).does($role);
}

our sub assert_equal($o1, $o2, $message) {
	UnitTest::Testcase::fail($message) unless pir::iseq__IPP($o2, $o1);
}

our sub assert_not_equal($o1, $o2, $message) {
	UnitTest::Testcase::fail($message) if pir::iseq__IPP($o2, $o1);
}

our sub assert_instance_of($obj, $class, $message) {
	UnitTest::Testcase::fail($message) unless pir::class__PP($obj) =:= P6metaclass.get_parrotclass($class);
}

our sub assert_not_instance_of($obj, $class, $message) {
	UnitTest::Testcase::fail($message) if pir::class__PP($obj) =:= P6metaclass.get_parrotclass($class);
}

our sub assert_isa($obj, $class, $message) {
	UnitTest::Testcase::fail($message) unless pir::isa__iPP($obj, P6metaclass.get_parrotclass($class));
}

our sub assert_not_isa($obj, $class, $message) {
	UnitTest::Testcase::fail($message) if pir::isa__iPP($obj, P6metaclass.get_parrotclass($class));
}

our sub assert_match($obj, $matcher, $message) {
	unless $matcher.matches($obj) {
		my $explain := $matcher.describe_self("\nExpected ")
			~ $matcher.describe_failure("\nbut ", $obj);
		UnitTest::Testcase::fail($message ~ $explain);
	}
}

our sub assert_not_match($obj, $matcher, $message) {
	if $matcher.matches($obj) {
		UnitTest::Testcase::fail($message);
	}
}

our sub assert_null($obj, $message) {
	UnitTest::Testcase::fail($message) unless pir::isnull($obj);
}

our sub assert_not_null($obj, $message) {
	UnitTest::Testcase::fail($message) if pir::isnull($obj);
}

our sub assert_same($o1, $o2, $message) {
	UnitTest::Testcase::fail($message) unless $o1 =:= $o2;
}

our sub assert_not_same($o1, $o2, $message) {
	UnitTest::Testcase::fail($message) if $o1 =:= $o2;
}

our sub assert_throws($e_class, $message, &block) {
	my $ok := 0;
	my $exception;

	try {
		&block();

		CATCH { $exception := $!; }
	};

	unless $exception.defined && $exception.type == $e_class.type {
		UnitTest::Testcase::fail($message);
	}
}

our sub assert_throws_nothing($message, &block) {
	my $ok := 1;

	try {
		&block();
		CATCH { $ok := 0; }
	};

	UnitTest::Testcase::fail($message) unless $ok;
}

our sub assert_true($bool, $message) {
	UnitTest::Testcase::fail($message) unless $bool;
}

our sub assert_false($bool, $message) {
	UnitTest::Testcase::fail($message) if $bool;
}

our sub assert_within_delta($o1, $o2, $delta, $message) {
	my $difference := $o1 - $o2;
	$difference := - $difference if $difference < 0;
	UnitTest::Testcase::fail($message) unless $difference < $delta;
}

#~ assert_like(obj, regex, message)
#~ assert_not_like

our sub want_fail($message, &block) {
	assert_throws(Exception::UnitTestFailure, $message, &block);
}

our sub want_pass($message, &block) {
	assert_throws_nothing($message, &block);
}
