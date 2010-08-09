# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Evaluates match in TrueFalse context
module Matcher::TrueFalse;

has $!expected;

method describe_self($previous? = '') {
	$previous ~ ($!expected
		?? 'a true value'
		!! 'a false value');
}

sub factory_false()			{ Matcher::TrueFalse.new(:false); }
sub factory_true()			{ Matcher::TrueFalse.new(:true); }

method false($ignored?) {
	$!expected := 0;
}

method matches($item) {
	$item
		?? $!expected
		!! !$!expected;
}

method true($ignored?) {
	$!expected := 1;
}
