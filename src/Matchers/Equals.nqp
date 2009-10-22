module Matcher::Equals {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::Equals';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher::TypeSafe'
		);

		Class::multi_method($class_name, 'matches_typesafe', :starting_with('_match_'));
		NOTE("done");
	}

	method describe_self($description) {
		return $description 
			~ "a " ~ self.match_type
			~ " equal to " ~ self.value;
	}
	
	method find_match_type($item) {
		for ('Float', 'Integer') {
			if Parrot::isa($item, ~$_) {
				self.match_type(~$_);
			}
		}
		
		unless self.match_type {
			self.match_type('String');
		}
	}
	
	method init(@children, %attributes) {
		unless +@children {
			DIE("You must provide a comparison value for 'equals' matcher.");
		}
		
		self.value(@children.shift);		
	}

	method _match_Float($item)		{ self.match_scalar($item); }
	method _match_Integer($item)		{ self.match_scalar($item); }
	method _match_String($item)		{ self.match_scalar($item); }

	method match_type(*@value)		{ self._ATTR('match_type', @value); }
	
	method match_scalar($item) {
		my $value := self.value;
		
		unless self.match_type {
			self.find_match_type($item);
		}

		if self.match_type eq 'String' {
			return $item eq $value;
		}
		else {
			return $item == $value;
		}
	}
	
	method value(*@value)			{ self._ATTR('value', @value); }
}
