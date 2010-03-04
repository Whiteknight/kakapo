# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# The cuckoo's egg takes the place of a real object in the system.
class Mimus::Cuculus::Ovum;

has &!MIMUS_BEHAVIOR;
has $!MIMUS_CUCULUS;

INIT {
	# TODO: Can I move this out to the 'make' operation, and install it 
	# directly on the mocked class?
	#has_vtable('find_method', Mimus::Cuculus::Ovum::_::VTABLE_find_method);
}

method new(*@pos, *%named) {
	my $class := P6metaclass.get_parrotclass(self);
	my $obj := pir::new__PP($class);

	self._init_obj(|@pos, |%named);
	
	# TODO: Should be possible to mock .new (by attaching side-effect/returns)
	$obj;
}

module Mimus::Cuculus::Ovum::_;

# This method is called by Cuculus::Ovum objects as a vtable override for 'find_method'.
# (It is withheld from that namespace solely to keep the namespace clean.) Thus, 
# this is NOT REALLY A METHOD on this class - it is a method on the Cuculus::Egg 
# class, and C< self > reflects that, as do the attributes.
# 
method VTABLE_find_method($name) {
	has &!MIMUS_BEHAVIOR;
	has $!MIMUS_CUCULUS;
	
	unless $!MIMUS_CUCULUS.defined {
		die( "No Cuculus attribute set!" );
	}

	my $callsig := Mimus::CallSignature.new(:object(self), :method($name));
	
	my &closure := -> *@pos, *%named {
		$callsig.positional(@pos);
		$callsig.named(%named);
		# Invoke a method on the Cuckoo
		&!MIMUS_BEHAVIOR($!MIMUS_CUCULUS, $callsig);
	};
}
