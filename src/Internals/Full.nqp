# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo;

sub is_loaded() {
	1;
}

# This sub is called directly by code in kakapo_top_pir.tmpl to perform 'very first thing' 
# initialization. The intent is to (1) ensure that the environment is initialized, and (2) to 
# directly initialize those modules that are prerequisites of just about every other module 
# in the system.

sub _pre_initload() {

	if our $_Pre_initload_done { return 0; }
	$_Pre_initload_done := 1;
	
	unless Opcode::defined(say) {
		Opcode::load_language('nqp');
	}
	
	unless Opcode::defined(P6object::HOW) {
		Opcode::load_bytecode('P6object.pbc');
	}	
	
	# Note: Order is crucial.
	Global::_pre_initload();
	Opcode::_pre_initload();
	Parrot::_pre_initload();
	Pir::_pre_initload();
	Array::_pre_initload();	# Compiling 'new' wants 'join'
	Kakapo::Pmc::COMMON::_pre_initload();
	String::_pre_initload();
	Exception::_pre_initload();
	Syntax::_pre_initload();

	# Base / Complete divider

	P6metaclass::_pre_initload();
	P6object::_pre_initload();

	DependencyQueue::_pre_initload();
	Program::_pre_initload();
	#Class::_pre_initload();
	#Program::_pre_initload(
		# 'Global', 
		# 'Dumper', 
		# 'Opcode', 
		# 'Undef',
		# 'Parrot', 
		# 'P6metaclass', 
		# 'P6object', 
		# 'Pir', 
		# 'Kakapo::Pmc::COMMON',
		# 'Class', 
		# 'Exception',
		# 'DependencyQueue', 
		# 'Program',
	# );
}

sub library_init_done() {
	say("Library init done");
	# Base does nothing.
}

sub library_load_done() {
	say("Library load done");
	# Base does nothing.
}

