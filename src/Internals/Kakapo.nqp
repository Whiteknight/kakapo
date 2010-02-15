# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo;
# Organizing code for setting up the Kakapo framework.

INIT {
	if Opcode::isnull(Kakapo::krt0::main) {
		# No krt0 - what shall I do?
	}
}

