# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Factory;
# Provides factory methods to facilitate constructing matchers.

INIT {
	Program::initload(:after('Matcher'));
}

sub _initload() {
	my $class_name := 'Matcher::Factory';
	
	Class::multi_sub($class_name, 'equals', :starting_with('_equals_'));
	Class::multi_sub($class_name, 'make_matcher', :starting_with('_make_'));
	Class::multi_sub($class_name, 'returns', :starting_with('_returns_'));
	
	export('assert_that', 'empty', 'equals', 'has', 'instance_of', 'null', 'returns', 'same_as');
	export('export_sub', :tags( 'INTERNAL' ));			
}

sub assert_that($item, $matcher) {
	if ! $matcher.matches($item) {
		my $explain := $matcher.describe_self("Expected: ")
			~ $matcher.describe_failure($item, "\n     but: ");
		return 0;
	}
	
	return 1;
}

sub export_sub($sub, :$as, :$tags?) {
# Used to export a C< $sub > from a Matcher's namespace as a Factory method.
		
	unless $tags {
		$tags := 'DEFAULT';
	}
	
	export($sub, :as($as), :tags($tags));
}

sub empty()				{ return Matcher::Empty.new(); }

sub _equals_Float($value)		{ return Matcher::EqualsFloat.new($value); }
sub _equals_Integer($value)	{ return Matcher::Equals.new($value, :match_type('Integer')); }
sub _equals_String($value)		{ return Matcher::Equals.new($value, :match_type('String')); }
sub _equals_ResizablePMCArray($value) { return Matcher::EqualsArray.new($value); }

sub has($matcher)			{ return Matcher::DescribedAs.new('has', $matcher); }
sub instance_of($type)		{ return Matcher::InstanceOf.new($type); }

sub _make_Float($value)		{ return equals($value); }
sub _make_Integer($value)	{ return equals($value); }
sub _make_Matcher($matcher)	{ return $matcher; }
sub _make_String($value)		{ return equals($value); }

sub make_matcher_list(@list) {
	my @matchers := Array::empty();
	
	while @list {
		@matchers.push(make_matcher(@list.shift));
	}
	
	return Matcher::AnyOne(@matchers);
}
			
sub null()				{ return Matcher::Null.new(); }	

sub _returns_Float($value)		{ return returns(Matcher::IsCloseTo.new($value)); }
sub _returns_Integer($value)	{ return returns(Matcher::Equals.new($value)); }
sub _returns_Matcher($value)	{ return Matcher::DescribedAs.new('returns', $value); }
sub _returns_String($value)	{ return returns(Matcher::Equals.new($value)); }

sub same_as($value)		{ return Matcher::IdenticalTo.new($value); }
