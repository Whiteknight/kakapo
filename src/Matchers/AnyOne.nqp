module Matcher::AnyOne;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
			
	Parrot::IMPORT('Dumper');
	
	my $class_name := 'Matcher::AnyOne';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
			
	NOTE("done");
}

method describe_failure($item, $description) {
	return $description
		~ "FIXME: What to put here? (AnyOne)";
}

method describe_self($description) {
	return $description
		~ "FIXME: What to put here? (AnyOne)";
}

method described_as(*@value)		{ self._ATTR('described_as', @value); }

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	self.matchers(@args);
}

method matches($item) {
	for self.matchers {
		if $_.matches($item) {
			return 1;
		}
	}
	
	return 0;
}

method matchers(*@value)			{ self._ATTR('matchers', @value); }
