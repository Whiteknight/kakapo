# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# The cuckoo's egg takes the place of a real object in the system.
class Cuculus::Canorus::Ovum;

has &!CUCULUS_BEHAVIOR;
has $!CUCULUS_CANORUS;

INIT {
	# TODO: Can I move this out to the 'make' operation, and install it 
	# directly on the mocked class?
	#has_vtable('find_method', Cuculus::Canorus::Ovum::_::VTABLE_find_method);
}

module Cuculus::Canorus::Ovum::_;

# This method is called by Cuculus::Ovum objects as a vtable override for 'find_method'.
# (It is withheld from that namespace solely to keep the namespace clean.) Thus, 
# this is NOT REALLY A METHOD on this class - it is a method on the Cuculus::Egg 
# class, and C< self > reflects that, as do the attributes.
# 
method VTABLE_find_method($name) {
	has &!CUCULUS_BEHAVIOR;
	has $!CUCULUS_CANORUS;

say("   Find_method: $name");	
	die( "No Cuculus attribute set!" )
		unless $!CUCULUS_CANORUS.defined;

	my &closure := -> *@pos, *%named {
		my $self := @pos[0];
		my $cuckoo := pir::getattribute__PPS($self, '$!CUCULUS_CANORUS');
		
		# NB: :object($cuckoo) here, not $self - many eggs represent the same cuckoo.
		my $callsig := CallSignature.new(
			:method($name),
			:named(%named),
			#:object($cuckoo), 
			:object($self), 
			:positional(@pos), 
		);
		
		my &behavior := pir::getattribute__PPS($self, '&!CUCULUS_BEHAVIOR');
		&behavior($cuckoo, $callsig);
	};
}
