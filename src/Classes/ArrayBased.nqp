# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

=module Class::ArrayBased

Base class built around  an array.

=cut 

module Class::ArrayBased;

Program::initload(:after('Class', 'Class::BaseBehavior', 'Dumper', 'Global'));

sub _initload() {
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
say("Storing attr: ", $index);
		self[$index] := @value[0];
	}
else { say("Fetching attr: ", $index); }
	
	return self[$index];
}
