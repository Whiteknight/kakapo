# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module UnitTest::Loader;
INIT {
	use(	'P6metaclass' );
	
	has(	'%!seen_methods' );
	say("Loader init done");
}

method get_test_methods($class) {
	my @mro := $class.inspect('all_parents');
	my @test_methods := Array::empty();
	
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

method is_test_method($name) {
# Returns true for "test_foo" and "testFoo" names
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

method load_tests_from_testcase($testcase) {
	my $class := P6metaclass.get_parrotclass($testcase);
	my $suite := UnitTest::Suite.new;

	for self.get_test_methods($class) {
		my $metaclass := Q:PIR {
			$P0 = find_lex '$class'
			%r = getprop 'metaclass', $P0
		};
		
		$suite.add_test( $metaclass.WHAT.new(:name(~ $_)) );
	}
	
	return $suite;
}
