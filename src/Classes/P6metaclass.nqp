# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module P6metaclass;
# Extends the P6object.pir class with helper functions for advanced class declaration.

sub _pre_initload() {
	# NB: Can't import Opcode, because so many ops share names with class methods. (can, does, isa, etc.)
	use(	Parrot,	:tags('NAMESPACE'));

	our %default_type;
	our %is_sigil;
	our %is_twigil;

	%default_type{'@'}	:= 'ResizablePMCArray';
	%default_type{'$'}	:= 'Undef';
	%default_type{'%'}	:= 'Hash';
	%default_type{'&'}	:= 'Undef';

	%is_sigil{'@'}	:= 1;
	%is_sigil{'$'}		:= 1;
	%is_sigil{'%'}		:= 1;
	%is_sigil{'&'}		:= 1;

	%is_twigil{'!'}	:= 1;
	%is_twigil{'.'}	:= 1;


	Global::inject_root_symbol(P6metaclass::auto_accessors);
	Global::inject_root_symbol(P6metaclass::does_role);
	Global::inject_root_symbol(P6metaclass::dôes_rôle);
	Global::inject_root_symbol(P6metaclass::extends);
	Global::inject_root_symbol(P6metaclass::has);
	Global::inject_root_symbol(P6metaclass::has_vtable);
	Global::inject_root_symbol(P6metaclass::role);
	Global::inject_root_symbol(P6metaclass::rôle);
}

my method _add_attributes($class, %attrs) {
	my $parrotclass := self.declare_class($class);

	for %attrs {
		my %attr_info := %attrs{$_};
		$parrotclass.add_attribute(%attr_info<name>);
		self._make_accessor($parrotclass, %attr_info);
	}
}

# Do the work of actually adding parents. Called from C< declare > and C< extends >.
my method _add_parents($class, @parents) {

	die("Cannot add parents to undefined class.")
		unless ! pir::isnull__IPS($class);

	my $first;
	my $parrotclass;

	if @parents {
		$first := @parents.shift;
		$parrotclass := self.declare_class($class, :parent($first));

		for @parents {
			self.add_parent($parrotclass, $_);
		}

	}
}

# Generate accessors for class attribute data. Accessors can be generated for public and/or private
# attributes ($. and $!, respectively). All attribute sigils ($, @, %, &) will be generated. If a method
# with the same name as the attribute already exists, that method is not generated. If two attributes
# have the same basename ($foo and @foo) only one accessor will be generated ($foo). (Note also
# that NQP currently only supports ?, !, and * as twigils - '.' cannot be used in code.

sub auto_accessors(*@attrs, :$class = caller_namespace(), :$private = 0, :$public = 1) {
	my $parrotclass := P6metaclass.declare_class: $class;
	my %all_attrs := $parrotclass.inspect('attributes');

	@attrs.grep( -> $attr { ! %all_attrs.contains($attr); }).map: -> $attr {
		$parrotclass.add_attribute($attr);
	};

	# If there are any attrs in @attrs, they're all added to the class by now.
	if @attrs.elems {
		$public := $private := 1;	# Use the list, ignore these.
	}
	else {
		@attrs := %all_attrs.keys; # Use :public/:private to tune the list.
	}

	my %make_accessor;
	%make_accessor<.> := $public;
	%make_accessor<> := $public;
	%make_accessor<!> := $private;
	our %is_sigil;
	our %is_twigil;
	our %default_type;
	our %methods := $parrotclass.inspect('methods');
	
	for @attrs -> $attr {
		my $sigil := $attr[0];

		die("Invalid attribute name: $attr - must have sigil({'$@%&'})")
			unless %is_sigil{$sigil};

		my $twigil := $attr[1];
		$twigil := ''
			unless %is_twigil{$twigil};
		
		my $name_start := $sigil.length + $twigil.length;
		my $method_name := $attr.substr($name_start, );

		if %make_accessor{$twigil} && ! %methods.contains( $method_name ) {

			my %attr_info := hash(
				:accessor(		$method_name ),
				:default_type(	%default_type{$sigil} ),
				:name(		$attr ),
			);

			%methods{$method_name} := %attr_info;
			P6metaclass._make_accessor($parrotclass, %attr_info);
		}
	}
}

# There's already a compose_role, that doesn't do anything. :(
my method compose_role2($class_pmc, $role_pmc) {
	die('Invalid $class_pmc parameter - must be a Class pmc')
		unless pir::isa($class_pmc, 'Class');
	die('Invalid $role_pmc parameter - must be a Role pmc')
		unless pir::isa($role_pmc, 'Role');
		
	my %role_attrs := $role_pmc.inspect('attributes');
	
	if %role_attrs {
		# See TT#1527 - 'add_role' doesn't add attributes
		my %class_attrs := $class_pmc.inspect('attributes');
	
		for %role_attrs -> $attr {
			die("Attribute conflict: attribute $attr required by role $role_pmc already present in class $class_pmc")
				if %class_attrs.contains: ~$attr;
				
			$class_pmc.add_attribute($attr.key);
		}
	}
	
	$class_pmc.add_role($role_pmc);
}

