# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Matcher that matches null values. Renamed to IsNull due to TT#1492
module Matcher::IsNull;

INIT {
	Kakapo::depends_on(|<
		Matcher
		Matcher::Factory
	>);
}

sub _initload() {
	extends( Matcher );
	
	Matcher::Factory::export_sub(Matcher::IsNull::factory, :as('null'));	
}

method describe_self($description = '') {
	$description ~ "a null value";
}

sub factory() {
	Matcher::IsNull.new;
}

method matches(*@args) {

	# NB: Be CAREFUL! It's *hard* to get NQP to leave the nulls alone. Double-check the
	# generated pir if you change this.
	
	pir::isnull(@args.shift);
}
