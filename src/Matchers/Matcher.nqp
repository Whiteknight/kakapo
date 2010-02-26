# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Matcher;

INIT {
	# No more work is need for this class.
	Kakapo::initload_done();
}

method describe_failure($item, $previous) {
	$previous ~ "was '$item'";
}

method describe_self($previous)		{ self.__ABSTRACT__ }
method matches($item)			{ self.__ABSTRACT__ }
