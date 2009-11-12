# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module P6object;
=module
Extends the P6object.pir class with helper functions for advanced class declaration.
=end

method _add_attributes($class, %attrs) {
	my $parrotclass := self._declare_class($class);
	
	for %attrs {
		my %attr_info := %attrs{$_};
		
		my $name := %attr_info<name>.defined ?? %attr_info<name> !! ~ $_;
		
		self.add_attribute($parrotclass, $name);
		self._make_accessor($parrotclass, $name);		
	}
}

method _add_parents($class, @parents) {
	@parents := _flatten_name_list(@parents);

	unless +@parents {
		return 0;
	}
	
	unless $class.defined {
		die("Cannot add parents to undefined class.");
	}
	
	my $parrotclass := self._declare_class($class, :parent(@parents.shift));

	for @parents {
		self.add_parent($parrotclass, $_);
	}
}

method _declare_class($class, :$parent?) {
	unless $class.defined {
		die("Cannot declare undefined class - give me a string name or a namespace");
	}
	
	my $parrotclass;
	
	if $class.isa('Class') {
		return $class;
	}
	elsif $class.isa('NameSpace') {
		$parrotclass := self.get_parrotclass($class);
	}
	else {
		my $type := Opcode::typeof($class);
		die("Don't know what to do with a $class of type ", $type);
	}

	# Already defined?
	unless $parrotclass.defined {
		if $parent.defined {
			self.new_class($class, :parent($parent));
		}
		else {
			self.new_class($class);
		}
		
		$parrotclass := self.get_parrotclass($class);
	}
	
	return $parrotclass;
}

sub declare($class?, :@has?, :@is?) {
	if ! @is.defined { @is := Array::empty(); }
	elsif ! Opcode::does(@is, 'array') { @is := Array::new(@is); }
	
	my %attrs;

	if @has.isa('Hash') {
		%attrs := @has;
	}
	else {
		
	}
		
	unless $class.defined {
		$class := caller_namespace(3);
	}
	
	my $meta := _get_meta();
	my $parrotclass := $meta._declare_class($class, @is.shift);

	$meta._add_parents($parrotclass, @is);
	$meta._add_attributes($parrotclass, @has);
}

sub _flatten_name_list(@list) {
	my @merged := Array::empty();

	for @list {
		if does($_, 'array') {
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

method _get_classname($class) {
	my $name := (~$class).split(';').join('::');
	return $name;
}

sub _get_meta() {
	our $_P6_Metaclass;
	
	unless Opcode::defined($_P6_Metaclass) {
		$_P6_Metaclass := Opcode::new('P6metaclass');
	}

	return $_P6_Metaclass;
}

sub has(*@pos, :$class?, *%opts) {
=method
Declares attributes for a class. Note that the class may not be declared yet.
=end

	if ! %opts.defined { %opts := Hash::empty(); }

	unless $class.defined {
		$class := caller_namespace(3);
	}
	
	while @pos {
		my $next := @pos.shift;
		my @words := $next.split(' ');
		
		for @words {
			unless %opts{~ $_} {
				%opts{~ $_} := Hash::new(:name(~$_));
			}
		}
	}
			
	_get_meta()._add_attributes($class, %opts);
}

sub has_vtable($name, &code, :$class?) {
	my $meta		:= _get_meta();
	my $parrot_class	:= $meta.get_parrotclass($class.defined ?? $class !! caller_namespace(2));
	
	unless $parrot_class.defined {
		die("Undefined class '", $class, "'");
	}

	$parrot_class.add_vtable_override($name, &code);
say("Adding vtable: ", $name, " to ", $parrot_class);
DUMP_(Opcode::inspect($parrot_class, 'vtable_overrides'));
}

sub extends($first, *@args, :$class?) {
=method
Declares parent classes of the specified class. Note that the class may not be declared yet.
=end

	if ! @args.defined { @args := Array::new($first); }
	elsif ! Opcode::does(@args, 'array') { @args := Array::new($first, @args); }
	else { @args.unshift($first); }
	
	unless $class.defined {
		$class := caller_namespace(3);
	}
	
	_get_meta()._add_parents($class, @args);
}

method _make_accessor($parrot_class, $name) {
	my $namespace := $parrot_class.get_namespace;
	
	Pir::compile_sub(
		:namespace($namespace),
		:name($name),
		:method(1),
		:params(
			'.param pmc value :optional',
			'.param int has_value :opt_flag',
		),

		:body(
			"\t" ~ "if has_value goto set_value",
			"\t" ~ "value = getattribute self, '" ~ $name ~ "'",
			"\t" ~ "say 'Fetching attribute " ~ $name ~ "'",
			"\t" ~ "$P0 = get_hll_global [ 'Dumper' ], 'DUMP_'",
			"\t" ~ "$P0(value)",
			"\t" ~ ".return (value)",
			
			"set_value:",
			"\t" ~ "say 'Setting attribute " ~ $name ~ "'",
			"\t" ~ "$P0 = get_hll_global [ 'Dumper' ], 'DUMP_'",
			"\t" ~ "$P0(value)",
			"\t" ~ "setattribute self, '" ~ $name ~ "', value",
			"\t" ~ ".return (self)",
		),
	);
}

sub _pre_initload() {
	Global::use(	Dumper	);
	Global::use(	Opcode,	:tags('DEFAULT', 'TYPE'));
	Global::use(	Parrot,	:tags('NAMESPACE'));

	Global::export('declare', 'extends', 'has', 'has_vtable');
}

module P6protoobject {

	method new(*@pos, *%opt) {
		my $parrotclass := Opcode::getattribute(self.HOW, 'parrotclass');
		my $new_object := Opcode::new($parrotclass);

		if Opcode::can($new_object, 'init_') {
			$new_object.init_(@pos, %opt);
		}
		elsif Opcode::can($new_object, 'init') {
			Parrot::call_method_($new_object, 'init', @pos, %opt);
		}
		
		return $new_object;
	}
}
