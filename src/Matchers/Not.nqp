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
	
#~ Class::multi_sub('Matcher::Not', 'factory', :starting_with('_factory_'));
#~ Matcher::Factory::export_sub(Matcher::Not::factory, :as('not'));

}

# Pass through - the "reason for failure" will be the same, only the failure itself is reversed.
method describe_failure($item, $description) {
	$!child.describe_failure($item, $description);
}

# Pass through with just a "not" prepended.
method describe_self($description? = '') {
	$!child.describe_self($description ~ "not ");
}

sub _factory_Float($value)			{ factory(Matcher::factory::is($value)); }
sub _factory_Integer($value)		{ factory(Matcher::factory::is($value)); }
sub _factory_Matcher($matcher)		{ Matcher::Not.new($matcher); }
sub _factory_String($value)		{ factory(Matcher::factory::is($value)); }

method _init_obj($child?, *%named) {
	$!child := $child;
	self;
}
	
method matches($item) {
	! $!child.matches($item);
}
