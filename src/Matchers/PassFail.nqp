# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Evaluates match in boolean context
module Matcher::PassFail;

has $!returning;

INIT {
	Kakapo::depends_on(|<
		Matcher 
		Matcher::Factory
	>);
}

sub _initload() {
	extends(	'Matcher' );
	has(		'$!returning' );
	
	Matcher::Factory::export_sub(Matcher::PassFail::factory_fail, :as('fail'));
	Matcher::Factory::export_sub(Matcher::PassFail::factory_pass, :as('pass'));
}

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