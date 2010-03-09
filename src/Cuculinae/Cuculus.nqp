# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Cuculus::Canorus;

has @!antiphons;
has @!call_log;
has $!class;
has %!passthrough_antiphons;
has $!verifier;

INIT {
	export( <
		add_antiphon
		get_behavior
		get_cuckoo
		verify_calls
	> );

	Kakapo::depends_on( 'Cuculus::SigMatcher' );
}

sub _initload() {
	use( 'Cuculus::SigMatcher' );
}

method add_antiphon($callsig) {

	my $antiphon := new_antiphon($callsig);
	@!antiphons.push($antiphon);
	
	# Return the antiphon so we can chain .will(...) calls.
	$antiphon;
}

method antiphons()	{ @!antiphons; }
method call_log()	{ @!call_log; }

method class(*@value) {
	if @value {
		die( 'Cannot reset $!class attribute: already points to ' ~ "'$!class'" )
			if pir::defined(pir::getattribute__PPS(self, '$!class'));
		$!class := P6metaclass.get_parrotclass(@value.shift);
	}

	$!class;
}

sub get_behavior($egg) {
	unless isa($egg, 'Cuculus::Canorus::Ovum') {
		_dumper($egg);
		die( "Must be called with a Cuckoo's egg." );
	}

	pir::getattribute__PPS($egg, '&!CUCULUS_BEHAVIOR');
}

sub get_cuckoo($egg) {
	unless isa($egg, 'Cuculus::Canorus::Ovum') {
		_dumper($egg);
		die( "Must be called with a Cuckoo's egg." );
	}

	pir::getattribute__PPS($egg, '$!CUCULUS_CANORUS');
}

sub get_passthrough_antiphons($parent) {

	# See TT#1497 for why this bogosity is needed.
	my $pre_class := pir::new__PS( 'Class' );
	$pre_class.add_parent( pir::get_class__PS( 'P6protoobject' ) );
	$pre_class.add_parent( P6metaclass.get_parrotclass: $parent );

	my %passthrough;

	for get_rootclass_methods() -> $method_name {
		# Make a callsig for the method
		my $callsig := CallSignature.new(:method($method_name));
		my $antiphon := new_antiphon($callsig);

		# TODO: If subject class overrides PROTOOVERRIDES, we'll miss it.
		if $method_name eq 'new' {
			$antiphon.will_do: Cuculus::Canorus::mock_new;
		}
		elsif $method_name eq '__dump' {
			$antiphon.will_do: P6object::__dump;
		}
		else {
			my &method := $pre_class.find_method($method_name);
			$antiphon.will_do: &method;
		}

		%passthrough{$method_name} := $antiphon;
	}

	%passthrough;
}

sub get_rootclass_methods() {
	# TODO: Maybe P6object inherits from something, someday. Should this scan the MRO?
	unless our @_Rootclass_methods {
		my $root_class := P6metaclass.get_parrotclass('P6object');
		@_Rootclass_methods := $root_class.inspect('methods').keys;
		@_Rootclass_methods.sort;
	}

	@_Rootclass_methods;
}

method init_egg( $egg, :&behavior = Cuculus::Canorus::mock_execute ) {
	die( "Must be called with a Cuckoo's egg." )
		unless isa($egg, 'Cuculus::Canorus::Ovum');
	Opcode::setattribute($egg, '$!CUCULUS_CANORUS', self);
	Opcode::setattribute($egg, '&!CUCULUS_BEHAVIOR', &behavior);

	$egg;
}

method _init_obj(*@pos, *%named) {
	@!antiphons := @!antiphons;	# Null -> empty
	@!call_log := @!call_log;		# Null -> empty

	self._init_args(|@pos, |%named);

	self;
}

method mock_class($parent = 'P6object', :$named = mock_class_name($parent)) {

	%!passthrough_antiphons := get_passthrough_antiphons($parent);

	my $proto_cuckoo := P6metaclass.new_class: $named, :parent( 'Cuculus::Canorus::Ovum' );
	P6metaclass.add_parent: $proto_cuckoo, $parent;

	$!class := P6metaclass.get_parrotclass($proto_cuckoo);
	self.init_egg($proto_cuckoo);

	# Turn on find-method redirection for the proto-object
	my $proto_class := pir::class__PP($proto_cuckoo);
	has_vtable('find_method', Cuculus::Canorus::Ovum::_::VTABLE_find_method,
		$proto_class);

	# Finally, turn on find-method redirection for the mock class.
	has_vtable('find_method', Cuculus::Canorus::Ovum::_::VTABLE_find_method,
		:class($proto_cuckoo));

	$proto_cuckoo;
}

sub mock_class_name($parent) {
	our $_Next_id := 0
		unless $_Next_id;

	if ~ $parent eq 'P6object' {
		$parent := '<anonymous>';
	}

	my $name := pir::typeof__SP($parent) ~ "::<mock{$_Next_id++;}>";
}

method mock_execute($callsig) {
	@!call_log.push($callsig);	# record the call

	for @!antiphons -> $one {
	#pir::trace(1);
		if $one.matches($callsig) {
	pir::trace(0);
			return $one.invoke($callsig);
		}
	pir::trace(0);
	}

	if %!passthrough_antiphons.contains($callsig.method) {
		return %!passthrough_antiphons{$callsig.method}.invoke($callsig);
	}

	$callsig.object;		# returns "self"
}

method mock_new(*@pos, *%named) {
	# Make a new cuckoo, mocking the same class.
	my $cuckoo := $!CUCULUS_CANORUS;
	my $new_cuckoo := $cuckoo.WHAT.new(:class($cuckoo.class), :passthrough($cuckoo.passthrough));

	# Pretend to be the standard P6object new method: Create a new egg linked to
	# the new cuckoo, and invoke the (mocked) _init_obj.
	my $new_egg := $new_cuckoo.new_egg;
	$new_egg._init_obj(|@pos, |%named);
	
	# NB: Init_obj probably returns $new_cuckoo, which isn't what we want the user to get.
	$new_egg;
}

sub new_antiphon($callsig) {
	my $antiphon := Cuculus::Antiphon.new(
		:sig_matcher(
			Cuculus::SigMatcher.new(
				:expecting($callsig))));
}

# NB: This isn't a 'new' operation - see `mock_new` for that - it's just creating a new
# tracking object, of which there might be many. (Remember that each instance of this class
# represents an object, but each egg represents a mode to use calling the object: config, execute,
# or verify, and the eggs are throw-away, so there may be lots of them pointing to the same object:
# calling($foo).a(1).will_do X, calling($foo).a(2).will_do Y, etc.

method new_egg( :&behavior = Cuculus::Canorus::mock_execute ) {
	my $new_egg := pir::new__PP($!class);
	self.init_egg($new_egg, &behavior);
}

method passthrough($value?) {
	%!passthrough_antiphons := ($value.defined
		?? $value
		!! %!passthrough_antiphons);
}

method verifier($value?)	{ $value.defined ?? ($!verifier := $value) !! $!verifier; }

method verify_calls($callsig) {

	$!verifier.sig_matcher:
		Cuculus::SigMatcher.new: 
			:expecting($callsig);

	$!verifier.verify(self);
}
