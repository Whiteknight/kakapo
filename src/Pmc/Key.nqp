# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Pmc::Key;

sub _pre_initload() {
	P6metaclass.register('Key');

	# Get target namespace
	my $to_nsp := pir::get_hll_namespace__pp( pir::split__pss('::', 'Key') );
	my $to_pmc := $to_nsp.get_class;
	
	# Get source (this) namespace
	my $from_nsp := pir::get_namespace__p();	

	# Inject 'new' and '__dump' into P6object chain (protoclass and class)
	for <__dump new> -> $method {
		my &sub := $from_nsp.get_method: $method;
		$to_nsp.install_method: ~$method, &sub;
	}
	
	$from_nsp.export_methods_to: <Key>;

	#my @export_subs := [ <merge_keys> ];
	#$from_nsp.export_to: $to_nsp, [<merge_keys> ];
}

method __dump($dumper, $label) {
	print( pir::get_repr__SP(self) );
}

# NB: This sub called before Key class is registered. DO NOT try to merge with the method, above.
# Also, do not try to call $key.methods yet, since the methods will not be exported yet.

sub create_key(*@parts, *%opts) {
	my $key;
	my $segment;

	for @parts {
		$segment := pir::new__PS('Key');
		
		if pir::isa($_, 'Integer' )	{ pir::assign__vPI($segment, $_); }
		elsif pir::isa($_, 'Float' )	{ pir::assign__vPN($segment, $_); }
		elsif pir::isa($_, 'String' )	{ pir::assign__vPS($segment, $_); }
		else {
			if pir::isa(Exception::InvalidArgument, 'P6protoobject') {
				Exception::InvalidArgument.new(
					:message('Arguments to Key.new must be Integer, String, or Float'),
				).throw;
			}
			else {
				pir::die('Arguments to Key.new must be Integer, String, or Float');
			}
		}
		
		if pir::defined($key) {
			# $key.push: $segment;
			pir::push__vpp($key, $segment);
		}
		else {
			$key := $segment;
		}
	}
	
	$key;
}

method new(*@parts, *%named) {
	create_key(|@parts, |%named);
}

method push($obj) {
	pir::push__vPP(self, $obj);
	self;
}
