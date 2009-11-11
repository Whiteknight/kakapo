# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Empty;
=module
Matches if target is an instance of a pre-specified class.
=end

	
Global::use('Dumper');
Program::initload(:after('Matcher::TypeSafe'));
Matcher::Factory::export_sub(Matcher::Empty::factory, :as('empty'));


sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
			
	my $class_name := 'Matcher::Empty';

	Class::SUBCLASS($class_name,
		'Matcher::TypeSafe'
	);
}

method describe_failure($item, $description) {
	return $description ~ 'had type: ' ~ Opcode::typeof($item);
}

method describe_self($description) {
	return $description 
		~ "empty";
}

method matches_typesafe($item) {
	if Opcode::can($item, 'is_empty') {
		return $item.is_empty();
	}
	elsif Opcode::can($item, 'elements') {
		return $item.elements() == 0;
	}
	elsif Opcode::does($item, 'array') {
		return Opcode::elements($item) == 0;
	}
	elsif Opcode::does($item, 'hash') {
		return $item.keys() == 0;
	}
	
	Opcode::die("Don't know how to determine if this object is empty.");
}
