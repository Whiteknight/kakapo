# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::IllegalOperation is Exception::Wrapper;
class Exception::AbstractMethodInvocation is Exception::IllegalOperation;

class Exception::MethodNotFound is Exception::Wrapper;