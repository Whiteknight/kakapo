# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Mimus::Cuculus;

has @!antiphons;
has @!call_log;

INIT {
	export( <verify calling> );
}

method add_antiphon($callsig) {
	my $antiphon := Mimus::Antiphon.new(:sig_matcher(Mimus::CallSignature::SigMatcher.new($callsig)));
	@!antiphons.push($antiphon);
	$antiphon;
}

sub calling($egg) {
	clone_egg($egg, Mimus::Cuculus::add_antiphon);
}

sub clone_egg($egg, &behavior) {
	die( "Must be called with a Cuckoo's egg." )
		unless pir::isa($egg, pir::split__PSS('::', 'Mimus::Cuculus::Ovum'));

	my $cuckoo := Opcode::getattribute($egg, '$!MIMUS_CUCULUS');
	my $new_egg := $cuckoo.new_egg( :behavior(&behavior) );
}

method init_egg( $egg, :&behavior = Mimus::Cuculus::mock_execute ) {
	die( "Must be called with a Cuckoo's egg." )
		unless pir::isa($egg, pir::split__PSS('::', 'Mimus::Cuculus::Ovum'));
	
	Opcode::setattribute($egg, '$!MIMUS_CUCULUS', self);
	Opcode::setattribute($egg, '&!MIMUS_BEHAVIOR', &behavior);
	
	$egg;
}

method mock_class($parent = 'P6object', :$named = mock_class_name($parent)) {
	my $mock_class := P6metaclass.new_class: $named, :parent( 'Mimus::Cuculus::Ovum' );
	P6metaclass.add_parent: $mock_class, $parent;

	# C< $mock_class > is the proto-object for the new class. Configure its default methods:
	# C< new, PROTOOVERRIDES, HOW >.
	
	self.init_egg($mock_class);

	$mock_class;
}







method mock_execute($callsig) {
	@!call_log.push($callsig);	# record the call
	
	for @!antiphons -> $one {
		if $one.matches($callsig) {
			return $one.invoke();
		}
	}

	$callsig.object;		# returns "self"
}

method new_egg( :&behavior = Mimus::Cuculus::mock_execute ) {
	my $new_egg := Parrot::new('Mimus::Cuculus::Ovum');
	init_egg($new_egg, self, &behavior);
}

method verify_calls($callsig) {
	fail( "Don't know what to do here." );
}

sub verify($egg) {
	clone_egg($egg, Mimus::Cuculus::verify_calls);
}
