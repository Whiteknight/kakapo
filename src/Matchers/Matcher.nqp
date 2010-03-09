# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Matcher;

INIT {
	# No more work is need for this class.
	Kakapo::initload_done();
}

# Return a string suitable for use in an expression like:
# Match failed. Expected [describe_self] but [describe_failure].
method describe_failure($previous, $item) {
	$previous ~ "was '$item'";
}

# Return a string suitable for use in an expression like:
# Match failed. Expected [describe_self] but [describe_failure].
method describe_self($previous)		{ self.__ABSTRACT__ }
method matches($item)			{ self.__ABSTRACT__ }
