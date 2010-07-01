# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Provides access to low-level functions of the Parrot VM.
module Parrot;

sub _pre_initload() {
	Global::inject_root_symbol(Parrot::is_null);
	Global::inject_root_symbol(Parrot::isa);
}

# NB: index defaults to 1, and create_key adds 1, for '2', because the default is 1 higher than
# the sub that *called* this sub. (foo() calls bar() calls caller(), caller returns 'foo')
sub caller($index? = 1) {
	my $key := Key::create_key('sub', 1 + $index);
	my &sub := pir::getinterp__P(){$key};
}

# NB: index defaults to 1, and create_key adds 1, for '2', because the default is 1 higher than
# the sub that *called* this sub. (foo() calls bar() calls caller(), caller returns 'foo')
sub caller_namespace($index? = 1) {
	my $key := Key::create_key('namespace', $index + 1);
	my $nsp := pir::getinterp__P(){$key};
}

sub call_method($object, $method_name, *@args, *%opts) {
	call_method_($object, $method_name, @args, %opts);
}

# Calls method C< $method_name > with flattened arglist C< @args > and flattened
# options C< %opts >. Returns the result of the method call.
sub call_method_($object, $method_name, @args?, %opts?) {

	Q:PIR {
		.local pmc object, meth, args, opts
		object	= find_lex '$object'
		meth	= find_lex '$method_name'
		args	= find_lex '@args'
		opts	= find_lex '%opts'

		$I0 = isa meth, 'Sub'
		unless $I0 goto call_string

		.tailcall object.meth(args :flat, opts :named :flat)

	call_string:
		$S0 = meth
		.tailcall object.$S0(args :flat, opts :named :flat)
	};
}

sub call_tuple_method($object, $method, *@args, *%opts) {
	call_tuple_method_($object, $method, @args, %opts);
}

# Calls method C< $method_name > with flattened arglist C< @args > and flattened
# options C< %opts >. Returns an RPA with the tuple returned by the method.
sub call_tuple_method_($object, $method, @args?, %opts?) {

	Q:PIR {
		.local pmc object, meth, args, opts
		object	= find_lex '$object'
		meth	= find_lex '$method'
		args	= find_lex '@args'
		opts	= find_lex '%opts'

		$I0 = isa meth, 'Sub'
		unless $I0 goto call_string

		( $P0 :slurpy ) = object.meth(args :flat, opts :named :flat)
		.return ($P0)

	call_string:
		$S0 = meth
		( $P0 :slurpy ) = object.$S0(args :flat, opts :named :flat)
		.return ($P0)
	};
}

sub call_sub($sub_name, *@args, *%opts) {
	return call_sub_($sub_name, @args, %opts);
}

sub call_sub_($sub_name, @args, %opts) {
# Calls sub C< $sub_name > with flattened arglist C< @args > and flattened options C< %opts >.
# Returns the result of the sub call.

	Q:PIR {
		.local pmc sub, args, opts
		sub	= find_lex '$sub_name'
		args 	= find_lex '@args'
		opts	= find_lex '%opts'

		$I0 = isa sub, 'Sub'
		if $I0 goto call_sub

		$S0 = sub
		sub = find_sub_not_null $S0

	call_sub:
		.tailcall sub(args :flat, opts :named :flat)
	};
}

sub call_tuple_sub($sub, *@args, *%opts) {
	call_tuple_sub_($sub, @args, %opts);
}

sub call_tuple_sub_($sub, @args?, %opts?) {
# Calls sub C< $sub > with flattened arglist C< @args > and flattened
# options C< %opts >. Returns an RPA with the tuple returned by the sub.

	unless Opcode::defined(@args)	{ @args := Array::new(); }
	unless Opcode::defined(%opts)	{ %opts := Hash::empty(); }

	Q:PIR {
		.local pmc sub, args, opts
		sub	= find_lex '$sub'
		args	= find_lex '@args'
		opts	= find_lex '%opts'

		$I0 = isa sub, 'Sub'
		if $I0 goto call_sub

		$S0 = sub
		sub = find_sub_not_null $S0

	call_sub:
		( $P0 :slurpy ) = sub(args :flat, opts :named :flat)
		.return ($P0)
	};
}

sub get_address_of($what) {
	return Opcode::get_addr($what);
}

# Return a global object by name.
sub get_hll_global($path) {
	if $path.isa('String') {
		$path := $path.split('::');
	}

	unless pir::does__IPS($path, 'array') {
		die("$path parameter must be a ::string or array of strings, not: ", $path);
	}

	my $name := $path.pop;
	my $key := key_($path);

	$key.defined
		?? pir::get_hll_global__PPS($key, $name)
		!! pir::get_hll_global__PS($name);
}

# Return a namespace relative to the HLL root namespace.
#
# If no C< $path > is specified, returns the HLL root namespace. Otherwise, fetches
# the namespace identified by C< $path >, which can either be a string in A::B::C
# format, or a key. (See L< key() >, below.)

