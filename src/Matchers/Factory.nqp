module Matcher::Factory;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
			
	Global::use('Dumper');
	
	my $class_name := 'Matcher::Factory';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Class::HashBased',
	);

	Class::multi_sub($class_name, 'is', :starting_with('_is_'));
	Class::multi_sub($class_name, 'equals', :starting_with('_equals_'));
	Class::multi_sub($class_name, 'make_matcher', :starting_with('_make_'));
	Class::multi_sub($class_name, 'not', :starting_with('_not_'));
	Class::multi_sub($class_name, 'returns', :starting_with('_returns_'));

	NOTE("done");
}

sub assert_that($item, $matcher) {
	if ! $matcher.matches($item) {
		my $explain := $matcher.describe_self("Expected: ")
			~ $matcher.describe_failure($item, "\n     but: ");
		say("assert: ", $explain);			
		return 0;
	}
	
	return 1;
}

sub all_of(*@list)			{ return Matcher::AllOf(make_matcher_list(@list)); }
sub any_of(*@list)			{ return Matcher::AnyOne(make_matcher_list(@list)); }

sub defined()				{ return Matcher::Defined.new(); }
sub elements($count)		{ return Matcher::Elements.new($count); }
sub empty()				{ return Matcher::Empty.new(); }

sub _equals_Float($value)		{ return Matcher::IsCloseTo.new($value); }
sub _equals_Integer($value)	{ return Matcher::Equals.new($value, :match_type('Integer')); }
sub _equals_String($value)		{ return Matcher::Equals.new($value, :match_type('String')); }
sub _equals_ResizablePMCArray($value) { return Matcher::EqualsArray.new($value); }

sub false()				{ return Matcher::False.new(); }
sub has($matcher)			{ return Matcher::DescribedAs.new('has', $matcher); }
sub instance_of($type)		{ return Matcher::InstanceOf.new($type); }

sub _is_Float($value)		{ return is(Matcher::EqualsFloat.new($value)); }
sub _is_Integer($value)		{ return is(Matcher::Equals.new($value, :match_type('Integer'))); }
sub _is_Matcher($matcher)	{ return Matcher::DescribedAs.new('is', $matcher); }
sub _is_String($value)		{ return is(Matcher::Equals.new($value, :match_type('String'))); }

sub _make_Float($value)		{ return equals($value); }
sub _make_Integer($value)		{ return equals($value); }
sub _make_Matcher($matcher)	{ return $matcher; }
sub _make_String($value)		{ return equals($value); }

sub make_matcher_list(@list) {
	my @matchers := Array::empty();
	
	while @list {
		@matchers.push(make_matcher(@list.shift));
	}
	
	return Matcher::AnyOne(@matchers);
}
			
sub _not_Float($value)		{ return not(is($value)); }
sub _not_Integer($value)		{ return not(is($value)); }
sub _not_Matcher($matcher)	{ return Matcher::Not.new($matcher); }
sub _not_String($value)		{ return not(is($value)); }

sub null()				{ return Matcher::Null.new(); }	

sub _returns_Float($value)		{ return returns(Matcher::IsCloseTo.new($value)); }
sub _returns_Integer($value)	{ return returns(Matcher::Equals.new($value)); }
sub _returns_Matcher($value)	{ return Matcher::DescribedAs.new('returns', $value); }
sub _returns_String($value)	{ return returns(Matcher::Equals.new($value)); }

sub same_as($value)		{ return Matcher::IdenticalTo.new($value); }
sub true()				{ return Matcher::True.new(); }
