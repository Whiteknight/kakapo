# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Class::BaseBehavior;
#	Common methods for Class::*Based

our @No_args;

sub _pre_initload() {
# Special sub called when the Kakapo library is loaded or initialized. This is to guarantee 
# this module is available during :init and :load processing for other modules.

	Global::use('Dumper');
	
	@No_args := Array::new();

	my $get_bool := '
.namespace [ "Class" ; "BaseBehavior" ]
.sub "__get_bool" :vtable("get_bool") :method
	$I0 = self."get_bool"()
	.return ($I0)
.end';

	Pir::compile($get_bool);
	
	my $get_string := '
.namespace [ "Class" ; "BaseBehavior" ]
.sub "__get_string" :vtable("get_string") :method
	$S0 = self."get_string"()
	.return ($S0)
.end';
	Pir::compile($get_string);
	
	Class::NEW_CLASS('Class::BaseBehavior');
}

method _ABSTRACT_METHOD() {
	DIE("A subclass must override this abstract method.");
}

method _ATTR($name, @value)	{ self._ABSTRACT_METHOD(); }

method _ATTR_ARRAY($name, @value) {
	my $result := self._ATTR($name, @value);
	
	if ! Opcode::defined($result) {
		$result := self._ATTR($name, 
			Array::new(Array::new())
		);
	}
	
	return $result;
}

method _ATTR_DEFAULT($name, @value, $default) {
	my $result := self._ATTR($name, @value);
	
	if ! Opcode::defined($result) {
		$result := self._ATTR($name,
			Array::new($default)
		);
	}
	
	return $result;
}

method _ATTR_CONST($name, @value) {
	if +@value && Opcode::defined(
		self._ATTR($name, @No_args)) {
		DIE("You cannot reset the value of the '", $name, "' attribute.");
	}
	
	return self._ATTR($name, @value);
}

method _ATTR_HASH($name, @value) {
	my $result := self._ATTR($name, @value);
	
	if ! Opcode::defined($result) {
		$result := self._ATTR($name, 
			Array::new(Hash::empty())
		);
	}
	
	return $result;
}

method _ATTR_SETBY($name, $method_name) {
	my $result := self._ATTR($name, @No_args);
	
	if ! Opcode::defined($result) {
		Parrot::call_method(self, $method_name);
		$result := self._ATTR($name, @No_args);
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
		Parrot::call_method(self, ~$_, %attributes{$_});
	}
}

method isa($type) {
	return self.HOW.isa(self, $type);
}

method new(*@children, *%attributes) {
	my $class := Opcode::getattribute(self.HOW, 'parrotclass');
	my $new_object := Opcode::new($class);
	
	# NB: I'm not flattening the params, because that forces
	# everybody to do call_method or in-line pir to pass
	# along flat args.
	$new_object.init(@children, %attributes);
	return $new_object;
}
