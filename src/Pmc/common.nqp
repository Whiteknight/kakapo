# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module common;
=module
Provides some common methods to all PMC types.
=end

sub _pre_initload() {
	# find all PMC namespaces
	# inject methods if not already present
	Global::inject(@subs, :namespace($nsp));
	
}

method clone()				{ Opcode::clone(self); }
method defined()				{ 1 }
method isa($type)				{ Opcode::isa(self, $type); }

# Need to generate a 'new'?
