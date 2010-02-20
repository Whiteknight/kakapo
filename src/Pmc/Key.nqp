# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Key;

method __dump($dumper, $label) {
	print( pir::get_repr__SP(self) );
}

method new(*@parts) {
	self.new_(@parts);
}

method new_(@parts, %opts?) {
	my $key;
	my $segment;

	for @parts {
		$segment := pir::new__PS('Key');
		
		if pir::isa($_, 'Integer' ) {	pir::assign__vPI($segment, $_); }
		elsif $_.isa( 'Float' ) {	pir::assign__vPN($segment, $_); }
		elsif $_.isa( 'String' ) {	pir::assign__vPS($segment, $_); }
		else {
			Exception::InvalidArgument.new(
				:message('Arguments to Key.new must be Integer, String, or Float'),
			).throw;
		}
		
		if $key.defined {
			$key.push: $segment;
		}
		else {
			$key := $segment;
		}
	}
	
	$key;
}

method push($obj) {
	pir::push__vPP(self, $obj);
	self;
}