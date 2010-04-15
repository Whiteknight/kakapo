# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# TypeSafe matcher that matches if the target is the same as a preset integer.
module Matcher::IsInteger ;

has $!integer;

INIT {
	Kakapo::depends_on(|<
		Matcher 
		Matcher::Factory
		Matcher::TypeSafe
	>);
}

sub _initload() {
	extends( Matcher::TypeSafe );
	has( <$!integer> );
	auto_accessors( :private );

	Matcher::Factory::export_sub(Matcher::IsInteger::factory, :as('is_integer'));
}

method describe_self($description = '') {
	$description ~ "integer $!integer";
}

method describe_failure($item, $description = '') {
	$description ~ "was (integer) " ~ pir::box__pi(pir::set__ip($item));
}

sub factory($integer) {
	Matcher::IsInteger.new: :integer($integer);
}

method _init_obj($integer?, *%named) {
	$!integer := pir::new__ps('Integer');
	
	if $integer.defined {
		super(:integer($integer), |%named);
	}
	else {
		super( |%named );
	}
}

method integer($value?) {
	if $value.defined {
		pir::assign__vpi($!integer, $value);
	}
	else {
		$!integer;
	}
}

method matches($item) {
	pir::iseq__iii($!integer, $item);
}