# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Factory;
=module
	Provides factory methods to facilitate constructing matchers.
=end

Global::use(Dumper);
my $class_name := 'Matcher::Factory';

# FIXME: The class is created only for the sake of multis, which I don't think require the class anymore. Check and if true get 
# rid of the SUBCLASS call.
say("Creating class ", $class_name);
NOTE("Creating class ", $class_name);
Class::SUBCLASS($class_name,
	'Class::HashBased',
);

Class::multi_sub($class_name, 'equals', :starting_with('_equals_'));
Class::multi_sub($class_name, 'make_matcher', :starting_with('_make_'));
Class::multi_sub($class_name, 'returns', :starting_with('_returns_'));
Global::export('assert_that', 'empty', 'equals', 'has', 'instance_of', 'null', 'returns', 'same_as');
		
NOTE("done");

sub assert_that($item, $matcher) {
	if ! $matcher.matches($item) {
		my $explain := $matcher.describe_self("Expected: ")
			~ $matcher.describe_failure($item, "\n     but: ");
		say("assert: ", $explain);			
		return 0;
	}
	
	return 1;
}

sub export_sub($sub, :$as, :$tags?) {
=sub
	Used to export a C< $sub > from a Matcher's namespace as a Factory method.
=end
		
	unless $tags {
		$tags := 'DEFAULT';
	}
	
	Global::export($sub, :as($as), :tags($tags));
}

sub empty()				{ return Matcher::Empty.new(); }

sub _equals_Float($value)		{ return Matcher::IsCloseTo.new($value); }
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
