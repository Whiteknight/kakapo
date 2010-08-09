# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Kakapo::Pmc::COMMON;

sub _pre_initload() {
	# List all the PMC types here, with the methods to export. I'll sort them out later.
	my %methods_for;
	%methods_for<Class>			:= [ <defined> ];
	%methods_for<Exception>			:= <can clone defined does isa is_equal>;
	%methods_for<Float>			:= <can clone defined does isa is_equal>;
	%methods_for<Hash>			:= <can clone defined does isa is_equal>;
	%methods_for<Integer>			:= <can clone defined does isa is_equal>;
	%methods_for<Key>			:= <can clone defined does isa is_equal>;
	%methods_for<NameSpace>		:= <can clone defined does isa is_equal>;
	%methods_for<ResizablePMCArray>	:= <can clone defined does isa is_equal>;
	%methods_for<ResizableStringArray>	:= <can clone defined does isa is_equal>;
	%methods_for<String>			:= <can clone defined does is_equal>; #! not isa
	%methods_for<Sub>			:= <can clone defined does isa is_equal>;
	%methods_for<Undef>			:= <can clone does isa is_equal>; #! not defined

	# Make these available for import by other modules.
	my $common_nsp := pir::get_namespace__p();
	
	# Put the common methods into the export namespace.
	my %methods;
	
	for <can clone defined does isa is_equal> -> $name {
		%methods{$name} := $common_nsp.export_method: $name;
	}

	# Now process the PMCs
	for %methods_for.kv -> $pmc, @method_list {
		my $target_nsp := Parrot::get_hll_namespace($pmc);

		unless pir::isa( Parrot::get_hll_global( $pmc ), 'P6protoobject' ) {
			P6metaclass.register: $pmc;
		}
		
		my $target_pmc := $target_nsp.get_class;
		
		for @method_list -> $method_name {
			$target_nsp.install_method: $method_name, %methods{ $method_name };
		}
	}
}

# =item can( $method_name ) returns Boolean
# 
# Returns C< true > if the invocant object supports calling the C< $method_name > method.
# C< $method_name > must be a String. Returns C< false > otherwise.
# 
# =begin code
#	if $object.can( 'resize' ) { ... }
# =end code

method can($method) {
	pir::can(self, $method);
}

#=begin
#=item clone() returns PMC

#Returns a clone of the invocant object. The C< clone > method is frequently overridden,
#but in general should return an object which is a duplicate in all respects -- same
#contents, same members, same size, same value, whatever.

#See the documentation of the particular PMC type to determine I< whether >, and if so
#I< how > complex data structures are cloned. In general, Parrot's basic PMC types do
#B< deep > clones, which can cause problems if your data structure contains cycles.

#=begin code
#	$obj2 := $object.clone;
#=end code
#=end

method clone() {
	pir::clone(self);
}

# =item new() returns PMC
#
# Returns a new instance of the PMC type of the invocant.
#
# =code	my @array := ResizablePMCArray.new();
#
# Note that this method is compiled at run-time for each class. See L< install_symbols >.

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
	
	$namespace.add_sub('new', &new);
}

#=begin
#=item defined() returns Boolean

#Returns C< true >, always. Every common PMC type is considered to be defined, except
#members of the C< Undef > type. That type does not import this method.

#=begin code
#	if $object.defined { ... }
#=end code
#=end

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
	my $from_nsp := pir::get_namespace__p();

	my %export_subs;
	my $pmc_name := ~ $namespace;
	my @export_methods;
	say("Namespace: $pmc_name");
	for @methods {
	say("$_");
		if pir::defined__ip( $namespace.get_method( ~ $_ ) ) {
			say("skip - $_ is defined");
			# continue - already have this method
		}
		elsif $_ eq 'new' && ! $skip_new {
			# compiles method in target nsp, but doesn't install: bug?
			create_new_method( $pmc_name );
		}
		else {
			pir::push(@export_methods, ~ $_);
		}
	}
	
	if @export_methods {
		say("Export methods: " ~ pir::join__ssp(', ', @methods));
		$from_nsp.export_methods_to($namespace, :methods(@export_methods));
	}
}

method isa($type) {
	pir::isa(self, $type);
}

method is_equal($other) {
	pir::iseq__IPP(self, $other);
}
