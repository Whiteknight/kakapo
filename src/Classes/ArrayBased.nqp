# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

=module Class::ArrayBased

Base class built around  an array.

=cut 

module Class::ArrayBased;

sub _pre_initload() {
	Global::use('Dumper');
	
	my $class_name := 'Class::ArrayBased';
	Class::SUBCLASS($class_name,
		'Class::BaseBehavior',
		'FixedPMCArray',
	);
	
	# override abstract Class::BaseBehavior::_ATTR
	#Class::multi_method($class_name, '_ATTR', :starting_with('__ATTR_'));
}

method __ATTR_String($name, @value) {
	DIE("Don't have String->Index implemented yet.");
	#Really want SUPER to be able to easily count members before sizing.
}

#method __ATTR_Integer($index, @value) {
method _ATTR($index, @value) {
	if +@value {
		self[$index] := @value[0];
	}
	
	return self[$index];
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
	
	my $index:= 0;
	my $limit := Array::elements(self);
	
	while $index < $limit {
		print($brace, "\n", $subindent);
		$brace := '';
		
		my $val	:= self[$index];
	
		print("[", $index, "] => ");
		$dumper.dump($label, $val);
		
		$index++;
	}
	
	if $brace {
		print("(no attributes set)");
	} 
	else {
		print("\n", $indent, '}');
	}
	
	$dumper.deleteIndent();
}
