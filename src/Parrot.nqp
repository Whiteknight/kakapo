# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Parrot;
=module
	Provides access to low-level functions of the Parrot VM.
=end

Global::use('Dumper');

sub IMPORT($namespace, $names?) {
	my $caller_nsp := caller_namespace(2);
	my $from_nsp := get_namespace($namespace);

	unless $from_nsp {
		say("Namespace: ", $namespace);
		Dumper::DUMP_($namespace);
		Dumper::DUMP_($from_nsp);
	}
	
	# Make sure the target namespace is finished loading
	call_onload($from_nsp);
	
	my @names;
	
	if $names {
		@names := $names.split(' ');
	}
	else {
		for $from_nsp {
			my $name := ~$_;
			my $first_char := $name[0];
			my $skip := 0;
		
			if $first_char eq '$' 
				|| $first_char eq '@' 
				|| $first_char eq '%'
				|| $first_char eq '&'
				|| $first_char eq '_' {
				$skip := 1;
			}
			elsif String::substr($name, 0, 6) eq '_block' {
				$skip := 1;
			}
			
			unless $skip {
				@names.push(~$_);
			}
		}
	}

	# NO OVERWRITING. 
	my @new_names := Array::empty();
	
	for @names {
		if $caller_nsp{~ $_} {
			#say("I will not overwrite namespace entry: " ~ $_);
		}
		else {
			@new_names.push(~ $_);
		}
	}
	
	$from_nsp.export_to($caller_nsp, @names);
}

method call_method($method_name, *@args, *%opts) {
	return call_method_(self, $method_name, @args, %opts);
}

method call_method_($method_name, @args, %opts) {
=method
	Calls method C< $method_name > with flattened arglist C< @args > and flattened 
	options C< %opts >. Returns the result of the method call.
=end

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

sub call_onload($nsp) {
	if my &onload := $nsp<_ONLOAD> {
		&onload();
	}
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

sub call_sub($sub_name, *@args, *%opts) {
	return call_sub_($sub_name, @args, %opts);
}

sub call_sub_($sub_name, @args, %opts) {
=sub
	Calls sub C< $sub_name > with flattened arglist C< @args > and flattened options C< %opts >. 
	Returns the result of the sub call.
=end

	Q:PIR {
		.local pmc sub, args, opts
		sub	= find_lex '$sub'
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

sub compile($string) {
	
	my $result := Q:PIR {
		.local pmc comp
		comp = compreg 'PIR'
		
		$P0 = find_lex '$string'
		%r = comp($P0)
	};
	
	return $result;
}

sub get_address_of($what) {
	my $address := Q:PIR {
		$P0 = find_lex '$what'
		if null $P0 goto null_object
		$I0 = get_addr $P0
		goto done
	null_object:
		$I0 = 0
	done:
		%r = box $I0
	};
	return $address;
}

sub get_compiler() {
	unless our $Parrot_compiler {
		$Parrot_compiler := Q:PIR {
			load_language 'parrot'
			%r = compreg 'parrot'
		};
	}
	
	return $Parrot_compiler;
}

# _get_interpreter cached the interp. Moved to Opcode and dumbed down. Recode your stuff.

sub get_sub($path) {
	my @parts := $path.split('::');
	my $name := @parts.pop;
	my $namespace := Opcode::get_hll_namespace(@parts);
	my $sub;
	
	if $namespace {
		$sub := $namespace.find_sub($name);
	}
	
	return $sub;
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

module Parrot::Globals {

	our %_Global_index;
	
	Q:PIR {
		.include 'iglobals.pasm' 
		
		$P0 = new 'Hash'
		
		$P1 = box .IGLOBALS_CLASSNAME_HASH
		$P0['IGLOBALS_CLASSNAME_HASH'] = $P1
		
		$P1 = box .IGLOBALS_COMPREG_HASH
		$P0['IGLOBALS_COMPREG_HASH'] = $P1
		
		$P1 = box .IGLOBALS_ARGV_LIST
		$P0['IGLOBALS_ARGV_LIST'] = $P1
		
		$P1 = box .IGLOBALS_NCI_FUNCS
		$P0['IGLOBALS_NCI_FUNCS'] = $P1
		
		$P1 = box .IGLOBALS_INTERPRETER
		$P0['IGLOBALS_INTERPRETER'] = $P1
		
		$P1 = box .IGLOBALS_DYN_LIBS
		$P0['IGLOBALS_DYN_LIBS'] = $P1
		
		$P1 = box .IGLOBALS_CONFIG_HASH
		$P0['IGLOBALS_CONFIG_HASH'] = $P1
		
		$P1 = box .IGLOBALS_LIB_PATHS
		$P0['IGLOBALS_LIB_PATHS'] = $P1
		
		$P1 = box .IGLOBALS_PBC_LIBS
		$P0['IGLOBALS_PBC_LIBS'] = $P1
		
		$P1 = box .IGLOBALS_EXECUTABLE
		$P0['IGLOBALS_EXECUTABLE'] = $P1
		
		$P1 = box .IGLOBALS_SIZE
		$P0['IGLOBALS_SIZE'] = $P1
		
		set_global '%_Global_index', $P0
	};

	sub _fetch($key) {
		return Parrot::_get_interpreter()[$key];
	}
	
	sub get_global($key) {
		return _fetch(%_Global_index{$key});
	}		
}
