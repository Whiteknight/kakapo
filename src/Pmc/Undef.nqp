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

method can($method)		{ Opcode::can(self, $method); }
method defined()			{ 0 }
method does($role)		{ 0 }
method isa($type)			{ Opcode::isa(self, $type); }
method new()			{ Opcode::new('Undef'); }

sub _pre_initload() {
	P6object::_get_meta().register('Undef');
}
