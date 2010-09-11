# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo;
# Organizing code for setting up the Kakapo framework.

INIT {
	if Opcode::isnull(Kakapo::krt0::main) {
		# No krt0 - what shall I do?
	}
}

# This sub is called directly by code in kakapo_top_pir.tmpl to perform 'very first thing'
# initialization. The intent is to (1) ensure that the environment is initialized, and (2) to
# directly initialize those modules that are prerequisites of just about every other module
# in the system.
sub _pre_initload() {

	if our $_Pre_initload_done { return 0; }
	$_Pre_initload_done := 1;

	unless Opcode::defined(say) {
		Opcode::load_language('nqp-rx');
	}

	unless Opcode::defined(P6object::HOW) {
		Opcode::load_bytecode('P6object.pbc');
	}

	call_preinit_subs( get_preinit_subs() );
}

sub call_preinit_subs(@list) {

	my $nsp;
	my &sub;

	for @list {
		#say("Calling preinit for $_");

		$nsp := pir::get_hll_namespace__PP( pir::split('::', ~$_) );
		&sub := $nsp.find_sub('_pre_initload');

		if pir::isnull(&sub) {
			say("*** WARNING: No _pre_initload sub found for namespace $_");
		}
		else {
			&sub();
		}
	}
}

sub is_loaded() {
	1;
}

sub ident() {
	our $_Ident := q{Git blob $Id$};
}
