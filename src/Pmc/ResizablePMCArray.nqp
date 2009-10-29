# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module ResizablePMCArray;
=module
	Provides missing methods to RPA.
=end

Global::use('Dumper');

# method append(@other) - built in
method clone()				{ Opcode::clone(self); }
method contains($what)			{ Array::contains(self, $what); }
method delete($key)				{ Opcode::delete(self, $key); }
method elements(*@value)			{ Array::elements_(self, @value); }
method isa($type)				{ Opcode::isa(self, $type); }
		
method join(*@delim) {
	return Opcode::join(self, +@delim ?? @delim.shift !! '');
}
	
sub new(*@contents) {
	return +@contents
		?? @contents
		!! Opcode::new('ResizablePMCArray');
}

method slice(:$from?, :$to?)		{ Array::slice(self, :from($from), :to($to)); }
method splice(@data, :$from?, :$replacing?) { Array::splice(self, @data, :from($from), :replacing($replacing)); }
