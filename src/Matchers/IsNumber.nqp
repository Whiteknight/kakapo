# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# TypeSafe matcher that matches if the target is the same as a preset number.
module Matcher::IsNumber ;

has $!number;

method describe_self($description = '') {
	$description ~ "number $!number";
}

method describe_failure($item, $description = '') {
	$description ~ "was (number) " ~ pir::box__pi(pir::set__ip($item));
}

sub factory($number) {
	Matcher::IsNumber.new: :number($number);
}

method _init_obj($number?, *%named) {
	$!number := pir::new__ps('Float');

	if $number.defined {
		super(:number($number), |%named);
	}
	else {
		super( |%named );
	}
}

method number($value?) {
	if $value.defined {
		pir::assign__vpn($!number, $value);
	}
	else {
		$!number;
	}
}

method matches($item) {
	pir::iseq__inn($!number, $item);
}
