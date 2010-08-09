# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Assertions;

sub assert_block($message, &block) {
	Testcase::fail($message) unless &block();
}

sub assert_block_false($message, &block) {
	Testcase::fail($message) if &block();
}

sub assert_can($obj, $method, $message) {
	Testcase::fail($message) unless pir::can($obj, $method);
}

sub assert_can_not($obj, $method, $message) {
	Testcase::fail($message) if pir::can($obj, $method);
}

sub assert_defined($obj, $message) {
    Testcase::fail($message) unless pir::defined($obj);
}

sub assert_not_defined($obj, $message) {
    Testcase::fail($message) if pir::defined($obj);
}

sub assert_does($obj, $role, $message) {
	Testcase::fail($message) unless pir::class__PP($obj).does($role);
}

sub assert_does_not($obj, $role, $message) {
	Testcase::fail($message) if pir::class__PP($obj).does($role);
}

sub assert_equal($o1, $o2, $message) {
	Testcase::fail($message) unless pir::iseq__IPP($o2, $o1);
}

sub assert_not_equal($o1, $o2, $message) {
	Testcase::fail($message) if pir::iseq__IPP($o2, $o1);
}

sub assert_instance_of($obj, $class, $message) {
	Testcase::fail($message) unless pir::class__PP($obj) =:= P6metaclass.get_parrotclass($class);
}

sub assert_not_instance_of($obj, $class, $message) {
	Testcase::fail($message) if pir::class__PP($obj) =:= P6metaclass.get_parrotclass($class);
}

sub assert_isa($obj, $class, $message) {
	Testcase::fail($message) unless pir::isa__iPP($obj, P6metaclass.get_parrotclass($class));
}

sub assert_not_isa($obj, $class, $message) {
	Testcase::fail($message) if pir::isa__iPP($obj, P6metaclass.get_parrotclass($class));
}

sub assert_match($obj, $matcher, $message) {
	unless $matcher.matches($obj) {
		my $explain := $matcher.describe_self("\nExpected ")
			~ $matcher.describe_failure("\nbut ", $obj);
		Testcase::fail($message ~ $explain);
	}
}

sub assert_not_match($obj, $matcher, $message) {
	if $matcher.matches($obj) {
		Testcase::fail($message);
	}
}

sub assert_null($obj, $message) {
	Testcase::fail($message) unless pir::isnull($obj);
}

sub assert_not_null($obj, $message) {
	Testcase::fail($message) if pir::isnull($obj);
}

sub assert_same($o1, $o2, $message) {
	Testcase::fail($message) unless $o1 =:= $o2;
}

sub assert_not_same($o1, $o2, $message) {
	Testcase::fail($message) if $o1 =:= $o2;
}

sub assert_throws($e_class, $message, &block) {
	my $ok := 0;
	my $exception;

	try {
		&block();

		CATCH { $exception := $!; }
	};

	unless $exception.defined && $exception.type == $e_class.type {
		Testcase::fail($message);
	}
}

sub assert_throws_nothing($message, &block) {
	my $ok := 1;

	try {
		&block();
		CATCH { $ok := 0; }
	};

	Testcase::fail($message) unless $ok;
}

sub assert_true($bool, $message) {
	Testcase::fail($message) unless $bool;
}

sub assert_false($bool, $message) {
	Testcase::fail($message) if $bool;
}

sub assert_within_delta($o1, $o2, $delta, $message) {
	my $difference := $o1 - $o2;
	$difference := - $difference if $difference < 0;
	Testcase::fail($message) unless $difference < $delta;
}

#~ assert_like(obj, regex, message)
#~ assert_not_like

sub want_fail($message, &block) {
	assert_throws(Exception::UnitTestFailure, $message, &block);
}

sub want_pass($message, &block) {
	assert_throws_nothing($message, &block);
}
