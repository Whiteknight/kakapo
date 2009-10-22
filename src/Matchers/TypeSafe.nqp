module Matcher::TypeSafe {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::TypeSafe';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}

	method describe_failure($item, $description) {
		my $failure;
		
		if Parrot::is_null($item) {
			$failure := 'was null';
		}
		elsif self.wrong_type {
			$failure := 'was the wrong type';
		}
		else {
			return self.describe_failure_typesafe($item, $description);
		}
		
		return $description ~ $failure;
	}

	method describe_failure_typesafe($item, $description) {
		return $description ~ "was: " ~ $item;
	}
		
	method matches($item) {
		self.wrong_type(0);
		
		if ! Parrot::is_null($item) {
			return self.matches_typesafe($item);
		}
		
		return 0;
	}	
	
	method matches_typesafe($item) {
		self.wrong_type(1);
		return 0;
	}
	
	method wrong_type(*@value)		{ self._ATTR('wrong_type', @value); }
}
