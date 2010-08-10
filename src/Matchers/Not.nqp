# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Matcher that negates its single child.
module Matcher::Not;

has $!child;

INIT {
	Kakapo::depends_on('Matcher');
}

sub _initload() {
	extends(	'Matcher' );
	
	has(	'$!child' );

	Parrot::define_multisub('factory', :starting_with('factory'));
	Matcher::Factory::export_sub(Matcher::Not::factory, :as('not'));
}

# Pass through - the "reason for failure" will be the same, only the failure itself is reversed.
our method describe_failure($item, $description) {
	$!child.describe_failure($item, $description);
}

# Pass through with just a "not" prepended.
our method describe_self($description = '') {
	$!child.describe_self($description ~ "not ");
}

sub factory__Float($value)		{ factory(Matcher::Factory::is($value)); }
sub factory__Integer($value)		{ factory(Matcher::Factory::is($value)); }
sub factory__Matcher($matcher)	{ Matcher::Not.new($matcher); }
sub factory__String($value)		{ factory(Matcher::Factory::is($value)); }

our method _init_obj($child?, *%named) {
	$!child := $child;
	self;
}
	
our method matches($item) {
	! $!child.matches($item);
}
