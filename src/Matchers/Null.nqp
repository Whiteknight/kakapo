# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Matcher that negates its single child.
module Matcher::Null;

INIT {
	Kakapo::depends_on('Matcher');
}

sub _initload() {
	extends(	'Matcher' );
}

method describe_self($description) {
	$description ~ "a null value";
}

method matches($subject) {
	pir::isnull($subject);
}
