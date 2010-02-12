# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Elements;
# Matches when the C< .elements > of an object equal a given number.
# TODO: Create a Matcher variant, to allow C< elements(both(ge(0), lt(6))) >.

use('Dumper');
Program::initload(:after('Matcher::TypeSafe'));
Matcher::Factory::export_sub(Matcher::Elements::factory, :as('elements'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
	
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
	
sub factory($count)					{ Matcher::Elements.new($count); }

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

method _match_FixedPMCArray($item)		{ self.match_array($item); }
method _match_FixedStringArray($item)		{ self.match_array($item); }
method _match_Hash($item)			{ self.match_array($item); }
method _match_ResizablePMCArray($item)	{ self.match_array($item); }
method _match_ResizableStringArray($item)	{ self.match_array($item); }

method value(*@value)				{ self._ATTR('value', @value); }
