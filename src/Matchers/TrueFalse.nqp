# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Evaluates match in TrueFalse context
module Matcher::TrueFalse;

has $!expected;

INIT {
	Kakapo::depends_on(|<
		Matcher 
		Matcher::Factory
	>);	
}

sub _initload() {
	extends(	Matcher );
	has(		'$!expected' );
	auto_accessors( :private );
	
	Matcher::Factory::export_sub(Matcher::TrueFalse::factory_true, :as('true'));
	Matcher::Factory::export_sub(Matcher::TrueFalse::factory_false, :as('false'));
}

method describe_self($previous? = '') {
	$previous ~ (self.expected 
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
		?? self.expected 
		!! !self.expected;
}

method true($ignored?) {
	$!expected := 1;
}
