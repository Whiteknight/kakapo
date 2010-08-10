# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::EqualsFloat;
# TypeSafe matcher that matches if the target is the same as a preset value. This version compares floats with an approximation range.

use('Dumper');
Program::initload(:after('Matcher::TypeSafe'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
	
	my $class_name := 'Matcher::EqualsFloat';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher::TypeSafe'
	);
	
	Class::multi_method($class_name, 'matches_typesafe', :starting_with('_match_'));
}

our method describe_failure($item, $description) {
	return $description
		~ $item
		~ " differed by "
		~ self.difference($item);
}

our method describe_self($description) {
	return $description 
		~ "a Number equal to " ~ self.value;
}

our method difference($item) {
	my $difference := $item - self.value;
	my $abs := Q:PIR {
		$P0 = find_lex '$difference'
		%r = abs $P0
	};
	return $abs;
}

our method init(@children, %attributes) {
	unless +@children {
		DIE("You must provide at least a target value for is-close-to matcher");
	}
	
	self.value(@children.shift);
	
	if +@children {
		self.within(@children.shift);
	}
	else {
		if self.value != 0 {
			self.within(self.value * '0.00001');
		}
		else {
			self.within('0.00001');
		}
	}
}

our method _match_Float($item)		{ self.match_scalar($item); }
our method _match_Integer($item)		{ self.match_scalar($item); }
our method _match_String($item)		{ self.match_scalar($item); }

# NB: cannot use _match_scalar because of mmd bug (TT#1133)
our method match_scalar($item) {
	if self.difference($item) <= self.within {
		return 1;
	}
	
	return 0;
}

our method value(*@value)			{ self._ATTR('value', @value); }
our method within(*@value)			{ self._ATTR('within', @value); }
