# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Matcher::Boolean;
# Evaluates match in boolean context

INIT {
	Program::initload(:after('Matcher', 'Matcher::Factory'));	
}

method describe_self($previous) {
	my $bool := self.expected ?? 'true' !! 'false';
	
	return $previous
		~ "a $bool value";
}

method expected(*@value) {
	if @value {
		self._expected(@value.shift != 0);
		return self;
	}
	
	return self._expected;
}

sub factory_false()			{ Matcher::Boolean.new(:expected(0)); }
sub factory_true()			{ Matcher::Boolean.new(:expected(1)); }

sub _initload() {
# Special sub that runs after dependencies specified in INIT have been met.

	
	use(	'P6metaclass' );
	
	extends( 'Matcher' );
	has(	'$!_expected' );
	
	use(	'Matcher::Factory', :tags('INTERNAL'));
	
	export_sub(Matcher::Boolean::factory_true, :as('true'));
	export_sub(Matcher::Boolean::factory_false, :as('false'));
}

method matches($item) {
	return $item ?? self.expected !! !self.expected;
}
