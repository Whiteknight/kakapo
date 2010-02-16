# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Exception;
# Provides support for Exception PMCs

sub _pre_initload() {
}

method _attr($name, @value) {
	if +@value {
		pir::setattribute__vPSP(self, $name, @value.shift);
		self;
	}
	else {
		pir::getattribute__PPS(self, $name);
	}
}

method backtrace_string() {
	my @parts := Array::empty();

	for self.backtrace {
		my $sub := $_<sub>;
		
		if ! Opcode::isnull($sub) && Opcode::defined($sub) {
			my $sub_name := $sub.get_namespace.get_name.join('::')
				~ '::' ~ $sub;
			@parts.push($sub_name);
		}
	}
	
	return @parts.join("\n");
}

method exit_code(*@value)		{ self._attr('exit_code', @value); }
method handled(*@value)		{ self._attr('handled', @value); }
method message(*@value)		{ self._attr('message', @value); }
method payload(*@value)		{ self._attr('payload', @value); }

method severity(*@value)		{ self._attr('severity', @value); }
method throw()				{ pir::throw(self); }
method type(*@value)			{ self._attr('type', @value); }

class Exception::Severity {
	method NORMAL()		{ 0; }
	method WARNING()		{ 1; }
	method ERROR()			{ 2; }
	method SEVERE()			{ 3; }
	method FATAL()			{ 4; }
	method DOOMED()		{ 5; }
	method EXIT()			{ 6; }
}
