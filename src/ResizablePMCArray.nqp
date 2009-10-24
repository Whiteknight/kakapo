module ResizablePMCArray;
# method append(@other) - built in

method clone()				{ Parrot::clone(self); }
method contains($what)			{ Array::contains(self, $what); }
method delete($key)				{ Parrot::delete(self, $key); }
method elements(*@value)			{ Array::elements_(self, @value); }
		
method join(*@delim) {
	return Parrot::join(self, +@delim ?? @delim.shift !! '');
}
	
sub new(*@contents) {
	return +@contents
		?? @contents
		!! Parrot::new_pmc('ResizablePMCArray');
}

method splice(@data, :$from?, :$replacing?) { Array::splice(self, @data, :from($from), :replacing($replacing)); }
