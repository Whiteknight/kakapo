# $Id: $

module MatcherAssert {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'MatcherAssert';
		
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
			~ "was "
			~ $item;
	}
	
	method describe_self($description)	{ self._ABSTRACT_METHOD; }
	
	method init(@args, %opts) {
		Class::BaseBehavior::init(self, @args, %opts);
	}
	
	method matches($item)			{ self._ABSTRACT_METHOD; }
}

module Matcher::Defined {

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::Defined';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}
	
	method describe_self($description) {
		return $description ~ "a defined object";
	}
	
	method matches(*@value) {
		unless +@value {
			Parrot::die("A value must be passed to matches($item)");
		}

		my $result := Parrot::defined(@value[0]);		
		return $result;
	}
}

module Matcher::DescribedAs {

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::DescribedAs';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}

	method describe_failure($item, $description) {
		return self.predicate.describe_failure($item, $description);
	}
	
	method describe_self($description) {
		return self.predicate.describe_self($description ~ self.described_as ~ ' ');
	}
	
	method described_as(*@value)		{ self._ATTR('described_as', @value); }

	method init(@args, %opts) {
		Matcher::init(self, @args, %opts);
		
		unless self.described_as {
			unless +@args {
				Parrot::die("You must provide a description");
			}
			
			self.described_as(@args.shift);
		}
		
		unless self.predicate {
			unless +@args {
				Parrot::die("You must provide a predicate Matcher");
			}
			
			self.predicate(@args.shift);
		}
	}
	
	method matches($item) {
		my $result := self.predicate.matches($item);
		return $result;
	}
	
	method predicate(*@value)		{ self._ATTR('predicate', @value); }
}

module Matcher::Not {

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::Not';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}

	method describe_failure($item, $description) {
		return self.predicate.describe_failure($item, $description);
	}
	
	method describe_self($description) {
		return self.predicate.describe_self($description ~ "not ");
	}
	
	method init(@args, %opts) {
		unless +@args {
			DIE("You must provide a predicate Matcher for Match::Not");
		}
		
		self.predicate(@args.shift);
		Matcher::init(self, @args, %opts);
	}
	
	method matches($item) {
		my $result := ! self.predicate.matches($item);
		return $result;
	}
	
	method predicate(*@value)		{ self._ATTR('predicate', @value); }
}

module Matcher::Null {

	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::Null';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}
	
	method describe_self($description) {
		return $description ~ "a null value";
	}
	
	method matches(*@value) {
		unless +@value {
			Parrot::die("A value must be passed to matches($item)");
		}
		
		return Parrot::is_null(@value[0]);
	}
}

module Matcher::TypeSafe {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::TypeSafe';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher'
		);
				
		NOTE("done");
	}

	method describe_failure($item, $description) {
		my $failure;
		
		if Parrot::is_null($item) {
			$failure := 'was null';
		}
		elsif self.wrong_type {
			$failure := 'was the wrong type';
		}
		else {
			return self.describe_failure_typesafe($item, $description);
		}
		
		return $description ~ $failure;
	}

	method describe_failure_typesafe($item, $description) {
		return $description ~ "was: " ~ $item;
	}
		
	method matches($item) {
		self.wrong_type(0);
		
		if ! Parrot::is_null($item) {
			return self.matches_typesafe($item);
		}
		
		return 0;
	}	
	
	method matches_typesafe($item) {
		self.wrong_type(1);
		return 0;
	}
	
	method wrong_type(*@value)		{ self._ATTR('wrong_type', @value); }
}

module Matcher::IsCloseTo {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::IsCloseTo';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher::TypeSafe'
		);

		Class::multi_method($class_name, 'matches_typesafe', :starting_with('_match_'));
		NOTE("done");
	}

	method describe_failure($item, $description) {
		return $description
			~ $item
			~ " differed by "
			~ self.difference($item);
	}

	method difference($item) {
		my $difference := $item - self.wanted;
		my $abs := Q:PIR {
			$P0 = find_lex '$difference'
			%r = abs $P0
		};
		return $abs;
	}
	
	method init(@children, %attributes) {
		unless +@children {
			DIE("You must provide at least a target value for is-close-to matcher");
		}
		
		self.value(@children.shift);
		
		if +@children {
			self.within(@children.shift);
		}
		else {
			if self.value != 0 {
				self.within(self.value * '0.0001');
			}
			else {
				self.within('0.0001');
			}
		}
	}

	method _match_Float($item)		{ self.match_scalar($item); }
	method _match_Integer($item)		{ self.match_scalar($item); }
	method _match_String($item)		{ self.match_scalar($item); }
	
	# NB: cannot use _match_scalar because of mmd bug (TT#1133)
	method match_scalar($item) {
		if self.difference($item) <= self.within {
			return 1;
		}
		
		return 0;
	}
	
	method value(*@value)			{ self._ATTR('value', @value); }
	method within(*@value)			{ self._ATTR('within', @value); }
}

module Matcher::Equals {
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;
				
		Parrot::IMPORT('Dumper');
		
		my $class_name := 'Matcher::Equals';
		
		NOTE("Creating class ", $class_name);
		Class::SUBCLASS($class_name,
			'Matcher::TypeSafe'
		);

		Class::multi_method($class_name, 'matches_typesafe', :starting_with('_match_'));
		NOTE("done");
	}

	method describe_self($description) {
		return $description 
			~ "a " ~ self.match_type
			~ " equal to " ~ self.value;
	}
	
	method find_match_type($item) {
		for ('Float', 'Integer') {
			if Parrot::isa($item, ~$_) {
				self.match_type(~$_);
			}
		}
		
		unless self.match_type {
			self.match_type('String');
		}
	}
	
	method init(@children, %attributes) {
		unless +@children {
			DIE("You must provide a comparison value for 'equals' matcher.");
		}
		
		self.value(@children.shift);		
	}

	method _match_Float($item)		{ self.match_scalar($item); }
	method _match_Integer($item)		{ self.match_scalar($item); }
	method _match_String($item)		{ self.match_scalar($item); }

	method match_type(*@value)		{ self._ATTR('match_type', @value); }
	
	method match_scalar($item) {
		my $value := self.value;
		
		unless self.match_type {
			self.find_match_type($item);
		}

		if self.match_type eq 'String' {
			return $item eq $value;
		}
		else {
			return $item == $value;
		}
	}
	
	method value(*@value)			{ self._ATTR('value', @value); }
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
