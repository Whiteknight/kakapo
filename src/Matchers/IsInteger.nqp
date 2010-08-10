# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# TypeSafe matcher that matches if the target is the same as a preset integer.
module Matcher::IsInteger ;

has $!integer;

our method describe_self($description = '') {
	$description ~ "integer $!integer";
}

our method describe_failure($item, $description = '') {
	$description ~ "was (integer) " ~ pir::box__pi(pir::set__ip($item));
}

sub factory($integer) {
	Matcher::IsInteger.new: :integer($integer);
}

our method _init_obj($integer?, *%named) {
	$!integer := pir::new__ps('Integer');

	if $integer.defined {
		super(:integer($integer), |%named);
	}
	else {
		super( |%named );
	}
}

our method integer($value?) {
	if $value.defined {
		pir::assign__vpi($!integer, $value);
	}
	else {
		$!integer;
	}
}

our method matches($item) {
	pir::iseq__iii($!integer, $item);
}
