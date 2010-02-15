# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Class;
#	Provides a class/subclass management library.

sub _pre_initload() {
# Special sub called when the Kakapo library is loaded or initialized. This is to guarantee this 
# module is available during :init and :load processing for other modules.

	use(	'Opcode');	# defined, die
	use(	'Dumper');
	
	Opcode::load_bytecode('P6object.pir');
	
	Class::BaseBehavior::_pre_initload();
	Class::ArrayBased::_pre_initload();
	Class::HashBased::_pre_initload();
}

sub NEW_CLASS($class_name) {
	NOTE("NEW_CLASS: ", $class_name);
	my $class_info := _class_info($class_name);
	
	if $class_info<created> {
		die("Class '", $class_name, "' already created.");
	}
	
	$class_info<created> := 1;
	my $new_class := get_meta().new_class($class_name);
	return $new_class;
}

sub SUBCLASS($class_name, *@parents) {
	my $class_info := _class_info($class_name);
	
	if $class_info<created> {
		die("Class '", $class_name, "' already created.");
	}
	else {
		$class_info<created> := 1;
	}
	
	NOTE("Creating subclass ", $class_name, 
		" with ", +@parents, " parents.");
	my $meta := get_meta();

	unless +@parents {
		NOTE("Adding parent class 'Class::HashBased'");
		@parents.push('Class::HashBased');
	}

	NOTE("Creating class with first parent");
	my $class := $meta.new_class($class_name, 
		:parent(@parents.shift));
	
	NOTE("Attaching other parents to new class");
	while @parents {
		$meta.add_parent($class, @parents.shift);
	}
	
	return $class;
}

sub _class_info($class_name) {
	unless our %Class_info { %Class_info := Hash.new(); }
	
	unless %Class_info{$class_name} {
		%Class_info{$class_name} := Hash.new();
		my $info := %Class_info{$class_name};
		
		$info<multisubs> := Hash::empty();
	}
	
	return %Class_info{$class_name};
}

sub compile_default_multi($class_name, $multi_name, :$is_method) {
	my $kind := $is_method ?? 'multimethod' !! 'multisub';

	NOTE("Compiling default ", $kind, " for: ", 
		$class_name, " :: ", $multi_name);

	NOTE("Looking for fallback method in parent class(es)");
	my $default_method := Class::find_method_named($class_name, $multi_name);
	
	while Opcode::isa($default_method, 'MultiSub') {
		NOTE("I don't think nesting multisubs is possible, but...");
		$default_method := $default_method[0];
	}

	my @actions;
	
	unless $default_method {
		@actions := Array::new(
			"say 'No method available that will accept the following arguments:'",
			'$P0 = get_hll_global ["Dumper"], "DUMP_"',
			'$P0(pos)',
			"die 'No method available that will accept the arguments given'",
		);
	}

	compile_multi($class_name, $multi_name,
		:actions(@actions),
		:is_method($is_method),
		:target($default_method),
	);
}

# =sub compile_multi

# Creates a multi-sub trampoline that invokes a given NQP function. When invoked 
# as `compile_multi('My::Class', 'foo', 'Parameter::Class', 'handler_method')` the
# generated trampoline looks like:

# .namespace [ 'My' ; 'Class' ]
# .sub 'foo' :method :multi(_, [ 'Parameter' ; 'Class' ])
# .param pmc positionals :slurpy
# .param pmc named :named :slurpy
# .tailcall 'handler_method'(self, positionals :flat, named :named :flat)
# .end

# But multimethod names block inherited multimethods, so a "default" multi
# has to be created that forwards calls to any parent class multimethods. Per
# pmichaud, a multi() or multi(_) (on self) will do the trick. So first check if 
# the default exists already, and if not, then check if the parent(s*) name
# resolves. 

# =cut

sub compile_multi($class_name, $multi_name, *@param_types,
	:$target, :@actions?, :$is_method?) 
{
	my $kind := $is_method ?? 'multimethod' !! 'multisub';

	NOTE("Compiling ", $kind, " trampoline [", 
		$class_name, "::", $multi_name, 
		"(", @param_types.join(', '), ", ...) -> ",
		$target);

	if $is_method {
		@param_types.unshift('_');
	}
	
	my $class_info := _class_info($class_name);
	my $signature  := signature(@param_types);
	
	if $class_info<multisubs>{$multi_name}{$signature} {
		NOTE("This trampoline has already been compiled.");
		return 0;
	}
	
	$class_info<multisubs>{$multi_name}{$signature} := 1;
	
	trampoline($class_name, $multi_name, 
		:actions(@actions),
		:adverbs(":multi(" ~ $signature ~ ")"
			~ ($is_method ?? ' :method' !! '')),
		:is_method($is_method),
		:target($target),
	);
}

sub find_class_named($class_name) {
	my $class := Opcode::get_class($class_name);
	
	unless Opcode::defined($class) {
		my @parts := $class_name.split('::');
		$class := Opcode::get_class(@parts);
	
		unless Opcode::defined($class) {
			$class := Opcode::get_class(
				Opcode::get_namespace($class_name)
			);
		}
	}
	
	return $class;
}

