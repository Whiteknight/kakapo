# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Matcher that matches if any one of its child matchers accepts. This is a short-circuiting 'OR'.
module Matcher::AnyOne;

INIT {
	Kakapo::depends_on(<
		Matcher::Factory
		Matcher::Junction
	>);
}

sub _initload() {
	extends( Matcher::Junction );
	
	Matcher::Factory::export_sub( Matcher::AnyOne::factory, :as('any_of'));
}


method describe_failure($item, $description = '') {
	$description ~ "was $item";
}

method describe_self($description) {
	if @!children {
		my @list := @!children.map( -> $kid { $kid.describe_self; });
		my $last := @list.pop;
		
		my $first := @list.join(', ');
		@list := [ $first, $last ];
		$description ~ @list.join(', or ');
	}
	else {
		$description;
	}
}
	
sub factory(*@list) { 
	Matcher::AnyOne.new( :children(@list) );
}

our method matches($item) {
	for @!children -> $kid {
		return 1 if $kid.matches: $item;
	}
	
	0;
}
