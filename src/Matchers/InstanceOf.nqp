module Matcher::InstanceOf;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
			
	Global::use('Dumper');
	
	my $class_name := 'Matcher::InstanceOf';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
			
	NOTE("done");
}

method describe_failure($item, $description) {
	if Parrot::is_null($item) {
		return $description ~ 'was null';
	}

	return $description ~ 'had type: ' ~ Parrot::typeof($item);
}

method describe_self($description) {
	return $description 
		~ "an instance of type '" ~ self.type_name ~ "'";
}

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	
	if +@args {
		self.type(@args.shift);
	}
}

method matches($item) {
	if Parrot::is_null($item) {
		return 0;
	}
	
	if Parrot::isa($item, self.type) {
		return 1;
	}
	
	return 0;
}

method type(*@value)		{ self._ATTR('type', @value); }

method type_name() {
	my $type := self.type;
	my $type_name := $type;
	
	unless Parrot::isa($type, 'String') {
		$type_name := Parrot::typeof($type);
	}
	
	return $type_name;
}
