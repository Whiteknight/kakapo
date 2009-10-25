module Matcher::IdenticalTo {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Global::use('Dumper');
		
		my $class_name := 'Matcher::IdenticalTo';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher::TypeSafe'
		);
	}

	method describe_self($description) {
		return $description 
			~ "the same object as " ~ self.value;
	}
	
	method init(@children, %attributes) {
		unless +@children {
			DIE("You must provide a comparison value for 'IdenticalTo' matcher.");
		}
		
		self.value(@children.shift);		
	}

	method matches($item) {
		my $value := self.value;
		my $result := Q:PIR {
			$P0 = find_lex '$value'
			$P1 = find_lex '$item'
			$I0 = issame $P1, $P0
			%r = box $I0
		};
		return $result;
	}
	
	method value(*@value)			{ self._ATTR('value', @value); }
}
