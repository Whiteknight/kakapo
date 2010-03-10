# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Assertions;

INIT {
	Kakapo::depends_on( <UnitTest::Testcase> );
}

sub _initload() {
	use( <UnitTest::Testcase> );
	
	export(<
		assert_block
		assert_block_false
		assert_can
		assert_can_not
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
	>);
}

sub assert_block($message, &block) {
	fail($message) unless &block();
}

sub assert_block_false($message, &block) {
	fail($message) if &block();
}

sub assert_can($obj, $method, $message) {
	fail($message) unless pir::can($obj, $method);
}

sub assert_can_not($obj, $method, $message) {
	fail($message) if pir::can($obj, $method);
}

# NB: The _equal assertions reverse the comparison so that the wanted form is dominant.
sub assert_equal($o1, $o2, $message) {
	fail($message) unless pir::iseq__IPP($o2, $o1);
}

sub assert_not_equal($o1, $o2, $message) {
	fail($message) if pir::iseq__IPP($o2, $o1);
}

sub assert_instance_of($obj, $class, $message) {
	fail($message) unless pir::class__PP($obj) =:= P6metaclass.get_parrotclass($class);
}

sub assert_not_instance_of($obj, $class, $message) {
	fail($message) if pir::class__PP($obj) =:= P6metaclass.get_parrotclass($class);
}

sub assert_isa($obj, $class, $message) {
	fail($message) unless pir::isa__iPP($obj, P6metaclass.get_parrotclass($class));
}

sub assert_not_isa($obj, $class, $message) {
	fail($message) if pir::isa__iPP($obj, P6metaclass.get_parrotclass($class));
}

sub assert_match($obj, $matcher, $message) {
	unless $matcher.matches($obj) {
		my $explain := $matcher.describe_self("\nExpected ")
			~ $matcher.describe_failure("\nbut ", $obj);
		fail($message ~ $explain);
	}
}

sub assert_not_match($obj, $matcher, $message) {
	if $matcher.matches($obj) {
		my $explain := $matcher.describe_self("\nExpected ")
			~ $matcher.describe_failure("\nbut ", $obj);
		fail($message ~ $explain);
	}
}

sub assert_null($obj, $message) {
	fail($message) unless pir::isnull($obj);
}

sub assert_not_null($obj, $message) {
	fail($message) if pir::isnull($obj);
}

sub assert_same($o1, $o2, $message) {
	fail($message) unless $o1 =:= $o2;
}

sub assert_not_same($o1, $o2, $message) {
	fail($message) if $o1 =:= $o2;
}

sub assert_throws($e_class, $message, &block) {
	my $ok := 0;
	my $exception;
	
	try {
		&block();
		
		CATCH { $exception := $!; }
	};

	unless $exception.defined || $exception.type != $e_class.type {
		fail($message);
	}
}

sub assert_throws_nothing($message, &block) {
	my $ok := 1;
	
	try {
		&block();
		CATCH { $ok := 0; }
	};
	
	fail($message) unless $ok;
}

sub assert_true($bool, $message) {
	fail($message) unless $bool;
}

sub assert_false($bool, $message) {
	fail($message) if $bool;
}

sub assert_within_delta($o1, $o2, $delta, $message) {
	my $difference := $o1 - $o2;
	$difference := - $difference if $difference < 0;
	fail($message) unless $difference < $delta;
}
	
#~ assert_like(obj, regex, message)
#~ assert_not_like
	
sub want_fail($message, &block) {
	assert_throws(Exception::UnitTestFailure, $message, &block);
}

sub want_pass($message, &block) {
	assert_throws_nothing($message, &block);
}
