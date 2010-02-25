# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# This file is only linked with the 'kakapo_full' library. 

module Kakapo;

sub get_preinit_subs() {

	# Note: Order is crucial.
	
	<	Global
		Opcode
		Parrot
		Pir
		Key
		Array
		Kakapo::Pmc::COMMON
		String
		Exception
		Syntax
		P6metaclass
		P6object
		DependencyQueue
		Program
	>;
}

sub program_instance($value?) {
	$value.defined
		?? (our $_Program_instance := $value)
		!! $_Program_instance;
}

sub library_init_done() {
	library_initload_done();
}

sub library_load_done() {
	library_initload_done();
}

sub library_initload_done() {
	my $interp := pir::getinterp__P();
	
	my &getpid := pir::dlfunc__PPSS(pir::null__P(), 'getpid', 'i');
	my &getuid := pir::dlfunc__PPSS(pir::null__P(), 'getuid', 'i');
	
	program_instance(
		Program.new(
			:args(		$interp[2] ),
			:env(		pir::new__PS('Env') ),
			:executable(	$interp[9] ),
			:process_id(	&getpid() ),
			:uid(		&getuid() ),
			:stdin(	pir::getstdin__P() ),
			:stderr(	pir::getstderr__P() ),
			:stdout(	pir::getstdout__P() ),
		)
	);
}