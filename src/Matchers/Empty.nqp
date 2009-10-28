module Matcher::Empty;

Global::use('Dumper');
Global::use('Opcode');

my $class_name := 'Matcher::Empty';

NOTE("Creating class ", $class_name);

Class::SUBCLASS($class_name,
	'Matcher::TypeSafe'
);
		
NOTE("done");

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
