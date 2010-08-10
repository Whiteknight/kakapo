# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Equals;
# TypeSafe matcher that matches if the target is the same as a preset value.

our method describe_self($description) {
	return $description
		~ "a(n) "
		~ self.match_type
		~ " equal to '" ~ self.value ~ "'";
}

sub _factory_Float($value)			{ factory(Matcher::EqualsFloat.new($value)); }
sub _factory_Integer($value)		{ factory(Matcher::Equals.new($value, :match_type('Integer'))); }
sub _factory_Matcher($matcher)		{ Matcher::DescribedAs.new('is', $matcher); }
sub _factory_String($value)		{ factory(Matcher::Equals.new($value, :match_type('String'))); }

our method find_match_type($item) {
	for ('Float', 'Integer') {
		if Opcode::isa($item, ~$_) {
			self.match_type(~$_);
		}
	}

	unless self.match_type {
		self.match_type('String');
	}
}

our method init(@args, %opts) {
	Matcher::init(self, @args, %opts);

	unless +@args {
		DIE("You must provide a comparison value for 'equals' matcher.");
	}

	self.value(@args.shift);
	self.find_match_type(self.value);
}

our method _match_Float($item)		{ self.match_scalar($item); }
our method _match_Integer($item)		{ self.match_scalar($item); }
our method _match_String($item)		{ self.match_scalar($item); }

our method match_type(*@value)		{ self._ATTR('match_type', @value); }

our method match_scalar($item) {
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

our method value(*@value)			{ self._ATTR('value', @value); }
