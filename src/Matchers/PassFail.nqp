# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Evaluates match in boolean context
module Matcher::PassFail;

has $!returning;

method describe_self($previous? = '') {
	$previous ~ ($!returning
		?? 'a "pass," always'
		!! 'a "fail," always');
}

sub factory_fail()		{ Matcher::PassFail.new(:fail); }
sub factory_pass()		{ Matcher::PassFail.new(:pass); }
method matches($item)	{ $!returning; }

method pass($ignore)	{ $!returning := 1; }
method fail($ignore)		{ $!returning := 0; }
