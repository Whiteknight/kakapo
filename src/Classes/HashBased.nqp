module Class::HashBased;

_ONLOAD();

sub _ONLOAD() {
	if our $Onload_done { return 0; }
	$Onload_done := 1;

	Global::use('Dumper');
	Class::SUBCLASS('Class::HashBased',
		'Class::BaseBehavior',
		'Hash');
}

# override abstract Class::BaseBehavior::_ATTR
method _ATTR($name, @value) {
	if +@value {
		self{$name} := @value[0];
	}
	
	return self{$name};
}

method __dump($dumper, $label) {
	my $subindent;
	my $indent;

	# (subindent, indent) = dumper."newIndent"()
	Q:PIR {
		.local string indent, subindent
		$P0 = find_lex '$dumper'
		(subindent, indent) = $P0.'newIndent'()
		$P0 = box subindent
		store_lex '$subindent', $P0
		$P0 = box indent
		store_lex '$indent', $P0
	};
	
	my $brace := '{';
	
	my @keys;
	
	# Remember that for HashBased, self is a Hash.
	for self {
		@keys.push(~$_);
	}
	
	@keys.sort;
	
	for @keys {
		print($brace, "\n", $subindent);
		$brace := '';
		
		my $key	:= ~ $_;			
		my $val	:= self{$key};
	
		print("<", $key, "> => ");
		$dumper.dump($label, $val);
	}
	
	# my $index := 0;
	# my $num_elements := +@(self);

	# while $index < $num_elements {
		# print($brace, "\n", $subindent);
		# $brace := '';
		
		# my $val	:= self[$index];
		
		# print("[", $index, "] => ");
		# $dumper.dump($label, $val);
		
		# $index++;
	# }
	
	if $brace {
		print("(no attributes set)");
	} 
	else {
		print("\n", $indent, '}');
	}
	
	$dumper.deleteIndent();
}
