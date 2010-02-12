# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Parrot;
# Provides access to low-level functions of the Parrot VM.

sub _pre_initload() {
	Global::use('Dumper');

	Global::export(
		'call_method',	'call_method_', 
		'call_sub',		'call_sub_', 
		:tags('CALL')
	);
	
	Global::export(
		'caller_namespace', 
		'namespace_name', 
		:tags('NAMESPACE')
	);
}


sub IMPORT($namespace, $names?) {
	Opcode::die("IMPORT is dead. Use Global::use instead.");
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

method call_method($method_name, *@args, *%opts) {
	return call_method_(self, $method_name, @args, %opts);
}

method call_method_($method_name, @args?, %opts?) {
# Calls method C< $method_name > with flattened arglist C< @args > and flattened 
# options C< %opts >. Returns the result of the method call.

	unless Opcode::defined(@args)	{ @args := Array::empty(); }
	unless Opcode::defined(%opts)	{ %opts := Hash::empty(); }
	
	Q:PIR {
		.local pmc meth, args, opts
		meth	= find_lex '$method_name'
		args	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa meth, 'Sub'
		unless $I0 goto call_string
		
		.tailcall self.meth(args :flat, opts :named :flat)
		
	call_string:
		$S0 = meth
		.tailcall self.$S0(args :flat, opts :named :flat)
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
		unless $I0 goto call_string
		
		.tailcall sub(args :flat, opts :named :flat)
		
	call_string:
		$S0 = sub
		$P0 = find_sub_not_null $S0
		.tailcall $P0(args :flat, opts :named :flat)
	};
}

sub get_address_of($what) {
	return Opcode::get_addr($what);
}

# _get_interpreter cached the interp. Moved to Opcode and dumbed down. Recode your stuff.

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
