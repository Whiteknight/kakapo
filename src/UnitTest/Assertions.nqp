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
		assert_null
		assert_not_null
		assert_same
		assert_not_same
		assert_throws
		assert_throws_nothing	
		assert_within_delta
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

sub assert_equal($o1, $o2, $message) {
	fail($message) unless pir::iseq__IPP($o1, $o2);
}

sub assert_not_equal($o1, $o2, $message) {
	fail($message) if pir::iseq__IPP($o1, $o2);
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
	
	try {
		&block();
		
		CATCH { $ok := ($!.type == $e_class.type); }
	};
	
	fail($message) unless $ok;
}

sub assert_throws_nothing($message, &block) {
	my $ok := 1;
	
	try {
		&block();
		CATCH { $ok := 0; }
	};
	
	fail($message) unless $ok;
}

sub assert_within_delta($o1, $o2, $delta, $message) {
	my $difference := $o1 - $o2;
	$difference := - $difference if $difference < 0;
	fail($message) unless $difference < $delta;
}
	
#~ assert_like(obj, regex, message)
#~ assert_not_like

method assert_match($target, $matcher) {
	unless $matcher.matches($target) {
		my $explain := $matcher.describe_self("Expected: ")
			~ $matcher.describe_failure($target, "\n     but: ");		
		self._fail($explain);
	}
}

sub assert_that($target, $matcher) {
	Parrot::get_self().assert_match($target, $matcher);
}

