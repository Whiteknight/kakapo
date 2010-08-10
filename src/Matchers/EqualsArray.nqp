# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::EqualsArray;
# Matches if target is an array with specified contents.

use('Dumper');
Program::initload(:after('Matcher::TypeSafe'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
			
	my $class_name := 'Matcher::EqualsArray';
	
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
	my $result := Opcode::iseq(self.value, $item);
	return $result;
}

method value(*@value)			{ self._ATTR('value', @value); }
