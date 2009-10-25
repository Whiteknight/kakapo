module Matcher::EqualsArray {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Global::use('Dumper');
		
		my $class_name := 'Matcher::EqualsArray';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher::TypeSafe'
		);
	}

	method describe_self($description) {
		return $description 
			~ "an array equal to '" ~ self.value ~ "'";
	}
	
	method init(@children, %attributes) {
		Matcher::init(self, @children, %attributes);
		
		unless +@children {
			DIE("You must provide a comparison value for 'EqualsArray' matcher.");
		}
		
		self.value(@children.shift);
	}
	
	method matches_typesafe($item) {
		my $result := Parrot::iseq(self.value, $item);
		return $result;
	}
	
	method value(*@value)			{ self._ATTR('value', @value); }
}
