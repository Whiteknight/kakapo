# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::InstanceOf;
=module
Matches if target is an instance of a pre-specified class.
=end
	
Global::use('Dumper');
Program::initload(:after('Matcher'));
Matcher::Factory::export_sub(Matcher::InstanceOf::factory, :as('instance_of'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
			
	my $class_name := 'Matcher::InstanceOf';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
	
	say($class_name, " initload done");
}

method describe_failure($item, $description) {
	if Opcode::isnull($item) {
		return $description ~ 'was null';
	}

	return $description ~ 'had type: ' ~ Opcode::typeof($item);
}

method describe_self($description) {
	return $description 
		~ "an instance of type '" ~ self.type_name ~ "'";
}

method factory(*@type) {
	my $matcher := Matcher::InstanceOf.new();
	
	if +@type {
		$matcher.type(@type.shift);
	}
	
	return $matcher;
}
		
method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	
	if +@args {
		self.type(@args.shift);
	}
}

method matches($item) {
	if Opcode::isnull($item) {
		return 0;
	}
	
	if Opcode::isa($item, self.type) {
		return 1;
	}
	
	return 0;
}

method type(*@value)		{ self._ATTR('type', @value); }

method type_name() {
	my $type := self.type;
	my $type_name := $type;
	
	unless Opcode::isa($type, 'String') {
		$type_name := Opcode::typeof($type);
	}
	
	return $type_name;
}
