module Matcher::AllOf;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
			
	Global::use('Dumper');
	
	my $class_name := 'Matcher::AllOf';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
			
	NOTE("done");
}

method describe_failure($item, $description) {
	return $description
		~ "FIXME: What to put here? (allof)";
}

method describe_self($description) {
	return $description
		~ "FIXME: What to put here? (allof)";
}

method described_as(*@value)		{ self._ATTR('described_as', @value); }

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	self.matchers(@args);
}

method matches($item) {
	for self.matchers {
		unless $_.matches($item) {
			return 0;
		}
	}
	
	return 1;
}

method matchers(*@value)			{ self._ATTR('matchers', @value); }