sub declare($class?, :@has?, :@is?) {
	if ! Opcode::does(@is, 'array') { @is := Array::new(@is); }

	unless Opcode::defined($class) {
		$class := caller_namespace();
	}

	my $parent;

	if +@is {
		$parent := @is.shift;
	}

	my $parrotclass := P6metaclass.declare_class($class, $parent);

	P6metaclass._add_parents($parrotclass, @is);
	P6metaclass._add_attributes($parrotclass, @has);
}

# Given a string, namespace, protoobject, or class, make sure it's declared and 
# return the resulting parrotclass.
#
# NB: If $parent is a protoobject, it's stuck with .defined=false
my method declare_class($class, :$parent) {
	die('$class parameter to declare_class cannot be null')
		if pir::isnull__IP($class);
		
	die('$class parameter to declare_class cannot be truly undef')
		if !pir::defined($class) && !pir::isa__IPS($class, 'P6protoobject');

	my $parrotclass := self.get_parrotclass($class);
	
	# Result from get_parrotclass could be:
	# 1. null - nothing declared yet
	# 2. PMCProxy - dangerous
	# 3. Class/ isa P6object - already declared
	# 4. Class / !isa P6object - This will be a problem.
	# 5. Role - Like a class, but different. Handle it.

	# Already declared?
	if pir::isnull__IP($parrotclass) {
		
		# NB: This is incompatible with roles. Is it necessary after calling get_parrotclass?
		# && Opcode::isa($parrotclass, 'P6object') 
		
		if pir::isa__IPS($parent, 'P6protoobject') || Opcode::defined($parent) {
			self.new_class($class, :parent($parent));
		}
		else {
			self.new_class($class);
		}

		$parrotclass := self.get_parrotclass($class);
	}
	elsif pir::isa__IPS($parrotclass, 'Role') {
		# Pass it through.
	}
	elsif ! pir::isa__IPS($parrotclass, 'P6object') {
		say("Declaring class $class, found a ", pir::typeof__SP($parrotclass));
		#_dumper($parrotclass);
	}

	$parrotclass;
}

# Declares a role named `$name`. The name is considered an absolute path. Any 
# passed `@attrs,` `%methods,` or `@roles` are added to the new role. Returns 
# the new role.

method declare_role($name = caller_namespace(), :@attrs, :%methods, :@roles) {
	my %init;

	%init<attributes> := @attrs;
	%init<methods> := %methods;
	%init<roles> := @roles;

	if pir::isa($name, 'String') {
		my $obj := Parrot::get_hll_global( $name );
		
		die( "Error: cannot define role $name because a ",
			pir::typeof__SP($obj), " with that name already exists.")
			unless is_null($obj) || pir::isa($obj, 'NameSpace');

		%init<namespace> := NameSpace.fetch: $name;		
	}
	elsif pir::isa($name, 'NameSpace') {
		%init<namespace> := $name;
	}
	else {
		die("Don't know how to get namespace of ", pir::typeof__SP($name));
	}
		
	my $role := pir::new__PSP( 'Role', %init );
	%init<namespace>.get_parent.add_var($role.inspect('name'), $role);
	$role;
}

method does($obj, $role) {
	my $role_pmc := self.get_parrotclass($role);
	pir::does__IPP(pir::class__PP($obj), $role_pmc);
}

sub does_role(@role, :$class = caller_namespace() ) {
	@role := [ @role ]
		if pir::isa(@role, 'String') 
			|| ! pir::does( @role, 'array' );

	my $class_pmc := P6metaclass.declare_class($class);

	for @role -> $role {
		my $role_pmc;
		
		if pir::isa($role, 'Role') {
			$role_pmc := $role;
		}
		elsif pir::isa($role, 'String') {
			$role_pmc := NameSpace.fetch($role).get_class;
		}
		elsif pir::isa($role, 'NameSpace') {
			$role_pmc := $role.get_class;
		}
		else {
			die("Don't know how to fetch role for ", pir::typeof__SP($role));
		}

		die( "Symbol found for $role is not a Role" )
			unless pir::isa($role_pmc, 'Role');
		
		P6metaclass.compose_role2($class_pmc, $role_pmc);
	}
}

sub dôes_rôle(@role, :$class = caller_namespace()) {
	does_role(@role, :class($class));
}

sub dump_class($class) {
	_dumper(P6metaclass.get_parrotclass($class), ~$class);
}

