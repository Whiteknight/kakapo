module Matcher::DescribedAs;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
			
	Global::use('Dumper');
	
	my $class_name := 'Matcher::DescribedAs';
	
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
	return self.predicate.describe_self($description ~ self.described_as ~ ' ');
}

method described_as(*@value)		{ self._ATTR('described_as', @value); }

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	
	unless self.described_as {
		unless +@args {
			Opcode::die("You must provide a description");
		}
		
		self.described_as(@args.shift);
	}
	
	unless self.predicate {
		unless +@args {
			Opcode::die("You must provide a Matcher predicate");
		}
		
		self.predicate(@args.shift);
	}
}

method matches(*@item) {
	my %opts;
	my $result := Parrot::call_method_(self.predicate, 'matches', @item, %opts);
	return $result;
}

method predicate(*@value)		{ self._ATTR('predicate', @value); }
