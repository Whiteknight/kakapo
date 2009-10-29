# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Boolean;
=module
	Slathers a text label on another matcher.
=end

Global::use('Dumper');
Program::initload(:after('Matcher'));
Matcher::Factory::export_sub(Matcher::Boolean::factory_true, :as('true'));
Matcher::Factory::export_sub(Matcher::Boolean::factory_false, :as('false'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;	
	
	my $class_name := 'Matcher::Boolean';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
}

method describe_self($description) {
	my $truth := self.expected ?? 'true' !! 'false';
	
	return $description 
		~ "a " ~ $truth ~ " value";
}

method expected(*@value)		{ self._ATTR('expected', @value); }

sub factory_false()			{ Matcher::Boolean.new(0); }
sub factory_true()				{ Matcher::Boolean.new(1); }

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	
	if +@args {
		self.expected(@args.shift);
	}	
}

method matches($item) {
	if $item {
		return self.expected;
	}
	
	return ! self.expected;
}	
