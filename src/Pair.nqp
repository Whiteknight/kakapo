module Pair;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;	
	
	Global::use('Dumper');
	
	my $class_name := 'Pair';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Class::ArrayBased',
	);	
}

method init(@args, %opts) {
	unless Parrot::get_integer(self) {
		Parrot::set_integer(self, 2);
	}

	if +@args { self.key(@args.shift); }
	if +@args { self.value(@args.shift); }
}

method key(*@value)			{ self._ATTR(0, @value); }
method value(*@value)			{ self._ATTR(1, @value); }
