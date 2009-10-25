module Class::ArrayBased;

_ONLOAD();

sub _ONLOAD() {
	if our $Onload_done { return 0; }
	$Onload_done := 1;

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

