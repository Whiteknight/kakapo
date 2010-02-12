# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo::ExceptionWrapper;
# Wrapper for Exception PMC because I can't get it working right now.

INIT {
	use(	'P6metaclass' );
	has(	'$!exception' );
}

method create_exception() {
	return Exception.new;
}

method exit_code(*@value)		{ self.exception._attr('exit_code', @value); }
method handled(*@value)		{ self.exception._attr('handled', @value); }

method _init_(@pos, %named) {
	self.exception(self.create_exception);
	self.exception.type(self.severity);
	self.exception.type(self.type);
	self._init_args_(@pos, %named);
}

method message(*@value)		{ self.exception._attr('message', @value); }
method payload(*@value)		{ self.exception._attr('payload', @value); }
method severity() 			{ Exception::Severity.SEVERE; }
method throw()				{ self.exception.throw; }
method type()				{ self.__ABSTRACT__; }

class Exception::IllegalOperation			is Kakapo::ExceptionWrapper;
method type()				{ return 1000; }
class Exception::AbstractMethodInvocation	is Exception::IllegalOperation;
method type()				{ return 1001; }

class Exception::MethodNotFound			is Kakapo::ExceptionWrapper;
method type()				{ return 45; }

class Exception::UnitTestFailure			is Kakapo::ExceptionWrapper;
 method severity()			{ Exception::Severity.ERROR; }
method type()				{ return 1002; }