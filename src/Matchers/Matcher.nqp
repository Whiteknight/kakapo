module Matcher {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Class::HashBased',
		);
				
		NOTE("done");
	}
	
	method describe_failure($item, $description) {
		return $description
			~ "was '" ~ $item ~ "'";
	}
	
	method describe_self($description)	{ self._ABSTRACT_METHOD; }
	
	method init(@args, %opts) {
		Class::BaseBehavior::init(self, @args, %opts);
	}
	
	method matches($item)			{ self._ABSTRACT_METHOD; }
}


=begin

	less_than
	lt_num
	lt_str
	
	defined
	same_as
	all_of
	any_of
	has_key
	has_value
	has_item
	has_type
	contains
	
	
=cut
