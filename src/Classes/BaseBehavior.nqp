module Class::BaseBehavior;

our @no_args := Array::empty();

_ONLOAD();

sub _ONLOAD() {
	if our $Onload_done { return 0; }
	$Onload_done := 1;

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
	
	Global::use('Dumper');
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
			Array::new(Array::empty())
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
		self._ATTR($name, @no_args)) {
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
	my $result := self._ATTR($name, @no_args);
	
	if ! Parrot::defined($result) {
		Class::call_method(self, $method_name);
		$result := self._ATTR($name, @no_args);
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
