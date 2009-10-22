# $Id: $

module Parrot;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;

	# Nothing.
}

sub _get_parrot() {
	unless our $parrot_compiler {
		$parrot_compiler := Q:PIR {
			load_language 'parrot'
			%r = compreg 'parrot'
		};
	}
	
	return $parrot_compiler;
}

sub IMPORT($namespace, $names?) {
	my $caller_nsp := caller_namespace(2);
	my $from_nsp := get_namespace($namespace);
	
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
			#NOTE("I will not overwrite namespace entry: " ~ $_);
			say("I will not overwrite namespace entry: " ~ $_);
		}
		else {
			@new_names.push(~ $_);
		}
	}
	
	# say("Exporting ", +@new_names, " functions from ", $from_nsp, " to ", $caller_nsp);
	# if $from_nsp{'DIE'} {
		# say("Die info: ", $from_nsp{'DIE'}.get_namespace.get_name.join('::'));
	# }
	# say(@new_names.join(", "));
	# Dumper::BACKTRACE();
	$from_nsp.export_to($caller_nsp, @names);
	# say("done");
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

sub compile($string) {
	my $result := Q:PIR {
		.local pmc comp
		comp = compreg 'PIR'
		
		$P0 = find_lex '$string'
		%r = comp($P0)
	};
	
	return $result;
}

our $do_note;
IMPORT('Dumper');
$do_note := 0;
sub do_note() {
	$do_note := 1;
}

sub defined(*@what) {
	if $do_note && Registry<CONFIG> {
	say("do note is true");
		NOTE("Checking if something is defined");
		DUMP(@what);
	}
	
	my $result := Q:PIR {{
		$P0 = find_lex '@what'
		$I0 = defined $P0[0]
		%r = box $I0
	}};
	
	#NOTE("Returning ", $result);
	return $result;
}

sub die($message) {
	Q:PIR {
		$P0 = find_lex '$message'
		$S0 = $P0
		die $S0
	};
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

sub get_namespace($name) {
	my @namespace := $name.split('::');
	my $namespace := get_hll_namespace(@namespace);
	return $namespace;
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
		%r = typeof $P0
	};
	return $result;
}
