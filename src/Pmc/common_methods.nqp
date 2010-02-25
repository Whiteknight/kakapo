# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo::Pmc::COMMON;

=begin

=item new() returns PMC

Returns a new instance of the PMC type of the invocant.

=code	my @array := ResizablePMCArray.new();

Note that this method is compiled at run-time for each class. See L< install_symbols >.

=end

sub _pre_initload() {
	# List all the PMC types here, with the methods to export. I'll sort them out later.
	my %methods_for;
	%methods_for<Exception>		:= <can clone defined does isa new>;
#	%methods_for<FileHandle>		:= <can clone defined isa new>; # not does
	%methods_for<Float>			:= <can clone defined does isa>;
	%methods_for<Hash>			:= <can clone defined does isa>;
	%methods_for<Integer>			:= <can clone defined does isa>;
	%methods_for<Key>			:= <can clone defined does isa>;
	%methods_for<NameSpace>		:= <can clone defined does isa>;
	%methods_for<ResizablePMCArray>	:= <can clone defined does isa new>;
	%methods_for<ResizableStringArray>	:= <can clone defined does isa new>;
	%methods_for<String>			:= <can clone defined does >; #! not new isa
#	%methods_for<StringHandle>		:= <can clone defined does isa new>;
	%methods_for<Sub>			:= <can clone defined does isa>; #! not new
	%methods_for<Undef>			:= <can clone does isa new>; #! not defined
	
	my $from_nsp := pir::get_namespace__P();

	# Order counts
	my @first_pmcs := <
		Undef 
		String 
		Hash 
		ResizablePMCArray 
		ResizableStringArray
	>;

	# Get the critical PMCs set up first (need .defined, etc., for building 'new' methods)
	for @first_pmcs {
		P6metaclass.register(~ $_);
		my $namespace := Parrot::get_hll_namespace(~ $_);
		install_methods($namespace, %methods_for{$_}, :skip_new);
	}
	
	# Now build 'new' methods.
	for @first_pmcs {
		my $namespace := Parrot::get_hll_namespace(~ $_);
		install_methods($namespace, %methods_for{$_}); # no :skip_new here
		%methods_for{$_} := my $undef;
	}
	
	# Now process the rest of the PMCs
	for %methods_for {
		if %methods_for{~ $_} {
			P6metaclass.register(~ $_);
			my $namespace := Parrot::get_hll_namespace(~ $_);
			install_methods($namespace, %methods_for{$_});
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

sub install_methods($namespace, @methods, :$skip_new?) {
	my $from_nsp := pir::get_namespace__P();

	my %export_subs;
	my $pmc_name := ~ $namespace;
	
	for @methods {
		unless $namespace{~ $_} {
			if $from_nsp{~ $_} {
				%export_subs{$_} := $from_nsp{~ $_};
			}
			elsif $_ eq 'new' {
				unless $skip_new {
					create_new_method(~ $_);
				}
			}
			else {
				pir::die("Request to export unknown COMMON method '$_'");
			}
		}
	}
	
	if %export_subs {
		$from_nsp.export_to($namespace, %export_subs);
	}
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
