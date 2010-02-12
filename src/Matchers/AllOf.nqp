# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::AllOf;
# Matchers that matches only when all of its child matchers do. This is a short-circuiting 'AND'.

use('Dumper');
Program::initload(:after('Matcher'));
Matcher::Factory::export_sub(Matcher::AllOf::factory, :as('all_of'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
	
	my $class_name := 'Matcher::AllOf';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
}

method describe_failure($item, $description) {
	return $description
		~ "FIXME: What to put here? (allof)";
}

method describe_self($description) {
	return $description
		~ "FIXME: What to put here? (allof)";
}

method described_as(*@value)		{ self._ATTR('described_as', @value); }

sub factory(*@list)				{ Matcher::AllOf.new(Matcher::Factory::make_matcher_list(@list)); }

method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	self.matchers(@args);
}

method matches($item) {
	for self.matchers {
		unless $_.matches($item) {
			return 0;
		}
	}
	
	return 1;
}

method matchers(*@value)			{ self._ATTR('matchers', @value); }

