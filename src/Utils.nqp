# $Id: $

module Parrot;

sub _get_parrot() {
	unless our $parrot_compiler {
		$parrot_compiler := Q:PIR {
			load_language 'parrot'
			%r = compreg 'parrot'
		};
	}
	
	return $parrot_compiler;
}


sub IMPORT($namespace, $names) {
	_get_parrot.import('parrot', $namespace, :targetns(caller_namespace));
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
		$P1 = new 'Key'
		$P1 = $P0
		key.push($P1)
		
		$P0 = getinterp
		%r = $P0[ key ]
	};
	
	return $nsp;
}

