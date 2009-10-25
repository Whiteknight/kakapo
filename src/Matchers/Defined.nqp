module Matcher::Defined {

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Global::use('Dumper');
		
		my $class_name := 'Matcher::Defined';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}
	
	method describe_self($description) {
		return $description ~ "a defined object";
	}
	
	method matches(*@value) {
		unless +@value {
			Parrot::die("A value must be passed to matches($item)");
		}

		my $result := Parrot::defined(@value[0]);		
		return $result;
	}
}