sub get_hll_namespace($path?) {

	my $result;

	if pir::defined__IP($path) {
		if pir::isa__IPS($path, 'String') {
			$path := key_(pir::split__PSS('::', $path));
		}

		$result := pir::get_hll_namespace__PP($path);
	}
	else {
		$result := pir::get_hll_namespace__P();
	}

	$result;
}

sub get_self() {
	my $self := pir::find_dynamic_lex__PS('self');

	if pir::isnull($self) {
		pir::die("Fatal: No 'self' lexical in any caller scope");
	}

	return $self;
}

sub get_sub($path, :$caller_nsp?) {
	my @parts := $path.split('::');
	my $name := @parts.pop;
	my &sub;

	if +@parts == 0 {	# Check in caller nsp
		unless $caller_nsp { $caller_nsp := caller_namespace(2); }

		&sub := $caller_nsp.find_sub($name);

		if Opcode::defined(&sub) {
			return &sub;
		}
	}

	my $namespace := Opcode::get_hll_namespace(@parts);

	if $namespace {
		&sub := $namespace.find_sub($name);
	}

	return &sub;
}

sub isa($obj, $class) {
	if pir::isa__IPS($class, 'P6protoobject') {
		$class := P6metaclass.get_parrotclass($class);
	}
	elsif pir::isa__IPS($class, 'String') {
		$class := $class.split('::');

		if pir::elements__IP($class) == 1 {
			$class := $class.shift;
		}
	}

	pir::isa__IPP($obj, $class);
}

sub is_null($obj) {
	pir::isnull__IP($obj);
}

sub key($first, *@parts) {
	@parts.unshift($first);
	key_(@parts);
}

sub key_(@parts) {
	my $key;

	for @parts {
		my $element := $_;
		Q:PIR {
			.local pmc segment
			segment = new [ 'Key' ]

			.local pmc element
			element = find_lex '$element'

			$I0 = isa element, 'Integer'
			unless $I0 goto not_Integer
			$I0 = element
			segment = $I0
			goto have_key

		not_Integer:

			$I0 = isa element, 'Float'
			unless $I0 goto not_Float
			$N0 = element
			segment = $N0
			goto have_key

		not_Float:

			$I0 = isa element, 'String'
			unless $I0 goto not_String
			$S0 = element
			segment = $S0
			goto have_key

		not_String:
			die "Invalid PMC type passed to Parrot::key"

		have_key:
			.local pmc key
			key = find_lex '$key'

			$I0 = isa key, 'Key'
			unless $I0 goto set_key
			push key, segment
			goto done

		set_key:
			key = segment
			store_lex '$key', key

		done:
		};
	}

	$key;
}

sub macro_const( $namespace = caller_namespace(), :@TAGS, *%named ) {
	for %named -> $macro {
		my $name := $macro.key;

		die("Cannot define macro $name in namespace {$namespace.string_name} - a symbol with that name already exists")
			if $namespace.contains( $name );

		$namespace.add_var($name, $macro.value);
	}
}

sub namespace_name($nsp) {
	pir::isa($nsp, 'String')
		?? $nsp
		!! $nsp.string_name;
}

sub new($pmc, %args?) {
	my $key := Key.new(|$pmc.split('::'));

	%args.elems == 0
		?? pir::new__PP($key)
		!! pir::new__PPP($key, %args);
}

sub qualified_name($x, :$namespace = caller_namespace(2)) {
	if pir::isa__IPS($x, 'P6protoobject') {
		$x := $x.WHO;			# namespace
	}
	elsif pir::isa__IPS($x, 'Class') || pir::isa__IPS($x, 'PMCProxy') {
		$x := $x.get_namespace;		# namespace
	}

	## break

	if pir::isa__IPS($x, 'NameSpace') {
		$x := $x.get_name.join('::');
	}
	elsif pir::isa__IPS($x, 'String') {
		if pir::split('::', $x) > 1 {
			# keep it
		}
		else {
			my @temp := pir::split(';', $x);

			if @temp == 1 {
				@temp := $namespace.get_name;
				@temp.push($x);
			}

			$x := @temp.join('::');
		}
	}
	elsif pir::isa__IPS($x, 'Sub') {	# includes MultiSubs
		my @temp := $x.get_namespace.get_name;
		@temp.push( ~$x );
		$x := @temp.join('::');
	}
	else {
		my $type := pir::typeof__SP($x);
		die("Don't know how to make qualified name from $type: $x");
	}

	$x;
}

# Return a global object by name.
sub set_hll_global($path, $value) {
	if $path.isa('String') {
		$path := $path.split('::');
	}

	unless pir::does__IPS($path, 'array') {
		die("$path parameter must be a ::string or array of strings, not: ", $path);
	}

	my $name := $path.pop;
	my $key := key_($path);

	$key.defined
		?? pir::set_hll_global__vPSP($key, $name, $value)
		!! pir::set_hll_global__vSP($name, $value);
}
