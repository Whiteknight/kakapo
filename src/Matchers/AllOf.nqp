# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Matchers that matches only when all of its child matchers do. This is a short-circuiting 'AND'.
module Matcher::AllOf;

INIT {
	Kakapo::depends_on(<
		Matcher::Factory
		Matcher::Junction
	>);
}

sub _initload() {
	extends( Matcher::Junction );
	
	Matcher::Factory::export_sub( Matcher::AllOf::factory, :as('all_of'));
}


method describe_failure($item, $description = '') {
	my $count := 0;
	my $and := '';
	
	for @!children -> $kid {
		unless $kid.matches: $item {
			$description := $kid.describe_failure($item, "$description$and");
			$and := ', and ';
			++$count;
		}
	}
	
	if $count > 1 {
		$description := "( $description)";
	}
	
	$description;
}

method describe_self($description) {
	$description 
	~ "all of ( " 
	~ @!children.map( -> $_ { $_.describe_self; }).join(', ')
	~ " )";
}
	
sub factory(*@list) { 
	Matcher::AllOf.new( :children(@list) );
}

our method matches($item) {
	@!children.grep( -> $kid { ! $kid.matches: $item } ) == 0;
}
