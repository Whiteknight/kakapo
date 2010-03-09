# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Cuckoo;

INIT {
	export( < calling cuckoo verify verify_never > );

	Kakapo::depends_on( <Cuculus::Canorus> );
}

sub _initload() {
	use( <Cuculus::Canorus> );
}

sub calling($egg) {
	get_cuckoo($egg).new_egg(:behavior(Cuculus::Canorus::add_antiphon));
}

sub cuckoo($class, *%named) {
	Cuculus::Canorus.new.mock_class($class, |%named);
}

sub verify($egg, *%named) {
	%named<at_least> := 1
		unless %named.contains: <at_least>;
	
	get_cuckoo($egg).verifier: 
		Cuculus::Verifier.new: :conditions(%named);

	# Create new verify-configured egg
	get_cuckoo($egg).new_egg(
		:behavior(Cuculus::Canorus::verify_calls)
	);
}

sub verify_never($egg, *%named) {
	verify($egg, :never, |%named);
}