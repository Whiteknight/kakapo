# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class UnitTest::Listener {
	method add_error($failure)	{ }
	method add_failure($failure) { }
	method end_test($test)	{ }
	method start_test($test)	{ }
}

class UnitTest::Listener::TAP is UnitTest::Listener;
INIT {
	pir::load_bytecode('Test/Builder.pbc');
	
	use(	'P6metaclass' );
	
	has(	'$!test_builder', );
}

method add_error($failure) {
	self.add_failure($failure);	# Same for our purposes
}

method add_failure($failure) {
	self.test_builder.ok(0, self.get_test_label($failure.test_case));
	self.test_builder.diag( $failure.fault.message );
	self;
}

method end_test($test) {
	self.test_builder.ok(1, self.get_test_label($test));
	self;
}

method get_test_label($test) {
	if $test.verify {
		$test.verify;
	}
	elsif $test.name {
		$test.name;
	}
	else {
		'';
	}
}

method _init_(@pos, %named) {
	self._init_args_(@pos, %named);

	unless pir::defined(self.test_builder) {
		my $tb := Q:PIR { %r = new [ 'Test'; 'Builder' ] };
		self.test_builder($tb);
	}
}

method plan_tests($num_tests) {
	self.test_builder.plan($num_tests);
}
