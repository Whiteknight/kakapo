# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Pmc::Undef;
# Provides missing methods to Undef PMC. See also C< Kakapo::Pmc::COMMON >.

sub _pre_initload() {
	unless pir::isa( Parrot::get_hll_global( <Undef> ), 'P6protoobject' ) {
		P6metaclass.register: <Undef>;
	}
		
	my $to_nsp := pir::get_hll_namespace__pp( pir::split__pss('::', <Undef>) );
	my $to_pmc := $to_nsp.get_class;

	my $nsp := pir::get_namespace__p();
	for <defined new> -> $name {
		my &method := $nsp.get_method: ~$name;
		$to_nsp.install_method: ~$name, &method;
	}
}

our method defined()		{ 0 }
our method new()			{ my $undef; }