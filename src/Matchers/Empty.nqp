module Matcher::Empty;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
			
	Global::use('Dumper');
	
	my $class_name := 'Matcher::Empty';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher::TypeSafe'
	);
			
	NOTE("done");
}

method describe_failure($item, $description) {
	return $description ~ 'had type: ' ~ Parrot::typeof($item);
}

method describe_self($description) {
	return $description 
		~ "empty";
}

method matches_typesafe($item) {
	if Parrot::can($item, 'is_empty') {
		return $item.is_empty();
	}
	elsif Parrot::can($item, 'elements') {
		return $item.elements() == 0;
	}
	elsif Parrot::does($item, 'array') {
		return Parrot::elements($item) == 0;
	}
	elsif Parrot::does($item, 'hash') {
		return $item.keys() == 0;
	}
	
	Parrot::die("Don't know how to determine if this object is empty.");
}
