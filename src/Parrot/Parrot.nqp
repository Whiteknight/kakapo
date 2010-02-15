# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Parrot;
# Provides access to low-level functions of the Parrot VM.

sub _pre_initload() {
	export(
		'call_method',	'call_method_', 
		'call_sub',		'call_sub_', 
		'call_tuple_method',	'call_tuple_method_', 
		'call_tuple_sub',	'call_tuple_sub_', 
		:tags('CALL')
	);
	
	export(
		'caller_namespace', 
		'get_hll_namespace',
		'namespace_name', 
		:tags('NAMESPACE')
	);
}


sub caller_namespace($index?) {
	unless $index {
		$index := 1;
	}
	
	my $nsp := Q:PIR {
		.local pmc key
		key = new 'Key'
		key = 'namespace'
		$P0 = find_lex '$index'
		$S0 = $P0
		$P1 = new 'Key'
		$P1 = $S0
		push key, $P1
		
		$P0 = getinterp
		%r = $P0[ key ]
	};
	
	return $nsp;
}

sub call_method($object, $method_name, *@args, *%opts) {
	call_method_($object, $method_name, @args, %opts);
}

sub call_method_($object, $method_name, @args?, %opts?) {
# Calls method C< $method_name > with flattened arglist C< @args > and flattened 
# options C< %opts >. Returns the result of the method call.

	unless Opcode::defined(@args)	{ @args := Array::empty(); }
	unless Opcode::defined(%opts)	{ %opts := Hash::empty(); }
	
	Q:PIR {
		.local pmc object, meth, args, opts
		object	= find_lex '$object'
		meth	= find_lex '$method_name'
		args	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa meth, 'Sub'
		unless $I0 goto call_string
		
		.tailcall object.meth(args :flat, opts :named :flat)
		
	call_string:
		$S0 = meth
		.tailcall object.$S0(args :flat, opts :named :flat)
	};
}

sub call_tuple_method($object, $method, *@args, *%opts) {
	call_tuple_method_($object, $method, @args, %opts);
}

sub call_tuple_method_($object, $method, @args?, %opts?) {
# Calls method C< $method_name > with flattened arglist C< @args > and flattened 
# options C< %opts >. Returns an RPA with the tuple returned by the method.

	unless Opcode::defined(@args)	{ @args := Array::empty(); }
	unless Opcode::defined(%opts)	{ %opts := Hash::empty(); }
	
	Q:PIR {
		.local pmc object, meth, args, opts
		object	= find_lex '$object'
		meth	= find_lex '$method'
		args	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa meth, 'Sub'
		unless $I0 goto call_string
		
		( $P0 :slurpy ) = object.meth(args :flat, opts :named :flat)
		.return ($P0)
		
	call_string:
		$S0 = meth
		( $P0 :slurpy ) = object.$S0(args :flat, opts :named :flat)
		.return ($P0)
	};
}

sub call_sub($sub_name, *@args, *%opts) {
	return call_sub_($sub_name, @args, %opts);
}

sub call_sub_($sub_name, @args, %opts) {
# Calls sub C< $sub_name > with flattened arglist C< @args > and flattened options C< %opts >. 
# Returns the result of the sub call.

	Q:PIR {
		.local pmc sub, args, opts
		sub	= find_lex '$sub_name'
		args 	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa sub, 'Sub'
		if $I0 goto call_sub
		
		$S0 = sub
		sub = find_sub_not_null $S0
		
	call_sub:
		.tailcall sub(args :flat, opts :named :flat)
	};
}

sub call_tuple_sub($sub, *@args, *%opts) {
	call_tuple_sub_($sub, @args, %opts);
}

sub call_tuple_sub_($sub, @args?, %opts?) {
# Calls sub C< $sub > with flattened arglist C< @args > and flattened 
# options C< %opts >. Returns an RPA with the tuple returned by the sub.

	unless Opcode::defined(@args)	{ @args := Array::empty(); }
	unless Opcode::defined(%opts)	{ %opts := Hash::empty(); }
	
	Q:PIR {
		.local pmc sub, args, opts
		sub	= find_lex '$sub'
		args	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa sub, 'Sub'
		if $I0 goto call_sub
		
		$S0 = sub
		sub = find_sub_not_null $S0
	
	call_sub:
		( $P0 :slurpy ) = sub(args :flat, opts :named :flat)
		.return ($P0)		
	};
}

sub get_address_of($what) {
	return Opcode::get_addr($what);
}

#! _get_interpreter cached the interp. Moved to Opcode and dumbed down. Recode your stuff.

# Return a namespace relative to the HLL root namespace.
#
# If no C< $path > is specified, returns the HLL root namespace. Otherwise, fetches
# the namespace identified by C< $path >, which can either be a string in A::B::C 
# format, or a key. (See L< key() >, below.)

sub get_hll_namespace($path?) {

	my $result;
	
	if $path.defined {
		if $path.isa('String') {
			$path := key_($path.split('::'));
		}
		
		$result := pir::get_hll_namespace__PP($path);
	}
	else {
		$result := pir::get_hll_namespace__P();
	}

	$result;
}

sub get_sub($path, :$caller_nsp?) {
	my @parts := $path.split('::');
	my $name := @parts.pop;
	my &sub;
	
	if +@parts == 0 {	# Check in caller nsp
		unless $caller_nsp { $caller_nsp := caller_namespace(2); }
		
		&sub := $caller_nsp.find_sub($name);
		
		if Opcode::defined(&sub) {
			return &sub;
		}
	}

	my $namespace := Opcode::get_hll_namespace(@parts);
	
	if $namespace {
		&sub := $namespace.find_sub($name);
	}
	
	return &sub;
}

sub key($first, *@parts) {
	unless @parts { @parts := Array::empty(); }
	@parts.unshift($first);
	key_(@parts);
}

sub key_(@parts) {
	
	my $key;
	
	while @parts {
		my $element := @parts.shift;
		Q:PIR {
			.local pmc segment
			segment = new [ 'Key' ]
			
			.local pmc element
			element = find_lex '$element'
			
			$I0 = isa element, 'Integer'
			unless $I0 goto not_Integer
			$I0 = element
			segment = $I0
			goto have_key
			
		not_Integer:
			
			$I0 = isa element, 'Float'
			unless $I0 goto not_Float
			$N0 = element
			segment = $N0
			goto have_key
			
		not_Float:
			
			$I0 = isa element, 'String'
			unless $I0 goto not_String
			$S0 = element
			segment = $S0
			goto have_key
			
		not_String:
			die "Invalid PMC type passed to Parrot::key"
			
		have_key:
			.local pmc key
			key = find_lex '$key'
			
			$I0 = isa key, 'Key'
			unless $I0 goto set_key
			push key, segment
			goto done
		
		set_key:
			key = segment
			store_lex '$key', key
			
		done:
		};
	}
	
	return $key;
}

sub namespace_name($nsp) {
	if Opcode::isa($nsp, 'String') {
		return $nsp;
	}
	
	my @parts := $nsp.get_name;
	@parts.shift;
	return @parts.join('::');
}
