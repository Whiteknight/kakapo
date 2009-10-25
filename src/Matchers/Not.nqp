module Matcher::Not {

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Global::use('Dumper');
		
		my $class_name := 'Matcher::Not';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}

	method describe_failure($item, $description) {
		return self.predicate.describe_failure($item, $description);
	}
	
	method describe_self($description) {
		return self.predicate.describe_self($description ~ "not ");
	}
	
	method init(@args, %opts) {
		unless +@args {
			DIE("You must provide a predicate Matcher for Match::Not");
		}
		
		self.predicate(@args.shift);
		Matcher::init(self, @args, %opts);
	}
	
	method matches($item) {
		my $result := ! self.predicate.matches($item);
		return $result;
	}
	
	method predicate(*@value)		{ self._ATTR('predicate', @value); }
}
