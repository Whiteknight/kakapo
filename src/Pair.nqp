# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

=module Pair

Provides a basic Pair class.

=cut

module Pair;

Program::initload(:after('Class', 'Class::ArrayBased', 'Dumper', 'Global', 'Parrot'));

sub _initload() {
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
