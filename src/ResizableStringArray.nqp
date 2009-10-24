module ResizableStringArray;

method append(@other) {
	for @other {
		self.push(~ $_);
	}
}

method clone()				{ Parrot::clone(self); }
method contains($what)			{ Array::contains(self, $what); }
method delete($key)				{ Parrot::delete(self, $key); }
method elements(*@value)			{ Array::elements_(self, @value); }
		
method join(*@delim) {
	@delim.push('');
	my $delim := @delim.shift;
	return Parrot::join(self, $delim);
}

sub new(*@contents) {
	my @array := Parrot::new_pmc('ResizableStringArray');
	
	for @contents {
		@array.push( ~ $_);
	}
	
	return @array;
}

# Note: Can't pass an RPA to RSA.splice, so this will die a lot.
method splice(@data, :$from?, :$replacing?) { Array::splice(self, @data, :from($from), :replacing($replacing)); }
