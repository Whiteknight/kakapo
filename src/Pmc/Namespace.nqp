# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module NameSpace;
# Provides missing methods to NameSpace PMC.

method can($method)		{ Opcode::can(self, $method); }
method defined()			{ 1 }
method does($role)			{ 0 }
method isa($type)			{ Opcode::isa(self, $type); }
method new()			{ Opcode::new('NameSpace'); }

sub _pre_initload() {
	P6metaclass::register_pmc_type('NameSpace');
}
