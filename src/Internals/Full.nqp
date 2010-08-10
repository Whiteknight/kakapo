# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# This file is only linked with the 'kakapo_full' library.

module Kakapo;

sub depends_on(*@list, :$method = '_initload') {

	die("Nested array passed to @list parameter")
		if @list[0].isa: 'ResizablePMCArray';
		
	my $namespace := Parrot::caller_namespace();
	my $name := $namespace.string_name;

	if $method.isa: <String> {
		die("Could not locate '$method' method in namespace $name")
			unless $namespace.contains: $method;
	}

	$method := $namespace.find_sub: $method;
	Kakapo::Full::library_instance().at_initload($method, $name, :requires(@list));
}

sub get_preinit_subs() {

	# Note: Order is crucial.
	<
		Pmc::Namespace
		Global			
		Opcode
		Parrot
		Pir
		Pmc::Undef
		Pmc::Hash			
		Pmc::Key	
		Kakapo::Pmc::COMMON
		Pmc::Array
		Pmc::String
		Pmc::Exception
		Syntax
		P6metaclass
		P6object
		DependencyQueue
		ComponentMarshaller
		Library
		Kakapo::Full
	>;
}

sub initload_done($name = Parrot::caller_namespace().string_name) {
	Kakapo::Full::library_instance().module_initload_done: $name;
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

	for Kakapo::get_preinit_subs() -> $module_name {
		Kakapo::initload_done($module_name);
	}
}

sub library_instance($value?) {
	$value.defined
		?? (our $_library_instance := $value)
		!! $_library_instance;
}
