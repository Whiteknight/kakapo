module Factory {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::Factory';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Class::HashBased',
		);
	
		Class::multi_sub($class_name, 'is', :starting_with('_is_'));
		Class::multi_sub($class_name, 'equals', :starting_with('_equals_'));
		Class::multi_sub($class_name, 'not', :starting_with('_not_'));
		
		NOTE("done");
	}

	sub assert_that($item, $matcher) {
		if ! $matcher.matches($item) {
		say("MATCH FAILED");
			my $explain := $matcher.describe_self("Expected: ")
				~ $matcher.describe_failure($item, "\n     but: ");
			say($explain);			
			return 0;
		}
		
		return 1;
	}

	sub defined()				{ return Matcher::Defined.new(); }
	sub _equals_Float($value)		{ return Matcher::IsCloseTo.new($value); }
	sub _equals_Integer($value)	{ return Matcher::Equals.new($value, :match_type('Integer')); }
	sub _equals_String($value)		{ return Matcher::Equals.new($value, :match_type('String')); }

	sub _is_Float($value)		{ return Matcher::IsCloseTo.new($value); }
	sub _is_Integer($value)		{ return Matcher::Equals.new($value, :match_type('Integer')); }
	sub _is_Matcher($matcher)	{ return $matcher; }
	sub _is_String($value)		{ return Matcher::Equals.new($value, :match_type('String')); }
	
	sub _not_Float($value)		{ return not(is($value)); }
	sub _not_Integer($value)		{ return not(is($value)); }
	sub _not_Matcher($matcher)	{ return Matcher::Not.new($matcher); }
	sub _not_String($value)		{ return not(is($value)); }
	
	sub null()				{ return Matcher::Null.new(); }
	
	sub returns($value)			{ return Matcher::DescribedAs.new('returns', $value); }
	
	sub type($type)			{ return Matcher::ObjectOfType.new($type); }
}

