# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Provides NQP-callable versions of various Parrot opcodes.
module Opcode;

# Kakapo startup function. Do the global exports early, so that other modules 
# can import these functions during their init processing.
sub _pre_initload() {

	export(:tags('DEFAULT'),	'defined');
	export(:tags('TYPE'),	'can', 'does', 'get_class', 'isa', 'new', 'typeof');
}

sub backtrace()			{ pir::backtrace(); }
sub can($object, $method)		{ pir::can__IPS($object, $method); }
sub class($object)			{ pir::class__PP($object); }
sub clone($object)			{ pir::clone($object); }
sub defined($object)			{ pir::defined__IP($object); }

# FIXME: Presently there is no pir:: syntax for delete_p_k, so have to do this.
sub delete($object, $key) {
	Q:PIR {
		$P0 = find_lex '$object'
		$P1 = find_lex '$key'
		delete $P0[$P1]
	};
}

sub does($object, $role)		{ pir::does($object, $role); }
sub elements($object)		{ pir::elements($object); }
sub exit($status)			{ pir::exit($status); }
sub find_method($object, $name)	{ pir::find_method__PPS($object, $name); }
sub get_addr($object)		{ pir::get_addr__IP($object); }
sub getattribute($object, $name)	{ pir::getattribute__PPS($object, $name); }
sub get_class($object)		{ pir::get_class__PP($object); }
sub get_integer($object)		{ pir::set__IP($object); }
sub get_global($name)		{ pir::get_global__PS($name); }
sub getinterp()			{ pir::getinterp__P(); }
sub get_namespace($namespace)	{ pir::get_namespace__PP($namespace); }
sub get_root_namespace(@parts)	{ pir::get_root_namespace__PP(@parts); }
sub inspect($object)			{ pir::inspect__PP($object); }
sub inspect_string($object, $key)	{ pir::inspect__PPS($object, $key); }
sub isnull($object)			{ pir::isnull($object); }
sub isa($object, $class)		{ pir::isa__IPS($object, $class); }
sub iseq($object, $other)		{ pir::iseq__IPP($object, $other); }
sub join($object, $delim)		{ pir::join($delim, $object); }
sub load_bytecode($path)		{ pir::load_bytecode__vS($path); }
sub load_language($name)		{ pir::load_language__vS($name); }
sub new($type)			{ pir::new__PP($type); } # FIXME: __PP or __PS
sub newclass($name)		{ pir::newclass__PP($name); }
sub setattribute($object, $name, $value) { pir::setattribute__vPSP($object, $name, $value); }
# FIXME: Not sure if this should be 'assign' or 'set'
sub set_integer($object, $value)	{ pir::assign__vPI($object, $value); }
sub throw($exception)		{ pir::throw($exception); }
sub typeof($object)			{ pir::typeof__SP($object); }

### FIXME: Move this to Parrot:: or something.

sub get_hll_global($p1, $p2?) {
# May be called with C< ('a::b') >, C< (@names) >, C< ('a::b', 'c') >, or C< (@nsp_names, 'c') >.

	my @parts := isa($p1, 'String') ?? $p1.split('::') !! $p1;

	if $p2 {
		@parts.push($p2);
	}
	
	my $name := @parts.pop;

	my $result := Q:PIR {
		$P0 = find_lex '@parts'
		$P1 = find_lex '$name'
		$S1 = $P1
		%r = get_hll_global [$P0], $S1
	};
	
	return $result;
}

sub get_root_global($p1, $p2?) {
# May be called with C< ('a::b') >, C< (@names) >, C< ('a::b', 'c') >, or C< (@nsp_names, 'c') >.
	
	my @parts := pir::isa($p1, 'String') ?? $p1.split('::') !! $p1;
	
	if $p2 {
		@parts.push($p2);
	}

	my $name := @parts.pop;
	
	my $result := Q:PIR {
		$P0 = find_lex '@parts'
		$P1 = find_lex '$name'
		$S1 = $P1
		%r = get_root_global [$P0], $S1
	};
	
	return $result;
}

sub make_root_namespace($p1) {
	my $result;
	
	if defined($p1) {
		my @parts := isa($p1, 'String') ?? $p1.split('::') !! $p1;
		
		my $nsp := get_root_namespace();
		$result := $nsp.make_namespace(@parts);
	}
	else {
		die("Undefined namespace path");
	}
	
	return $result;
}
