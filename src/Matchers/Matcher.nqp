# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Matcher;

INIT {
	# No more work is need for this class.
	Program::initload(:done(1));
}

method describe_failure($item, $previous) {
	return $previous
		~ "was '$item'";
}

method describe_self($previous)		{ self._ABSTRACT_METHOD; }
method matches($item)			{ self._ABSTRACT_METHOD; }
