module Matcher::True {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::True';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher::TypeSafe'
		);

		NOTE("done");
	}

	method describe_self($description) {
		return $description 
			~ "a true value";
	}
	
	method matches_typesafe($item) {
		my $result := 0;
		
		if $item {
			$result := 1;
		}
		
		return $result;
	}	
}
