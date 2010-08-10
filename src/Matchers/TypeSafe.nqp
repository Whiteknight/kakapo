# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Abstract class that handles type-safety and null/undef checking of its args.
module Matcher::TypeSafe;

INIT {
	Kakapo::depends_on('Matcher');
}

sub _initload() {
	extends( 'Matcher' );	
}

our method describe_failure($item, $description) {
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

our method describe_failure_typesafe($item, $description) {
	return $description ~ "was: " ~ $item;
}
	
our method matches($item) {
	self.wrong_type(0);
	
	if ! Opcode::isnull($item) {
		return self.matches_typesafe($item);
	}
	
	return 0;
}	

our method matches_typesafe($item) {
	self.wrong_type(1);
	return 0;
}

our method wrong_type(*@value)		{ self._ATTR('wrong_type', @value); }
