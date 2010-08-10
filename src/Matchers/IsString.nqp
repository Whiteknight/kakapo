# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# TypeSafe matcher that matches if the target is the same as a preset string.
module Matcher::IsString ;

has $!string;

INIT {
	Kakapo::depends_on(|<
		Matcher 
		Matcher::Factory
		Matcher::TypeSafe
	>);
}

sub _initload() {
	extends( Matcher::TypeSafe );
	has( <$!string> );
	auto_accessors( :private );

	Matcher::Factory::export_sub(Matcher::IsString::factory, :as('is_string'));
}

our method describe_self($description = '') {
	$description ~ "string '$!string'";
}

our method describe_failure($item, $description = '') {
	$description ~ "was (string) '$item'";
}

sub factory($string) {
	Matcher::IsString.new: :string($string);
}

our method _init_obj($string?, *%named) {
	if $string.defined {
		super(:string($string), |%named);
	}
	else {
		super( |%named );
	}
}

our method matches($item) {
	$!string eq ~$item;
}