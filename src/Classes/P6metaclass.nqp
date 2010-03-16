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
	Global::inject_root_symbol(P6metaclass::extends);
	Global::inject_root_symbol(P6metaclass::has);
	Global::inject_root_symbol(P6metaclass::has_vtable);
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

	unless $class.defined {
		die("Cannot add parents to undefined class.");
	}

	if @parents {
		my $first := @parents.shift;
		my $parrotclass := self.declare_class($class, :parent($first));

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

			my %attr_info := Hash.new(
				:accessor(		$method_name ),
				:default_type(	%default_type{$sigil} ),
				:name(		$attr ),
			);

			%methods{$method_name} := %attr_info;
			P6metaclass._make_accessor($parrotclass, %attr_info);
		}
	}
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

# NB: If $parent is a protoobject, it's stuck with .defined=false
method declare_class($class, :$parent) {
	$class := $class // die("Cannot declare undefined class - give me a string name or a namespace");
	my $parrotclass := self.get_parrotclass($class);

	# Already declared?
	unless ! Opcode::isnull($parrotclass) && Opcode::isa($parrotclass, 'P6object') {
		if pir::isa__IPP($parent, 'P6protoobject') || Opcode::defined($parent) {
			self.new_class($class, :parent($parent));
		}
		else {
			self.new_class($class);
		}

		$parrotclass := self.get_parrotclass($class);
	}

	$parrotclass;
}

sub dump_class($class) {
	_dumper(P6metaclass.get_parrotclass($class), ~$class);
}

# Declares parent classes of the specified class. Note that the child class may not be declared yet.
sub extends($first, *@parents, :$class?) {
	if Opcode::does($first, <array> ) {
		@parents := $first;
	}
	else {
		@parents.unshift: $first;
	}

	$class := $class // caller_namespace().string_name;
	P6metaclass._add_parents($class, @parents);
}

# Declares attributes for a class. Note that the class may not be declared yet.
sub has(*@args, :$class?, *%opts) {

	our %default_type;
	our %is_sigil;
	our %is_twigil;

	unless $class.defined { $class := caller_namespace(); }

	# Handle  has(< a b c >) - only arg is an RPA.
	if +@args == 1 && ! @args[0].isa('String') {
		@args := @args[0];
	}

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

			unless %is_twigil{$attr[0]} {
				$attr := '!' ~ $attr;
			}

			my $base_name := $attr.substr(1);

			if %opts.contains($base_name) {
				die("Re-declaration of attribute '$base_name'");
			}

			%opts{$base_name} := Hash.new(
				:accessor($base_name),
				:default_type(%default_type{$sigil}),
				:is_private($attr[0] eq '!' ?? 1 !! 0),
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
	my $namespace := $parrotclass.get_namespace;

	my %accessor_details := Hash.new(
		:name(%info<accessor>),
		:namespace($parrotclass.get_namespace),
		:method(1),
	);

	%accessor_details<params> := (
		'.param pmc value :optional',
		'.param int has_value :opt_flag',
	);

	my $attr := %info<name>;
	my $debug := %info<debug> ?? '' !! '# ';

	%accessor_details<body> := Array::new(
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
	);

	Parrot::call_sub_(Pir::compile_sub, Array::new(), %accessor_details);
}

sub register_pmc_type($type) {
	P6metaclass.register($type);
}