# Declares parent classes of the specified class. Note that the child class may not be declared yet.
sub extends(*@parents, :$class =caller_namespace().string_name) {
	if pir::does__IPS(@parents[0], <array>) {
		@parents := @parents.shift;
	}

	P6metaclass._add_parents($class, @parents);
}

my method get_parrotrole($x, :$hll = 'parrot') {
	if pir::isa__IPS($x, 'Role') {
		return $x;
	}
	elsif pir::isa__IPS($x, 'P6protoobject') {
		die("Protoobject unexpected - want role.");
	}
	elsif pir::isa__IPS($x, 'String') {
		$x := NameSpace.fetch: $x;
	}
	
	if pir::isa__IPS($x, 'NameSpace') {
		$x.get_class;
	}
	else {
		die("Don't know how to get role from ", pir::typeof__SP($x));
	}
}

# Declares attributes for a class. Note that the class may not be declared yet.
sub has(*@args, :$class = caller_namespace(), *%opts) {

	# Handle  has(< a b c >) - only arg is an RxA.
	if +@args == 1 && ! @args[0].isa('String') {
		@args := @args[0];
	}

	our %default_type;
	our %is_sigil;
	our %is_twigil;

	while @args {
		my $next	:= @args.shift;
		my @words	:= $next.split(' ');

		for @words {
			# Attributes are twigiled with '' (nothing), ! or .
			my $attr	:= ~ $_;
			my $twigil	:= '!';
			my $sigil	:= $attr[0];

			if %is_sigil{$sigil} {
				$attr	:= $attr.substr(1);
			}
			else {
				$sigil	:= '$';
			}

			my $base_name;
			
			if %is_twigil{$attr[0]} {
				$twigil := $attr[0];
				$base_name := $attr.substr(1);
			}
			else {
				$base_name := $attr;
				$attr := '!' ~ $attr;
			}

			if %opts.contains($base_name) {
				die("Re-declaration of attribute '$base_name'");
			}

			%opts{$base_name} := hash(
				:accessor($base_name),
				:default_type(%default_type{$sigil}),
				:is_private($twigil eq '!' ?? 1 !! 0),
				:name($sigil ~ $attr),
			);
		}
	}

	P6metaclass._add_attributes($class, %opts);
}

sub has_vtable($name, &code, :$class = caller_namespace().get_class) {
	my $parrot_class	:= P6metaclass.get_parrotclass($class);

	if pir::isnull__IP($parrot_class) {
		die("Undefined class '", $class, "'");
	}

	$parrot_class.add_vtable_override($name, &code);
}

my method _make_accessor($parrotclass, %info) {
	#my $namespace := $parrotclass.get_namespace;

	my $name := %info<accessor>;
	
	# Don't define one if it's already present on the local class (not inherited)
	return 0
		if $parrotclass.methods{ $name }.defined;

	my %accessor_details := hash(
		:name( $name ),
		:namespace($parrotclass.get_namespace),
		:method(1),
	);

	%accessor_details<params> := (
		'.param pmc value :optional',
		'.param int has_value :opt_flag',
	);

	my $attr := %info<name>;
	my $debug := %info<debug> ?? '' !! '# ';

	%accessor_details<body> := [
		"\t" ~ 'if has_value goto set_value',
		"\t" ~ $debug ~ "say \"Fetching attribute '$attr'\"",
		"\t" ~ "value = getattribute self, '$attr'",
		"\t" ~ 'unless null value goto have_value',
		"\t" ~ $debug ~ "say \"Creating new PMC type: " ~ %info<default_type> ~ "\"",
		"\t" ~ "value = new [ '" ~ %info<default_type> ~ "' ]",
		"\t" ~ "setattribute self, '$attr', value",

		'have_value:',
		"\t" ~ $debug ~ '$P0 = get_hll_global [ "Dumper" ], "DUMP_"',
		"\t" ~ $debug ~ '$P0(value)',
		"\t" ~ '.return (value)',

		'set_value:',
		"\t" ~ $debug ~ "say \"Setting attribute '$attr'\"",
		"\t" ~ $debug ~ '$P0 = get_hll_global [ "Dumper" ], "DUMP_"',
		"\t" ~ $debug ~ '$P0(value)',
		"\t" ~ "setattribute self, '$attr', value",
		"\t" ~ '.return (self)',
	];

	Parrot::call_sub_(Pir::compile_sub, [ ], %accessor_details);
}


sub register_pmc_type($type) {
	P6metaclass.register($type);
}

sub role($name = caller_namespace(), *%named) {
	P6metaclass.declare_role($name, |%named);
}

sub rôle($name = caller_namespace(), *%named) {
	P6metaclass.declare_role($name, |%named);
}