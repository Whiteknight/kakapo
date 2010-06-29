# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo::Pmc::COMMON;

=begin

=item new() returns PMC

Returns a new instance of the PMC type of the invocant.

=code	my @array := ResizablePMCArray.new();

Note that this method is compiled at run-time for each class. See L< install_symbols >.

=end
=cut

sub _pre_initload() {
	# Make these available for import by other modules.
	#export(< can clone defined does isa >);

	# List all the PMC types here, with the methods to export. I'll sort them out later.
	my %methods_for;
	%methods_for<Class>			:= Array::new( <defined> );
	%methods_for<Exception>			:= <can clone defined does isa is_equal new>;
#	%methods_for<FileHandle>		:= <can clone defined isa is_equal new>; # not does
	%methods_for<Float>			:= <can clone defined does isa is_equal>;
	%methods_for<Hash>			:= <can clone defined does isa is_equal>;
	%methods_for<Integer>			:= <can clone defined does isa is_equal>;
	%methods_for<Key>			:= <can clone defined does isa is_equal>;
	%methods_for<NameSpace>		:= <can clone defined does isa is_equal>;
	%methods_for<ResizablePMCArray>	:= <can clone defined does isa is_equal new>;
	%methods_for<ResizableStringArray>	:= <can clone defined does isa is_equal new>;
	%methods_for<String>			:= <can clone defined does is_equal>; #! not new isa
#	%methods_for<StringHandle>		:= <can clone defined does isa is_equalnew>;
	%methods_for<Sub>			:= <can clone defined does isa is_equal>; #! not new
	%methods_for<Undef>			:= <can clone does isa is_equal new>; #! not defined

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
	for %methods_for.kv -> $pmc_type, @methods {
		if @methods {
			if pir::typeof__SP(Parrot::get_hll_global($pmc_type)) eq 'NameSpace' {
				P6metaclass.register($pmc_type);
			}

			my $namespace := Parrot::get_hll_namespace($pmc_type);
			install_methods($namespace, @methods);
		}
	}
}

#=begin
#=item can( $method_name ) returns Boolean

#Returns C< true > if the invocant object supports calling the C< $method_name > method.
#C< $method_name > must be a String. Returns C< false > otherwise.

#=begin code
#	if $object.can( 'resize' ) { ... }
#=end code
#=end

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

sub create_new_method_direct($class) {
    my $name := ~$class;
    my &new := Pir::compile_sub(
		:name('new'),
		:namespace($class.get_namespace()),
		:method(1),
		:body( (
			"\t" ~ '$P0 = ' ~ "new [ '$name' ]",
			"\t" ~ '.return ($P0)',
		) ),
	);
    $class.add_method("new", &new);
}

#=begin
#=item defined() returns Boolean
#
#Returns C< true >, always. Every common PMC type is considered to be defined, except
#members of the C< Undef > type. That type does not import this method.
#
#=begin code
#	if $object.defined { ... }
#=end code
#=end

method defined() {
	1;
}

#=begin
#=item does( $role ) returns Boolean

#Returns C< true > if the invocant implements the C< $role > named by the parameter.
#Returns C< false > otherwise.

#=begin code
#	if $object.does( 'array' ) { ... }
#=end code
#=end

method does($role) { pir::does(self, $role); }


sub install_methods($namespace, @methods, :$skip_new?) {
	my $from_nsp := pir::get_namespace__P();
        my %src_meths := pir::inspect__PPS($from_nsp, "methods");
        my %dest_meths := pir::inspect__PPS($namespace, "methods");

        # If the methods hash in the destination namespace is null, it means
        # We've already created the class, so we do a direct injection
        if pir::isnull__IP(%dest_meths) {
            my $dest_class := $namespace.get_class();
            install_methods_direct($dest_class, %src_meths, @methods, :skip_new($skip_new));
            return;
        }

        # If we're here, there is still a hash of methods in the namespace, so
        # we can dump the methods directly there, and they will get slurped up
        # When the class is initialized.

	for @methods {
                my $meth_name := ~$_;
                # Don't overwrite an existing method with the same name.
		unless %dest_meths{$meth_name} {
			if %src_meths{$meth_name} {
                            %dest_meths{$meth_name} := %src_meths{$meth_name};
			}
			elsif $_ eq 'new' {
                            unless $skip_new {
    				create_new_method($namespace);
                            }
			}
			else {
                            pir::die("Request to export unknown COMMON method '$_'");
			}
		}
	}
}

# Inject methods directly into the Class PMC
sub install_methods_direct($dest_class, %src_meths, @methods, :$skip_new)
{
    for @methods {
        my $meth_name := ~$_;
        if pir::isnull__IP($dest_class.find_method($meth_name)) {
            if %src_meths{$meth_name} {
                $dest_class.add_method($meth_name, %src_meths{$meth_name});
            }
            elsif $_ eq 'new' {
                unless $skip_new {
                    create_new_method_direct($dest_class);
                }
            }
            else {
                pir::die("Request to direct export unknown COMMON method '$_'");
            }
        }
    }
}

method isa($type) {
	pir::isa(self, $type);
}

method is_equal($other) {
	pir::iseq__IPP(self, $other);
}
