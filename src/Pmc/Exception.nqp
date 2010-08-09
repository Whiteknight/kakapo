# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Pmc::Exception;
# Provides support for Exception PMCs

sub _pre_initload() {
	pir::get_namespace__p().export_methods_to: <Exception>;
}

my method _attr($name, @value) {
	if +@value {
		pir::setattribute__vPSP(self, $name, @value.shift);
		self;
	}
	else {
		pir::getattribute__PPS(self, $name);
	}
}

our method backtrace_string() {
	my @parts;
	my $sub;
	my $sub_name;
	
	for self.backtrace {
		$sub := $_<sub>;
		
		if ! pir::isnull($sub) && pir::defined($sub) {
			$sub_name := $sub.get_namespace.get_name.join('::')
				~ '::' ~ $sub;
			@parts.push($sub_name);
		}
	}
	
	return @parts.join("\n");
}

our method exit_code(*@value)		{ self._attr('exit_code', @value); }
our method handled(*@value)		{ self._attr('handled', @value); }
our method message(*@value)		{ self._attr('message', @value); }
our method payload(*@value)		{ self._attr('payload', @value); }

our method rethrow()			{ pir::rethrow(self); }
our method severity(*@value)		{ self._attr('severity', @value); }
our method throw()				{ pir::throw(self); }
our method type(*@value)			{ self._attr('type', @value); }

class Exception::Severity {
	method NORMAL()		{ 0; }
	method WARNING()	{ 1; }
	method ERROR()		{ 2; }
	method SEVERE()		{ 3; }
	method FATAL()		{ 4; }
	method DOOMED()		{ 5; }
	method EXIT()		{ 6; }
}

class Exception::Wrapper;

# Wrapper for Exception PMC because I can't get it working right now. (Subclassing exceptions
# doesn't work right now.)

INIT {
	# Doing this to avoid importing P6meta into _base lib.
	P6metaclass.add_attribute(Exception::Wrapper, '$!exception');
}

method create_exception() {
	#my $e := pir::new__PS('Exception');
	my $e := Exception.new;
	$e.type(self.type);
	$e.severity(self.severity);
	self.exception($e);
}

method exception(*@value) {
	if @value {
		pir::setattribute__vPSP(self, '$!exception', @value[0]);
		self;
	}
	else {
		pir::getattribute__PPS(self, '$!exception');
	}
}

method exit_code(*@value)	{ self.exception._attr('exit_code', @value); }
method handled(*@value)	{ self.exception._attr('handled', @value); }
method message(*@value)	{ self.exception._attr('message', @value); }
method payload(*@value)		{ self.exception._attr('payload', @value); }

method new(*@pos, *%named) {
	my $class := Opcode::getattribute(self.HOW, 'parrotclass');
	my $new_object := pir::new__PP($class);

	$new_object.create_exception;

	for %named {
		my $name := ~ $_;

		if Opcode::can($new_object, $name) {
			Parrot::call_method($new_object, $name, %named{$name});
		}
		else {
			pir::die("No accessor defined for attribute '$name'.");
		}
	}
	
	$new_object;
}

method rethrow()			{ self.exception.rethrow; }
method severity() 			{ Exception::Severity.SEVERE; }
method throw()			{ self.exception.throw; }

method type() {
	my $class := P6metaclass.get_parrotclass(self);
	my $type := pir::inspect__PPS($class, 'id');
	return $type + 2000;
}