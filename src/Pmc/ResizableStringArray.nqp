# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module ResizableStringArray;
=module
	Provides missing methods to RSA.
=end

Global::use('Dumper');

method append(@other) {
	for @other {
		self.push(~ $_);
	}
}

method clone()				{ Opcode::clone(self); }
method contains($what)			{ Array::contains(self, $what); }
method delete($key)				{ Opcode::delete(self, $key); }
method elements(*@value)			{ Array::elements_(self, @value); }
method isa($type)				{ Opcode::isa(self, $type); }
		
method join(*@delim) {
	@delim.push('');
	my $delim := @delim.shift;
	return Opcode::join(self, $delim);
}

sub new(*@contents) {
	my @array := Opcode::new('ResizableStringArray');
	
	for @contents {
		@array.push( ~ $_);
	}
	
	return @array;
}

method slice(:$from?, :$to?)		{ Array::slice(self, :from($from), :to($to)); }

# Note: Can't pass an RPA to RSA.splice, so this will die a lot.
method splice(@data, :$from?, :$replacing?) { Array::splice(self, @data, :from($from), :replacing($replacing)); }
