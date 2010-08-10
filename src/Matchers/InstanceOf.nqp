# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Matches if target is an instance of a pre-specified class.
module Matcher::InstanceOf;

has $!type_name;

INIT {
	Kakapo::depends_on('Matcher');
}

sub _initload() {
	extends(Matcher);
	has( <$!type_name> );
	
	Matcher::Factory::export_sub(Matcher::InstanceOf::factory, :as('instance_of'));
}

our method describe_failure($item, $description) {
	$description
		~ ( is_null($item)
			?? 'was null'
			!! 'had type: ' ~ Opcode::typeof($item));
}

our method describe_self($description) {
	$description ~ qq<an instance of type '$!type_name'>;
}

sub factory($type, *%named) {
	%named<type> := $type;
	my $matcher := Matcher::InstanceOf.new(|%named);
}

our method matches($item) {
	! is_null($item) 
		&& pir::isa__IPP($item, $!type_name);
}

our method type($value?) {
	if $value {
		$!type_name := ($value.isa('String')
			?? $value
			!! $value.get_namespace.string_name);
		self;
	}
	else {
		$!type_name;
	}
}