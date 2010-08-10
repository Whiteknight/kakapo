# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Asserts that a value is not undef.
module Matcher::Defined;

INIT {
	Kakapo::depends_on(<
		Matcher
		Matcher::Factory
	>);
}

sub _initload() {
	extends( Matcher );
	
	Matcher::Factory::export_sub(Matcher::Defined::factory, :as('defined'));
}

our method describe_self($description = '') {
	$description ~ "a defined object";
}

sub factory() {
	Matcher::Defined.new;
}

our method matches(*@value) {
	unless +@value {
		die('A value must be passed to matches($item)');
	}

	pir::defined(@value[0]);		
}
