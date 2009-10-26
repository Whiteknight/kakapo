# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Undef;
=module

Provides missing methods to Undef PMC.

=method defined

Returns false.

=method isa

Translates method call to vtable lookup.

=end

method defined()			{ 0 }
method isa($type)			{ Parrot::isa(self, $type); }
