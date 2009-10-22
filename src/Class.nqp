# $Id:  $

module Class {
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;

		Parrot::load_bytecode('P6object.pir');
		Dumper::_ONLOAD();
		Parrot::IMPORT('Dumper');
		
		our %Class_info := Hash::empty();
	}
		
	################################################################

	sub IS_A($object, $type) {
		return $object.HOW.isa($object, $type);
	}

	sub capture_namespace($nsp) {
		my %sub_addrs := Hash::empty();
		
		for $nsp {
			my $name := ~ $_;
			my $addr := Parrot::get_address_of($nsp{$_});
			%sub_addrs{$name} := $addr;
		}
		
		return %sub_addrs;
	}
	
	sub check_namespace(%before, %after) {
		my %seen;
		
		for Hash::sorted_keys(%before) {
			if Hash::exists(%after, ~ $_) {
				if %before{$_} != %after{$_} {
					say("Object '", $_, "' has different address: ",
						%before{$_}, " -> ", %after{$_});
				}
			}
			else {
				say("Object '", $_, "' has been removed");
			}
			
			%seen{$_} := 1;
		}
		
		for Hash::sorted_keys(%after) {
			unless %seen{$_} {
				say("Object '", $_, "' was added");
			}
		}
	}
	
	sub NEW_CLASS($class_name) {
		my $class_info := _class_info($class_name);
		
		if $class_info<created> {
			DIE("Class '", $class_name, "' already created.");
		}
		
		$class_info<created> := 1;
		my $new_class := get_meta().new_class($class_name);
		return $new_class;
	}

	sub SUBCLASS($class_name, *@parents) {
		my $class_info := _class_info($class_name);
		
		if $class_info<created> {
			DIE("Class '", $class_name, "' already created.");
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

		NOTE("Running _ONLOAD method of all parents");
		for @parents {
			NOTE($_);
			call_onload_of_class($_);
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

	sub already_created($name) {
		our %already_created;
		return %already_created{$name}++;
	}

	sub call_method($object, $method, *@args, *%opts) {
		return call_method_($object, $method, @args, %opts);
	}

	sub call_method_($object, $method, @args, %opts) {
		my $result := Q:PIR {
			.local pmc object, meth, args, opts
			object	= find_lex '$object'
			meth	= find_lex '$method'
			args	= find_lex '@args'
			opts	= find_lex '%opts'
			
			$I0 = isa meth, 'Sub'
			unless $I0 goto call_string
			
			%r = object.meth(args :flat, opts :named :flat)
			goto done
			
		call_string:
			$S0 = meth
			%r = object.$S0(args :flat, opts :named :flat)
			
		done:
		};
		
		return $result;
	}

	sub call_onload_of_class($class) {
		my $classname := ~ $class;

		if $classname[-1] eq ')' {
			$classname := String::substr($classname, 0, -2);
		}
		
		my $sub_name := ~ $classname ~ '::_ONLOAD';
		my &onload := Parrot::get_sub($sub_name);
	
		if &onload {
			&onload();
			NOTE("Onload-ed: ", $classname);
		}
		else {
			NOTE("No onload sub for: ", $classname);
		}
	}

	sub _class_info($class_name) {
		our %Class_info;
		
		unless %Class_info{$class_name} {
			%Class_info{$class_name} := Hash::new();
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
		
		while Parrot::isa($default_method, 'MultiSub') {
			NOTE("I don't think nesting multisubs is possible, but...");
			$default_method := $default_method[0];
		}

		my @actions;
		
		unless $default_method {
			@actions.push(
				"die 'No method available that will accept the parameters given'",
			);
		}
	
		compile_multi($class_name, $multi_name,
			:actions(@actions),
			:is_method($is_method),
			:target($default_method),
		);
	}
	
=sub compile_multi

Creates a multi-sub trampoline that invokes a given NQP function. When invoked 
as `compile_multi('My::Class', 'foo', 'Parameter::Class', 'handler_method')` the
generated trampoline looks like:

    .namespace [ 'My' ; 'Class' ]
    .sub 'foo' :method :multi(_, [ 'Parameter' ; 'Class' ])
        .param pmc positionals :slurpy
        .param pmc named :named :slurpy
        .tailcall 'handler_method'(self, positionals :flat, named :named :flat)
    .end

But multimethod names block inherited multimethods, so a "default" multi
has to be created that forwards calls to any parent class multimethods. Per
pmichaud, a multi() or multi(_) (on self) will do the trick. So first check if 
the default exists already, and if not, then check if the parent(s*) name
resolves. 

=cut

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
	
	sub dispatch_method($object, %dispatch, @args, %opts) {
		my $type;
		NOTE("Dispatching method of ", $object, " based on type of first arg.");
		DUMP($object, %dispatch, @args, %opts);
		
		if +@args {
			$type := Class::name_of(@args[0], :delimiter(''));
		}
		else {
			$type := 'NULLARY';
		}
		
		unless my $method_name := %dispatch{$type} {
			$method_name := %dispatch<DEFAULT>;
		}
		
		ASSERT($method_name, 
			'Unable to dispatch method for type ', $type);

		return call_method_($object, $method_name, @args, %opts);
	}

	sub find_class_named($class_name) {
		my $class := Parrot::get_class($class_name);
		
		unless Parrot::defined($class) {
			$class := Parrot::get_class(
				Parrot::get_namespace($class_name)
			);
		}
		
		return $class;
	}
	
	sub find_method_named($class, $method) {
		if Parrot::isa($class, 'String') {
			NOTE("Got class name: ", $class);
			$class := find_class_named($class);
		}
		elsif ! Parrot::isa($class, 'Class') {
			NOTE("Got object PMC: ", $class);
			$class := Parrot::typeof($class);
			NOTE("Resolved to Class PMC: ", $class);
		}
		else {
			NOTE("Got Class PMC: ", $class);
		}
		
		my $result := $class.find_method($method);
		return $result;
	}
	
	sub get_meta() {
		our $meta;
		
		unless Parrot::defined($meta) {
			$meta := Q:PIR { %r = new 'P6metaclass' };
		}

		return $meta;
	}

	sub get_method_list($obj) {
		my $class := Class::of($obj);

		unless Parrot::defined($class) {
			die("No class. Don't know what to do.");
		}

		my @methods := $class.methods.keys;
		return @methods;
	}
	
	sub multi_method($class_name, $multi_name, :$starting_with) {
		multi_sub($class_name, $multi_name, 
			:starting_with($starting_with), :is_method(1));
	}
	
	sub multi_sub($class_name, $multi_name, :$starting_with, :$is_method?) {
		my $kind := $is_method ?? 'multimethod' !! 'multisub';
		
		NOTE("Creating new ", $kind, " '", $multi_name, 
			"' for class ", $class_name,
			", out of methods starting with ", 
			$starting_with);
		
		my $class_info := _class_info($class_name);
		unless $class_info<created> {
			DIE("Class '", $class_name, "' has not been created yet.");
		}
		
		DUMP($class_info);
		
		my $nsp := Parrot::get_namespace($class_name);
		my $prefix_len := $starting_with.length;
		
		unless Parrot::defined($class_info<multisubs>{$multi_name}) {
			Class::compile_default_multi($class_name, 
				$multi_name, :is_method($is_method));
		}

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
			get_meta().add_method($class_name, $multi_name, $multi_sub);
		}
		
		NOTE("done");
	}
	
	sub name_of($object, :$delimiter?) {
		unless Parrot::defined($delimiter) {
			$delimiter := '::';
		}
		
		my $class := ~ Class::of($object);
		$class := $class.split(';').join($delimiter);
		return $class;
	}

	sub of($object) {
		my $class;
		
		if Parrot::isa($object, 'P6object') {
			$class := Parrot::get_attribute($object.HOW, 'parrotclass');
		}
		else {
			$class := Parrot::typeof($object);
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
			
			if ! Parrot::isa($target, 'String') {
				my @parts := $target.get_namespace.get_name;
				@parts.shift;
				$target_nsp := @parts.join('::');
			
				if $target_nsp ne $namespace {
					my $load_p0 := "\t"
						~ "$P0 = get_hll_global ";	
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
		
		@code.append(@actions);
		@code.push(
			".end",
		);
		
		my $trampoline := @code.join("\n");
		NOTE("Trampoline is:\n", $trampoline);
		Parrot::compile($trampoline);
		NOTE("Trampoline compiled okay.");
	}	
}

################################################################

module Class::ArrayBased {
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;

		Parrot::IMPORT('Dumper');
		#Class::SUBCLASS('Class::ArrayBased', 'Array', 'Class::BaseBehavior');
	}
	
	method init(@children, %attributes) {
		DIE("NOT IMPLEMENTED. This class is but a shell.");
	}

}

################################################################

module Class::BaseBehavior {

	our @empty;
	
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;

		my $get_bool := "
.namespace [ 'Class' ; 'BaseBehavior' ]
.sub '__get_bool' :vtable('get_bool') :method
	$I0 = self.'get_bool'()
	.return ($I0)
.end";
		Parrot::compile($get_bool);
		
		my $get_string := "
.namespace [ 'Class' ; 'BaseBehavior' ]
.sub '__get_string' :vtable('get_string') :method
	$S0 = self.'get_string'()
	.return ($S0)
.end";
		Parrot::compile($get_string);
		
		Parrot::IMPORT('Dumper');
		Class::NEW_CLASS('Class::BaseBehavior');
	}

	method _ABSTRACT_METHOD() {
		DIE("A subclass must override this abstract method.");
	}
	
	method _ATTR($name, @value)	{ self._ABSTRACT_METHOD(); }
	
	method _ATTR_ARRAY($name, @value) {
		my $result := self._ATTR($name, @value);
		
		if ! Parrot::defined($result) {
			$result := self._ATTR($name, 
				Array::new(Array::empty()) # Not @empty!
			);
		}
		
		return $result;
	}

	method _ATTR_DEFAULT($name, @value, $default) {
		my $result := self._ATTR($name, @value);
		
		if ! Parrot::defined($result) {
			$result := self._ATTR($name,
				Array::new($default)
			);
		}
		
		return $result;
	}
	
	method _ATTR_CONST($name, @value) {
		if +@value && Parrot::defined(
			self._ATTR($name, @empty)) {
			DIE("You cannot reset the value of the '", $name, "' attribute.");
		}
		
		return self._ATTR($name, @value);
	}
	
	method _ATTR_HASH($name, @value) {
		my $result := self._ATTR($name, @value);
		
		if ! Parrot::defined($result) {
			$result := self._ATTR($name, 
				Array::new(Hash::empty())
			);
		}
		
		return $result;
	}

	method _ATTR_SETBY($name, $method_name) {
		my $result := self._ATTR($name, @empty);
		
		if ! Parrot::defined($result) {
			Class::call_method(self, $method_name);
			$result := self._ATTR($name, @empty);
		}
		
		return $result;
	}

	method get_bool() {
		return 1;
	}

	method get_string() {
		return Class::name_of(self) ~ ' @' ~ Parrot::get_address_of(self);
	}
	
	method init(@children, %attributes) {
		for %attributes {
			NOTE("Setting attribute: '", ~$_, "'");
			Class::call_method(self, ~$_, %attributes{$_});
		}
	}
	
	method isa($type) {
		return self.HOW.isa(self, $type);
	}

	method new(*@children, *%attributes) {
		my $class := Parrot::get_attribute(self.HOW, 'parrotclass');
		my $new_object := Parrot::new_pmc($class);
		
		# NB: I'm not flattening the params, because that forces
		# everybody to do call_method or in-line pir to pass
		# along flat args.
		$new_object.init(@children, %attributes);
		return $new_object;
	}
}

################################################################

module Class::HashBased {
	_ONLOAD();
	
	sub _ONLOAD() {
		if our $onload_done { return 0; }
		$onload_done := 1;

		Parrot::IMPORT('Dumper');
		Class::SUBCLASS('Class::HashBased',
			'Class::BaseBehavior',
			'Hash');
	}

	# override abstract Class::BaseBehavior::_ATTR
	method _ATTR($name, @value) {
		if +@value {
			self{$name} := @value[0];
		}
		
		return self{$name};
	}
	
	method __dump($dumper, $label) {
		my $subindent;
		my $indent;

		# (subindent, indent) = dumper."newIndent"()
		Q:PIR {
			.local string indent, subindent
			$P0 = find_lex '$dumper'
			(subindent, indent) = $P0.'newIndent'()
			$P0 = box subindent
			store_lex '$subindent', $P0
			$P0 = box indent
			store_lex '$indent', $P0
		};
		
		my $brace := '{';
		
		my @keys;
		
		# Remember that for HashBased, self is a Hash.
		for self {
			@keys.push(~$_);
		}
		
		@keys.sort;
		
		for @keys {
			print($brace, "\n", $subindent);
			$brace := '';
			
			my $key	:= ~ $_;			
			my $val	:= self{$key};
		
			print("<", $key, "> => ");
			$dumper.dump($label, $val);
		}
		
		# my $index := 0;
		# my $num_elements := +@(self);

		# while $index < $num_elements {
			# print($brace, "\n", $subindent);
			# $brace := '';
			
			# my $val	:= self[$index];
			
			# print("[", $index, "] => ");
			# $dumper.dump($label, $val);
			
			# $index++;
		# }
		
		if $brace {
			print("(no attributes set)");
		} 
		else {
			print("\n", $indent, '}');
		}
		
		$dumper.deleteIndent();
	}
}
