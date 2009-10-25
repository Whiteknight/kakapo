module Matcher::Elements {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Global::use('Dumper');
		
		my $class_name := 'Matcher::Elements';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher::TypeSafe'
		);
		
		Class::multi_method($class_name, 'matches_typesafe', :starting_with('_match_'));
	}

	method describe_failure_typesafe($item, $description) {
		return $description 
			~ $item.elements ~ " elements";
	}
	
	method describe_self($description) {
		return $description 
			~ self.value ~ " elements";
	}
	
	method init(@children, %attributes) {
		Matcher::init(self, @children, %attributes);
		
		unless +@children {
			DIE("You must provide an elements count for 'Elements' matcher.");
		}
		
		self.value(0 + @children.shift);
	}
	
	method match_array($item) {
		return $item.elements == self.value;
	}
	
	method _match_Array($item)			{ self.match_array($item); }
	method _match_ResizablePMCArray($item)	{ self.match_array($item); }
	method _match_ResizableStringArray($item)	{ self.match_array($item); }

	method value(*@value)			{ self._ATTR('value', @value); }
}
