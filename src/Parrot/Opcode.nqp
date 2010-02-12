# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Opcode;
# Provides NQP-callable versions of various Parrot opcodes.
# (NOTE: A lot of the code here uses 'method' just to save a find_lex opcode. Don't take it personally.)

sub _pre_initload() {
# Kakapo startup function. Do the Global exports early, so that other modules can import these 
# functions during their init processing.

	Global::export(:tags('DEFAULT'),	'defined', 'die');
	Global::export(:tags('TYPE'),		'can', 'does', 'get_class', 'isa', 'new', 'typeof');
}

sub backtrace() {
	Q:PIR {
		backtrace
	};
}

method can($method_name) {
	my $result := Q:PIR {
		.local string method_name
		$P0 = find_lex '$method_name'
		method_name = $P0
		
		$I0 = can self, method_name
		%r = box $I0
	};
	
	return $result;
}

method clone() {
	my $clone := Q:PIR {
		%r = clone self
	};
		
	return $clone;
}

method defined() {
	my $result := Q:PIR {
		$I0 = defined self
		%r = box $I0
	};
	
	return $result;
}

method delete($key) {
	Q:PIR {
		$P0 = find_lex '$key'
		delete self[$P0]
	};
	
	return self;
}

sub die(*@parts) {
	my $message := @parts.join;
	
	Q:PIR {
		$P0 = find_lex '$message'
		$S0 = $P0
		die $S0
	};
}

method does($role) {
	my $result := Q:PIR {
		.local string role
		$P0 = find_lex '$role'
		role = $P0
		
		$I0 = does self, role
		%r = box $I0
	};

	return $result;
}

method elements() {
	my $result := Q:PIR {
		$I0 = elements self
		%r = box $I0
	};

	return $result;
}

sub exit($status?) {
	Q:PIR {
		$P0 = find_lex '$status'
		$I0 = 0
		if null $P0 goto have_status
		
		$I0 = $P0
	have_status:
		
		exit $I0
	};
}

method find_lex() {
	my $result := Q:PIR {
		$S0 = self
		%r = find_lex $S0
	};
	
	return $result;
}

method get_addr() {
	my $result := Q:PIR {
		$I0 = 0
		if null self goto done
		$I0 = get_addr self
	done:
		%r = box $I0
	};
	
	return $result;
}

method getattribute($name) {
	my $result := Q:PIR {
		$P0 = find_lex '$name'
		$S0 = $P0
		%r = getattribute self, $S0
	};
	
	return $result;
}

method get_class() {
	my $result := Q:PIR {
		%r = get_class self
	};
	
	return $result;
}

method get_integer() {
	my $result := Q:PIR {
		$I0 = self
		%r = box $I0
	};
	
	return $result;
}

method get_global() {
	my $result := Q:PIR {
		$S0 = self
		%r = get_global $S0
	};
	
	return $result;
}
		
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

sub get_hll_namespace($p1?) {
# Can be called C< () >, C< ('a::b') >, or C< (@parts) >.

	my $result;
	
	if defined($p1) {
		if isa($p1, 'String') {
			$p1 := $p1.split('::');
		}
		
		$result := Q:PIR {
			$P0 = find_lex '$p1'
			%r = get_hll_namespace $P0
		};
	}
	else {
		$result := Q:PIR {
			%r = get_hll_namespace
		};
	}
	
	return $result;
}

sub getinterp() {
	my $result := Q:PIR {
		%r = getinterp
	};
	
	return $result;
}

sub get_namespace($p1?) {
# Can be called C< () >, C< ('a::b') >, or C< (@parts) >.

	my $result;
	
	if defined($p1) {
		if isa($p1, 'String') {
			$p1 := $p1.split('::');
		}
		
		$result := Q:PIR {
			$P0 = find_lex '$p1'
			%r = get_namespace $P0
		};
	}
	else {
		$result := Parrot::caller_namespace(3);
	}
	
	return $result;
}

sub get_root_global($p1, $p2?) {
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
		%r = get_root_global [$P0], $S1
	};
	
	return $result;
}

sub get_root_namespace(@parts) {
	my $namespace := Q:PIR {
		$P0 = find_lex '@parts'
		%r = get_root_namespace $P0
	};
	
	return $namespace;
}

method inspect($key?) {
	my $result := Q:PIR {
		$P0 = find_lex '$key'
		$I0 = defined $P0
		if $I0 goto inspect_string
		
		%r = inspect self
		goto done
		
	inspect_string:
		$S0 = $P0
		%r = inspect self, $S0
	
	done:
	};
	
	return $result;
}

sub isnull(*@what) {
	my $result := Q:PIR {
		$P0 = find_lex '@what'
		$P0 = shift $P0
		$I0 = isnull $P0
		%r = box $I0
	};
	
	return $result;
}

method isa($class) {
	my $result := Q:PIR {
		$P0 = find_lex '$class'
		$S0 = $P0
		$I0 = isa self, $S0
		%r = box $I0
	};

	return $result;
}

method iseq($other) {
	my $result := Q:PIR {
		$P0 = find_lex '$other'
		$I0 = iseq self, $P0
		%r = box $I0
	};
	
	return $result;
}

method join($delim?) {
	unless defined($delim) { $delim := ''; }
	my $result := Q:PIR {
		$P0 = find_lex '$delim'
		$S0 = $P0
		$S1 = join $S0, self
		%r = box $S1
	};
	
	return $result;
}

sub load_bytecode($path) {
	Q:PIR {
		$P0 = find_lex '$path'
		$S0 = $P0
		load_bytecode $S0
	};
}

method load_language() {
	Q:PIR {
		$S0 = self
		load_language $S0
	};
	
	return self;
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

sub new($type, $init?) {
	my $result := Q:PIR {
		.local pmc type, init
		type = find_lex '$type'
		init = find_lex '$init'
		
		$I0 = defined init
		unless $I0 goto no_init
		
		%r = new type, init
		goto done
		
	no_init:
		%r = new type
		
	done:
	};
	
	return $result;
}

sub newclass($p1) {
	my $result := Q:PIR {
		$P0 = find_lex '$p1'
		%r = newclass $P0
	};
	
	return $result;
}

method setattribute($name, $value) {
	Q:PIR {
		$P0 = find_lex '$name'
		$S0 = $P0
		$P1 = find_lex '$value'
		setattribute self, $S0, $P1
	};
}

method set_integer($value) {
	Q:PIR {
		$P0 = find_lex '$value'
		$I0 = $P0
		self = $I0
	};
	
	return $value;
}

method store_lex($value) {
	Q:PIR {
		$S0 = self
		$P0 = find_lex '$value'
		store_lex $S0, $P0
	};
	
	return $value;
}

sub throw($exc) {
	Q:PIR {
		$P0 = find_lex '$exc'
		throw $P0
	};
}

our sub trace($value) {
	Q:PIR {
		$P0 = find_lex '$value'
		$I0 = $P0
		trace $I0
	};
}

our sub typeof($what) {
	my $result := Q:PIR {
		$P0 = find_lex '$what'
		unless null $P0 goto get_type
		say "typeof <null> is not a valid request"
		backtrace
	get_type:
		$S0 = typeof $P0
		%r = box $S0
	};

	return $result;
}
