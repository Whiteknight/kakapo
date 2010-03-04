# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class UnitTest::Listener {
	method add_error($failure)	{ }
	method add_failure($failure)	{ }
	method end_test($test)		{ }
	method start_test($test)		{ }
}

class UnitTest::Listener::TAP 
	is UnitTest::Listener;

has	$!test_builder;

INIT {
	pir::load_bytecode('Test/Builder.pbc');
}

method add_error($failure) {
	self.add_failure($failure);	# Same for our purposes
}

method add_failure($failure) {
	$!test_builder.ok(0, self.get_test_label($failure.test_case));
	$!test_builder.diag( $failure.fault.message );
	self;
}

method end_test($test) {
	$!test_builder.ok(1, self.get_test_label($test));
	self;
}

method get_test_label($test) {
	$test.verify || $test.name || '';
}

method _init_obj(*@pos, *%named) {
	%named<test_builder> := Parrot::new('Test::Builder')
		unless %named.contains(<test_builder>);
	self._init_args(|@pos, |%named);
}

method plan_tests($num_tests) {
	$!test_builder.plan($num_tests);
}

method test_builder($tb?) {
	if pir::defined($tb) {
		$!test_builder := $tb;
		self;
	}
	else {
		$!test_builder;
	}
}
