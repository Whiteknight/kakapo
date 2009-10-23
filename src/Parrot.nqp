# $Id: $

module Parrot;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;

	Q:PIR {
		.include 'iglobals.pasm'
		.include 'interpinfo.pasm'
		.include 'sysinfo.pasm'
	};
}

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

sub can($object, $method_name) {
	my $result := Q:PIR {
		$P0 = find_lex '$object'
		$P1 = find_lex '$method_name'
		$S1 = $P1
		$I0 = can $P0, $S1
		%r = box $I0
	};
	
	return $result;
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

sub defined(*@what) {
	my $result := Q:PIR {
		$P0 = find_lex '@what'
		$I0 = defined $P0[0]
		%r = box $I0
	};
	
	return $result;
}

sub die($message) {
	Q:PIR {
		$P0 = find_lex '$message'
		$S0 = $P0
		die $S0
	};
}

sub does($object, $role) {
	my $result := Q:PIR {
		$P0 = find_lex '$object'
		$P1 = find_lex '$role'
		$S1 = $P1
		$I0 = does $P0, $S1
		%r = box $I0
	};

	return $result;
}

sub elements($item) {
	my $result := Q:PIR {
		$P0 = find_lex '$item'
		$I0 = elements $P0
		%r = box $I0
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

sub get_attribute($pmc, $attribute_name) {
	my $result := Q:PIR {
		$P0 = find_lex '$pmc'
		$P1 = find_lex '$attribute_name'
		$S0 = $P1
		%r = getattribute $P0, $S0
	};
	
	return $result;
}

sub get_class($pmc) {
	my $result := Q:PIR {
		$P0 = find_lex '$pmc'
		%r = get_class $P0
	};
	return $result;
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

sub get_interpreter() {
	unless our $Parrot_interpreter {
		$Parrot_interpreter := Q:PIR {
			%r = getinterp
		};
	}
	
	return $Parrot_interpreter;
}

sub get_namespace($name) {
	my @namespace := $name.split('::');
	my $namespace := get_hll_namespace(@namespace);
	return $namespace;
}

sub get_hll_global($path) {
	my @parts := $path.split('::');
	my $name := @parts.pop;
	
	my $result := Q:PIR {
		$P0 = find_lex '@parts'
		$P1 = find_lex '$name'
		$S1 = $P1
		%r = get_hll_global [$P0], $S1
	};
	
	return $result;
}
	
sub get_hll_namespace(@parts) {
	my $namespace := Q:PIR {
		$P0 = find_lex '@parts'
		%r = get_hll_namespace $P0
	};
	
	return $namespace;
}

sub get_sub($path) {
	my @parts := $path.split('::');
	my $name := @parts.pop;
	my $namespace := get_hll_namespace(@parts);
	my $sub;
	
	if $namespace {
		$sub := $namespace.find_sub($name);
	}
	
	return $sub;
}

sub inspect($pmc, $key) {
	my $result := Q:PIR {
		$P0 = find_lex '$pmc'
		$P1 = find_lex '$key'
		$S1 = $P1
		%r = inspect $P0, $S1
	};
	return $result;
}

sub is_null(*@what) {
	my $result := 0;
	
	if +@what {
		$result := Q:PIR {
			$P0 = find_lex '@what'
			$P1 = shift $P0
			$I0 = isnull $P1
			%r = box $I0
		};
	}
	
	return $result;
}
		
sub isa($pmc, $class) {
	my $result := Q:PIR {
		$P0 = find_lex '$pmc'
		$P1 = find_lex '$class'
		$S1 = $P1
		$I0 = isa $P0, $S1
		%r = box $I0
	};

	return $result;
}

sub load_bytecode($file) {
	Q:PIR {
		$P0 = find_lex '$file'
		$S0 = $P0
		load_bytecode $S0
	};
}

sub new_pmc($type) {
	my $result := Q:PIR {
		$P0 = find_lex '$type'
		%r = new $P0
	};
	
	return $result;
}

sub trace($value) {
	Q:PIR {
		$P0 = find_lex '$value'
		$I0 = $P0
		trace $I0
	};
}

sub typeof($pmc) {
	my $result := Q:PIR {
		$P0 = find_lex '$pmc'
		$S0 = typeof $P0
		%r = box $S0
	};
	return $result;
}

module Parrot::Globals {

	our %_Global_index;
	
	_ONLOAD();

	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;

		Q:PIR {
			.include 'iglobals.pasm' 
			
			$P0 = new 'Hash'
			
			$P1 = box .IGLOBALS_CLASSNAME_HASH
			say $P1
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
	}

	sub _fetch($key) {
		return Parrot::_get_interpreter()[$key];
	}
	
	sub get_global($key) {
		return _fetch(%_Global_index{$key});
	}		
}
