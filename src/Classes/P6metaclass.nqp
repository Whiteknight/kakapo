# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module P6metaclass;
# Extends the P6object.pir class with helper functions for advanced class declaration.

my method _add_attributes($class, %attrs) {
	my $parrotclass := self.declare_class($class);
	
	for %attrs {
		my %attr_info := %attrs{$_};
		
		$parrotclass.add_attribute(%attr_info<name>);
		self._make_accessor($parrotclass, %attr_info);
	}
}

my method _add_parents($class, @parents) {
# Do the work of actually adding parents. Called from C< declare > and C< extends >.

	@parents := _flatten_name_list(@parents);

	unless +@parents {
		return 0;
	}
	
	unless $class.defined {
		die("Cannot add parents to undefined class.");
	}

	my $parrotclass := self.declare_class($class);

	for @parents {
	say("Adding parent: $_");
	dump_class($_);
		self.add_parent($parrotclass, $_);
	}
}

sub declare($class?, :@has?, :@is?) {
	if ! @is.defined { @is := Array::empty(); }
	elsif ! Opcode::does(@is, 'array') { @is := Array::new(@is); }
	
	unless Opcode::defined($class) {
		$class := caller_namespace(2);
	}

	say("Declare class: $class");
	
	my $parent;
	
	if +@is {
		$parent := @is.shift;
	}
	
	my $parrotclass := P6metaclass.declare_class($class, $parent);

	P6metaclass._add_parents($parrotclass, @is);
	P6metaclass._add_attributes($parrotclass, @has);
}

method declare_class($class, $parent?) {
	unless Opcode::defined($class) {
		die("Cannot declare undefined class - give me a string name or a namespace");
	}

	my $parrotclass := self.get_parrotclass($class);
	if Opcode::isnull($parrotclass) { $parrotclass := Undef.new(); }

	# Already declared?
	unless Opcode::isa($parrotclass, 'P6object') {
		if Opcode::defined($parent) {
			self.new_class($class, :parent($parent));
		}
		else {
			self.new_class($class);
		}
		
		$parrotclass := self.get_parrotclass($class);
	}

	return $parrotclass;
}

sub dump_class($class) {
	my $parrotclass := P6metaclass.get_parrotclass($class);
	
	if Opcode::isa($parrotclass, 'PMCProxy') {
		say("Namespace: ", $parrotclass.name);
		DUMP_($parrotclass.inspect());
		for $parrotclass.inspect()<parents> {
			say("Parent: $_");
		}
	}
	
	DUMP_($parrotclass);
	my $name := ~ $parrotclass;
	DUMP_($name);
	my $nsp := $parrotclass.get_namespace;
	DUMP_($nsp);
	unless Opcode::isnull($nsp) {
		$name := $nsp.get_name.join('::');
	}
	
	say("Dumping class: $name");

	my %methods_seen;
	my $prefix := '    ';
	
	_dump_class_methods($parrotclass, $prefix, %methods_seen);
		
	my @parents := $parrotclass.inspect('all_parents');
	
	if +@parents {
		say("Parents:");

		for @parents {
			#unless $_ =:= $parrotclass {
				$prefix := '    ';
				my $pname := $_.get_namespace.get_name.join('::');
				say($prefix, $_);
				$prefix := '        ';
				_dump_class_methods($_, $prefix, %methods_seen);
			#}
		}
	}
}

sub _dump_class_methods($parrotclass, $prefix, %methods_seen) {
	my @methods := $parrotclass.methods.keys;
	
	if @methods {
		@methods.sort;
		
		for @methods {
			my $name := ~ $_;
			say($prefix, $name,
				%methods_seen{$name}
					?? ' (MASKED)' !! '');
			%methods_seen{$name} := 1;
		}
	} 
	else {
		say($prefix, 'No methods.');
	}
}

sub extends($first, *@args, :$class?) {
# Declares parent classes of the specified class. Note that the class may not be declared yet.
	if ! @args.defined { @args := Array::new($first); }
	elsif ! Opcode::does(@args, 'array') { @args := Array::new($first, @args); }
	else { @args.unshift($first); }
	
	unless $class.defined {
		$class := caller_namespace(2);
	}
	
	P6metaclass._add_parents($class, @args);
}

sub _flatten_name_list(@list) {
	my @merged := Array::empty();

	for @list {
		if Opcode::does($_, 'array') {
			@merged.append($_);
		}
		elsif $_.isa('String') {
			for $_.split(' ') {
				@merged.push($_);
			}
		}
		else {
			@merged.push($_);
		}
	}
	
	return @merged;
}

our %default_type;
our %is_sigil;
our %is_twigil;

sub has(*@args, :$class?, *%opts) {
# Declares attributes for a class. Note that the class may not be declared yet.

	unless %opts.defined { %opts := Hash::empty(); }
	unless $class.defined { $class := caller_namespace(2); }

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
			
			%opts{$base_name} := Hash::new(
				:accessor($base_name),
				:default_type(%default_type{$sigil}),
				:is_private($attr[0] eq '!' ?? 1 !! 0),
				:name($sigil ~ $attr), 
			); 
		}
	}
			
	P6metaclass._add_attributes($class, %opts);
}

sub has_vtable($name, &code, :$class?) {
	my $parrot_class	:= P6metaclass.get_parrotclass($class.defined ?? $class !! caller_namespace(2));
	
	unless $parrot_class.defined {
		die("Undefined class '", $class, "'");
	}

	$parrot_class.add_vtable_override($name, &code);
say("Adding vtable: ", $name, " to ", $parrot_class);
DUMP_(Opcode::inspect_string($parrot_class, 'vtable_overrides'));
}

my method _make_accessor($parrot_class, %info) {
	my $namespace := $parrot_class.get_namespace;
	
	my %accessor_details := Hash::new(
		:name(%info<accessor>),
		:namespace($parrot_class.get_namespace),
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
	
	Parrot::call_sub_(Pir::compile_sub, Array::empty(), %accessor_details);
}

sub _pre_initload() {
	use(	Dumper	);
	# NB: Can't import Opcode, because so many ops share names with class methods. (can, does, isa, etc.)
	use(	Parrot,	:tags('NAMESPACE'));

	%default_type{'@'}	:= 'ResizablePMCArray';
	%default_type{'$'}	:= 'Undef';
	%default_type{'%'}	:= 'Hash';
	%default_type{'&'}	:= 'Undef';

	%is_sigil{'@'}		:= 1;
	%is_sigil{'$'}		:= 1;
	%is_sigil{'%'}		:= 1;
	%is_sigil{'&'}		:= 1;
	
	%is_twigil{'!'}		:= 1;
	%is_twigil{'.'}		:= 1;

	export( 'declare', 'extends', 'has', 'has_vtable' );
}

sub register_pmc_type($type) {
	P6metaclass.register($type);
}

