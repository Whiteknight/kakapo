# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Key;

sub _pre_initload() {
	P6metaclass.register('Key');
}

method __dump($dumper, $label) {
	print( pir::get_repr__SP(self) );
}

method new(*@parts, *%named) {
	create_key(|@parts, |%named);
}

# NB: This sub called before Key class is registered. DO NOT try to merge with the method, above.
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
			$key.push: $segment;
		}
		else {
			$key := $segment;
		}
	}
	
	$key;
}

# The startup code needs this before common runs.
method defined() { 1 }

method push($obj) {
	pir::push__vPP(self, $obj);
	self;
}