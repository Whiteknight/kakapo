# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Loader;
INIT {
	use(	'P6metaclass' );
	
	has(	'%!seen_methods' );
}

method configure_suite($class, @tests, :$suite) {
	unless $suite.defined {
		$suite := self.default_suite;
	}

	my $proto := pir::getprop__PSP('metaclass', $class).WHAT();

	for @tests -> $test {
		$suite.add_test: $proto.new(:name($test));
	}
	
	$suite;
}

method default_suite() {
	return UnitTest::Suite.new();
}

method get_test_methods($class) {
	my @mro := $class.inspect('all_parents');
	my @test_methods := Array::new();
	
	for @mro {
		my %methods := $_.inspect('methods');
		
		for %methods {
			my $name := ~ $_;
			
			if self.is_test_method($name) 
				&& ! self.seen_methods.contains($name) {
				self.seen_methods{$name} := 1;
				@test_methods.push($name);
			}
		}
	}

	return @test_methods;
}

# Returns true for "test_foo" and "testFoo" names
method is_test_method($name) {
	if $name.length > 4
		&& $name.substr(0, 4) eq 'test' {
		
		if $name[4] eq '_' {
			return 1;
		}

		if String::is_cclass('UPPERCASE', $name, :offset(4)) {
			return 1;
		}
		
		if String::is_cclass('NUMERIC', $name, :offset(4)) {
			return 1;
		}
	}

	return 0;
}

method load_tests_from_testcase($testcase, :$sort, :$suite) {
	my $class := P6metaclass.get_parrotclass($testcase);	
	my @tests := self.get_test_methods($class);
	
	self.configure_suite($class, @tests, :suite($suite));
}
