# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo;

sub is_loaded() {
	1;
}

sub get_preinit_subs() {

	# Note: Order is crucial.
	
	<	Global
		Opcode
		Parrot
		Pir
		Array
		Kakapo::Pmc::COMMON
		String
		Exception
		Syntax
	>;
}

sub library_init_done() {
	# Nothing.
}

sub library_load_done() {
	# Nothing.
}

