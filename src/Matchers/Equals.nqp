# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Equals;
=module
TypeSafe matcher that matches if the target is the same as a preset value.
=end

Global::use('Dumper');
Program::initload(:after('Matcher::TypeSafe'));
Class::multi_sub('Matcher::Equals', 'factory', :starting_with('_factory_'));
Matcher::Factory::export_sub(Matcher::Equals::factory, :as('is'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
	
	my $class_name := 'Matcher::Equals';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher::TypeSafe'
	);
	
	Class::multi_method($class_name, 'matches_typesafe', :starting_with('_match_'));
}

method describe_self($description) {
	return $description 
		~ "a(n) "
		~ self.match_type
		~ " equal to '" ~ self.value ~ "'";
}

sub _factory_Float($value)			{ factory(Matcher::EqualsFloat.new($value)); }
sub _factory_Integer($value)		{ factory(Matcher::Equals.new($value, :match_type('Integer'))); }
sub _factory_Matcher($matcher)		{ Matcher::DescribedAs.new('is', $matcher); }
sub _factory_String($value)		{ factory(Matcher::Equals.new($value, :match_type('String'))); }

method find_match_type($item) {
	for ('Float', 'Integer') {
		if Opcode::isa($item, ~$_) {
			self.match_type(~$_);
		}
	}
	
	unless self.match_type {
		self.match_type('String');
	}
}

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	
	unless +@args {
		DIE("You must provide a comparison value for 'equals' matcher.");
	}
	
	self.value(@args.shift);
	self.find_match_type(self.value);
}

method _match_Float($item)		{ self.match_scalar($item); }
method _match_Integer($item)		{ self.match_scalar($item); }
method _match_String($item)		{ self.match_scalar($item); }

method match_type(*@value)		{ self._ATTR('match_type', @value); }

method match_scalar($item) {
	my $value := self.value;
	
	unless self.match_type {
		self.find_match_type($item);
	}

	if self.match_type eq 'String' {
		return $item eq $value;
	}
	else {
		return $item == $value;
	}
}

method value(*@value)			{ self._ATTR('value', @value); }
