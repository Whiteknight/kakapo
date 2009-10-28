# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo;
=module
Organizing code for setting up the Kakapo framework.
=cut

sub is_loaded() {
	return 1;
}

sub _pre_initload() {
=sub
	This sub is called directly by code in kakapo_top_pir.tmpl to perform 'very first thing' 
	initialization. The intent is to (1) ensure that the environment is initialized, and (2) to 
	directly initialize those modules that are prerequisites of just about every other module 
	in the system.
=end

	if our $_Pre_initload_done { return 0; }
	$_Pre_initload_done := 1;
	
	unless Opcode::defined(say) {
		Opcode::load_language('nqp');
	}
	
	unless Opcode::defined(P6object::HOW) {
		Opcode::load_bytecode('P6object.pbc');
	}	
	
	# Note: Order is important, here.
	
	# Global::_pre_initload();	# No such sub. Not needed. :)
	Dumper::_pre_initload();
	Opcode::_pre_initload();
	Class::_pre_initload();
	
	say("Kakapo _pre_initload done");
}
