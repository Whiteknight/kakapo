# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::AnyOne;
=module
	Matcher that matches if any one of its child matchers accepts. This is a short-circuiting 'OR'.
=end

Global::use('Dumper');
Program::initload(:after('Matcher'));
Matcher::Factory::export_sub(Matcher::AnyOne::factory, :as('any_of'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;	
	
	my $class_name := 'Matcher::AnyOne';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
}

method describe_failure($item, $description) {
	return $description
		~ "FIXME: What to put here? (AnyOne)";
}

method describe_self($description) {
	return $description
		~ "FIXME: What to put here? (AnyOne)";
}

method described_as(*@value)		{ self._ATTR('described_as', @value); }

sub factory(*@list)				{ Matcher::AnyOne.new(Matcher::Factory::make_matcher_list(@list)); }

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	self.matchers(@args);
}

method matches($item) {
	for self.matchers {
		if $_.matches($item) {
			return 1;
		}
	}
	
	return 0;
}

method matchers(*@value)			{ self._ATTR('matchers', @value); }
