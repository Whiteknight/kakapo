# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# This file is only linked with the 'kakapo_full' library. 

module Kakapo;

sub depends_on(*@list, :$method) {
	my $namespace := Parrot::caller_namespace();
	my $name := $namespace.string_name;
	
	unless $method.defined {
		unless Parrot::caller_namespace().contains(<_initload>) {
			die("Could not locate (default) '_initload' method in namespace $name");
		}
		
		$method := $namespace<_initload>;
	}

	Kakapo::Full::library_instance().at_initload($method, $name, :requires(@list));
}

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
		Library
		Program
		Kakapo::Full
	>;
}

sub initload_done($name?) {
	$name := $name // Parrot::caller_namespace().string_name;
	Kakapo::Full::library_instance().module_initload_done($name);
}

sub library_init_done() {
	Kakapo::Full::library_instance().do_init();
}

sub library_load_done() {
	Kakapo::Full::library_instance().do_load();
}

module Kakapo::Full;

sub _pre_initload() {
	library_instance(Library.new);
}

sub library_instance($value?) {
	$value.defined
		?? (our $_library_instance := $value)
		!! $_library_instance;
}

