# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::TypeSafe;
=module
	Abstract class that handles type-safety and null/undef checking of its args.
=end
	
say("*** Typesafe block13");
Global::use('Dumper');
Program::initload(:after('Matcher'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;			
	
	my $class_name := 'Matcher::TypeSafe';
	
	say("Creating class ", $class_name);
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
}

method describe_failure($item, $description) {
	my $failure;
	
	if Opcode::isnull($item) {
		$failure := 'was null';
	}
	elsif self.wrong_type {
		$failure := "was the wrong type ('" ~ Opcode::typeof($item) ~ "')";
	}
	else {
		return self.describe_failure_typesafe($item, $description);
	}
	
	return $description ~ $failure;
}

method describe_failure_typesafe($item, $description) {
	return $description ~ "was: " ~ $item;
}
	
method matches($item) {
	self.wrong_type(0);
	
	if ! Opcode::isnull($item) {
		return self.matches_typesafe($item);
	}
	
	return 0;
}	

method matches_typesafe($item) {
	self.wrong_type(1);
	return 0;
}

method wrong_type(*@value)		{ self._ATTR('wrong_type', @value); }
