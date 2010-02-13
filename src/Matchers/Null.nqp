module Matcher::Null {

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Global::use('Dumper');
		
		my $class_name := 'Matcher::Null';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}
	
	method describe_self($description) {
		return $description ~ "a null value";
	}
	
	method matches(*@value) {
		unless +@value {
			Program::die("A value must be passed to matches($item)");
		}
		
		return Opcode::isnull(@value[0]);
	}
}
