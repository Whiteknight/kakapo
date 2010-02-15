# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

=begin

=NAME Kakapo::Pmc::COMMON - Shared methods exported to many PMC types.

=DESCRIPTION

This module serves as a repository for common methods that Kakapo inserts into the namespaces
of many PMC types.

=SYNOPSIS

=begin code

	$pmc := CommonPmcType.new();
	
	if $pmc.can( $method_name ) { ... }
	
	$pmc2 := $pmc.clone();
	
	if $pmc.defined { ... }
	
	if $pmc.does( $role ) { ... }
	
	if $pmc.isa( $type ) { ... }
	
=end code

=end

module Kakapo::Pmc::COMMON;

=begin

=item new() returns PMC

Returns a new instance of the PMC type of the invocant.

=code	my @array := ResizablePMCArray.new();

Note that this method is compiled at run-time for each class. See L< install_symbols >.

=end

sub _pre_initload() {
	my %pmcs;

	%pmcs<Exception>		:= <can clone defined does isa new>;
	%pmcs<Float>		:= <can clone defined does isa>;
	%pmcs<Hash>		:= <can clone defined does isa>;
	%pmcs<ResizablePMCArray>	:= <can clone defined does isa new>;
	%pmcs<ResizableStringArray>	:= <can clone defined does isa new>;
	%pmcs<Sub>		:= <can clone defined does isa>;
	%pmcs<Undef>		:= <can clone does isa>; #! not defined
	
	my $from_nsp := pir::get_namespace__P();
	my %new_namespaces;

	for %pmcs {
		my %export_subs;
		my $pmc_name := ~ $_;
		my $to_nsp := Parrot::get_hll_namespace($pmc_name);
		
		# NB: Moving this line down causes strange failures.
		P6metaclass.register($pmc_name);
		
		for %pmcs{$_} {
			if $from_nsp.contains($_) {
				%export_subs{$_} := $from_nsp{$_};
			}
			elsif $_ eq 'new' {
				%new_namespaces{$pmc_name} := $to_nsp;
			}
			else {
				pir::die("Request to export unknown COMMON method '$_'");
			}

		}
		
		$from_nsp.export_to($to_nsp, %export_subs);
	}

	# Build 'new' subs separately because the compile_sub routine needs some of the 
	# methods we installed, above.
	
	for %new_namespaces {
		unless %new_namespaces{$_}.contains('new') {
			create_new_method(~ $_);
		}
	}
}

=begin
=item can( $method_name ) returns Boolean

Returns C< true > if the invocant object supports calling the C< $method_name > method.
C< $method_name > must be a String. Returns C< false > otherwise.

=begin code
	if $object.can( 'resize' ) { ... }
=end code
=end

method can($method) {
	pir::can(self, $method); 
}

=begin
=item clone() returns PMC

Returns a clone of the invocant object. The C< clone > method is frequently overridden,
but in general should return an object which is a duplicate in all respects -- same 
contents, same members, same size, same value, whatever. 

See the documentation of the particular PMC type to determine I< whether >, and if so
I< how > complex data structures are cloned. In general, Parrot's basic PMC types do
B< deep > clones, which can cause problems if your data structure contains cycles.

=begin code
	$obj2 := $object.clone;
=end code
=end

method clone() {
	pir::clone(self);
}

=begin
=item defined() returns Boolean

Returns C< true >, always. Every common PMC type is considered to be defined, except
members of the C< Undef > type. That type does not import this method.

=begin code
	if $object.defined { ... }
=end code
=end

method defined() {
	1; 
}

=begin
=item does( $role ) returns Boolean

Returns C< true > if the invocant implements the C< $role > named by the parameter.
Returns C< false > otherwise.

=begin code
	if $object.does( 'array' ) { ... }
=end code
=end

method does($role)				{ pir::does(self, $role); }

sub import(:$into_namespace, :@except?, :@symbols?, :@tags?) {
	my $new := create_new_method($into_namespace);
	Global::inject($new, $into_namespace, :as('new'));
}

sub create_new_method($namespace) {
	my $type := ~ $namespace;
	my &new := Pir::compile_sub(
		:name('new'),
		:namespace($namespace),
		:method(1),
		:body( (
			"\t" ~ '$P0 = ' ~ "new [ '$type' ]",
			"\t" ~ '.return ($P0)',
		) ),
	);
}

=begin
=item isa( $type ) returns Boolean

Returns C< true > if the invocant is a member of the class or PMC type named
by the parameter. Returns C< false > otherwise.

=begin code
	if $object.isa( 'Undef' ) { ... }
=end code
=end

method isa($type) {
	pir::isa(self, $type);
}