sub find_method_named($class, $method) {
	if Opcode::isa($class, 'String') {
		NOTE("Got class name: ", $class);
		$class := find_class_named($class);
	}
	elsif ! Opcode::isa($class, 'Class') {
		NOTE("Got object PMC: ", $class);
		$class := Opcode::typeof($class);
		NOTE("Resolved to Class PMC: ", $class);
	}
	else {
		NOTE("Got Class PMC: ", $class);
	}
	
	my $result := $class.find_method($method);
	return $result;
}

sub get_method_list($obj) {
	my $class := Class::of($obj);

	unless Opcode::defined($class) {
		die("No class. Don't know what to do.");
	}

	my @methods := $class.methods.keys;
	return @methods;
}

sub _initload() {
	die("Class::_initload cannot be used. 'Class' must initialize in _pre_initload, WAY before everything else.");
}

sub multi_method($class_name, $multi_name, :$starting_with) {
	multi_sub($class_name, $multi_name, 
		:starting_with($starting_with), :is_method(1));
}

sub multi_sub($class_name, $multi_name, :$starting_with, :$is_method?) {
	my $kind := $is_method ?? 'multimethod' !! 'multisub';
	
	NOTE("Creating new ", $kind, " '", $multi_name, "' for class ", $class_name,
		", out of methods starting with ", $starting_with);
	
	my $class_info	:= _class_info($class_name);
	my $nsp		:= Opcode::get_hll_namespace($class_name);
	my $prefix_len	:= $starting_with.length;
	
	for $nsp {
		my $name := ~ $_;
		
		if $name.substr(0, $prefix_len) eq $starting_with {
			my $param_class := $name.substr($prefix_len);
			my $param1_class := $param_class.split('_').join('::');
			
			NOTE("Compiling '", $multi_name, "' handler for (_, ", 
				$param1_class, ")");
			Class::compile_multi($class_name,
				$multi_name,
				$param1_class,
				:is_method($is_method),
				:target($name),
			);
		}
	}

	NOTE("All matching trampolines built. Adding method to class.");
	my $multi_sub := $nsp{$multi_name};
	
	if $is_method {
		# FIXME: Is this needed? Can the class just suck up the multi during creation?
		unless $class_info<created> {
			die("Class '", $class_name, "' has not been created yet. Cannot add multimethod.");
		}

		# FIXME: Pretty sure this guard is wrong. Need the default, but this doesn't seem smart enough.
		unless Opcode::defined($class_info<multisubs>{$multi_name}) {
			Class::compile_default_multi($class_name, 
				$multi_name, :is_method($is_method));
		}

		get_meta().add_method($class_name, $multi_name, $multi_sub);
	}
	
	NOTE("done");
}

sub name_of($object, :$delimiter?) {
	unless Opcode::defined($delimiter) {
		$delimiter := '::';
	}
	
	my $class := ~ Class::of($object);
	$class := $class.split(';').join($delimiter);
	return $class;
}

sub of($object) {
	my $class;
	
	if Opcode::isa($object, 'P6object') {
		$class := Opcode::getattribute($object.HOW, 'parrotclass');
	}
	else {
		$class := Opcode::typeof($object);
	}
	
	return $class;
}

sub signature(@types) {
	my @sig_names;
	
	for @types {
		my $type := ~ $_;
		my $type_sig := $type eq '_'
			?? $type
			!! "['" ~ $type.split('::').join(q<';'>) ~ "']";
		@sig_names.push($type_sig);
	}

	return @sig_names.join(", ");
}

sub trampoline($namespace, $name, :$target, 
	:@actions?, :$adverbs?, :$is_method?) 
{
	NOTE("Building trampoline [", $namespace, "::", $name, "] -> ", $target);
	NOTE("is_method? ", $is_method);
	NOTE("With adverbs: ", $adverbs);

	unless +@actions {
		@actions := Array::empty();
		my $target_nsp := $namespace;
		
		if ! Opcode::isa($target, 'String') {
			my @parts := $target.get_namespace.get_name;
			@parts.shift;
			$target_nsp := @parts.join('::');
		
			if $target_nsp ne $namespace {
				my $load_p0 := "\t"
					~ '$P0 = get_hll_global ';	
				$load_p0 := $load_p0
					~ "[ '" 
					~ @parts.join(q<' ; '>)
					~ "' ], '"
					~ $target
					~ "'";
				
				@actions.push($load_p0);
				$target := '$P0';
			}
		}
		else {
			$target := "'" ~ $target ~ "'";
		}
		
		@actions.push(
			"\t" ~ ".tailcall " ~ $target
				~ "("
				~ ($is_method ?? 'self, ' !! '')
				~ "pos :flat, adv :flat :named)"
		);
		
	}
	
	my @code := Array::new(
		".namespace [ '" 
			~ $namespace.split('::').join(q<' ; '>)
			~ "' ]",
		".sub '" ~ $name ~ "' " ~ $adverbs,
		"\t" ~ ".param pmc pos :slurpy",
		"\t" ~ ".param pmc adv :slurpy :named",
	);
	
	for @actions {
		@code.push("\t" ~ $_);
	}

	@code.push(
		".end",
	);
	
	my $trampoline := @code.join("\n");
	NOTE("Trampoline is:\n", $trampoline);
	Pir::compile($trampoline);
	NOTE("Trampoline compiled okay.");
}	

### Moved to P6object.nqp

sub get_meta() {
	our $meta;
	
	unless Opcode::defined($meta) {
		$meta := Opcode::new('P6metaclass');
	}

	return $meta;
}
