# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Not;
=module
	Matcher that negates its single child.
=end

Global::use('Dumper');
Program::initload(:after('Matcher'));
Class::multi_sub('Matcher::Not', 'factory', :starting_with('_factory_'));
Matcher::Factory::export_sub(Matcher::Not::factory, :as('not'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
	
	my $class_name := 'Matcher::Not';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
}

method describe_failure($item, $description) {
	return self.predicate.describe_failure($item, $description);
}

method describe_self($description) {
	return self.predicate.describe_self($description ~ "not ");
}

sub _factory_Float($value)			{ factory(Matcher::factory::is($value)); }
sub _factory_Integer($value)		{ factory(Matcher::factory::is($value)); }
sub _factory_Matcher($matcher)		{ Matcher::Not.new($matcher); }
sub _factory_String($value)		{ factory(Matcher::factory::is($value)); }

method init(@args, %opts) {
	unless +@args {
		DIE("You must provide a predicate Matcher for Match::Not");
	}
	
	self.predicate(@args.shift);
	Matcher::init(self, @args, %opts);
}

method matches($item) {
	my $result := ! self.predicate.matches($item);
	return $result;
}

method predicate(*@value)			{ self._ATTR('predicate', @value); }
