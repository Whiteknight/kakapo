# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Matcher;

INIT {
	Program::initload(:done(1));
}

method describe_failure($item, $description) {
	return $description ~ "was '$item'";
}

method describe_self($description)	{ self._ABSTRACT_METHOD; }

method init(@args, %opts) {
	Class::BaseBehavior::init(self, @args, %opts);
}

method matches($item)			{ self._ABSTRACT_METHOD; }
