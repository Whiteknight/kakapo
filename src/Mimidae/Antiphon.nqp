# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Mimus::Antiphon;

has $!sig_matcher;
has @!side_effects;
has $!throw;
has $!return;
has $!invoke_count;

method matches($call_sig) {
	$!sig_matcher.matches($call_sig);
}

method _init_obj(*@pos, *%named) {
	$!invoke_count := 0;
	@!side_effects := Array::new();
	
	self._init_args(|@pos, |%named);
}

method invoke() {
	$!invoke_count++;

	for @!side_effects -> &do {
		&do();
	}

	if $!throw {
		# TODO: Exception classes?
		$!throw.throw;
	}
	
	if $!return {
		return $!return;
	}

	# FIXME: Otherwise, return 'self' of the object?
}

method sig_matcher($value?)	{ $value.defined ?? ($!sig_matcher := $value) !! $!sig_matcher; }

method will( :&do, :$return, :$throw ) {
	self.will_do(&do) if &do.defined;
	self.will_return($return) if $return.defined;
	self.will_throw($throw) if $throw.defined;
	
	self;
}

method will_do(&closure) {
	@!side_effects.push: &closure;
	self;
}

method will_return($result) {
	$!return := $result;
	self;
}

method will_throw($exception) {
	$!throw := $exception;
	self;
}
