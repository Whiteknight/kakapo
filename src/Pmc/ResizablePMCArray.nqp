# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

=module Parrot

Provides missing methods to RPA.

=cut

module ResizablePMCArray;

Program::initload(:after('Array', 'Dumper', 'Global'));

sub _initload() {
	Global::use('Dumper');
	Global::import('Array');
}

# method append(@other) - built in

method clone()				{ Parrot::clone(self); }
method contains($what)			{ Array::contains(self, $what); }
method delete($key)				{ Parrot::delete(self, $key); }
method elements(*@value)			{ Array::elements_(self, @value); }
method isa($type)				{ Parrot::isa(self, $type); }
		
method join(*@delim) {
	return Parrot::join(self, +@delim ?? @delim.shift !! '');
}
	
sub new(*@contents) {
	return +@contents
		?? @contents
		!! Parrot::new_pmc('ResizablePMCArray');
}

method splice(@data, :$from?, :$replacing?) { Array::splice(self, @data, :from($from), :replacing($replacing)); }
