# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::DescribedAs;
# Slathers a text label on another matcher.

use('Dumper');
Program::initload(:after('Matcher'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
	
	my $class_name := 'Matcher::DescribedAs';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
}

our method describe_failure($item, $description) {
	return self.predicate.describe_failure($item, $description);
}

our method describe_self($description) {
	return self.predicate.describe_self($description ~ self.described_as ~ ' ');
}

our method described_as(*@value)		{ self._ATTR('described_as', @value); }

our method init(@args, %opts) {
	Matcher::init(self, @args, %opts);
	
	unless self.described_as {
		unless +@args {
			Program::die("You must provide a description");
		}
		
		self.described_as(@args.shift);
	}
	
	unless self.predicate {
		unless +@args {
			Program::die("You must provide a Matcher predicate");
		}
		
		self.predicate(@args.shift);
	}
}

our method matches(*@item) {
	my %opts;
	my $result := Parrot::call_method_(self.predicate, 'matches', @item, %opts);
	return $result;
}

our method predicate(*@value)		{ self._ATTR('predicate', @value); }
