# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher;
=module
	Base class for all matchers.
=end


=begin

	These would be nice to have:
	less_than
	lt_num
	lt_str
	
	all_of
	any_of
	has_key
	has_value
	has_item
	has_type
	contains

=cut

Global::use('Dumper');

my $class_name := 'Matcher';

say("Creating class ", $class_name);
NOTE("Creating class ", $class_name);
Class::SUBCLASS($class_name,
	'Class::HashBased',
);
		
Program::initload(:done(1));


method describe_failure($item, $description) {
	return $description
		~ "was '" ~ $item ~ "'";
}

method describe_self($description)	{ self._ABSTRACT_METHOD; }

method init(@args, %opts) {
	Class::BaseBehavior::init(self, @args, %opts);
}

method matches($item)			{ self._ABSTRACT_METHOD; }
