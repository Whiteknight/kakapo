# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module P6object;

# Special sub called when the Kakapo library is loaded or initialized. This is to guarantee 
# this module is available during :init and :load processing for other modules.
sub _pre_initload() {

	Pir::compile_sub(:name('__get_bool'), :vtable('get_bool'),
		:namespace('Kakapo::Object'),
		:body(
			'$I0= self."get_bool"()',
			'.return ($I0)',
		),
	);
	
	Pir::compile_sub(:name('__get_string'), :vtable('get_string'),
		:namespace('Kakapo::Object'),
		:body(
			'$S0 = self."get_string"()',
			'.return ($S0)',
		),
	);
}

=begin

=head1 P6object - the root of the P6/NQP class hierarchy.

P6object is added automatically as the parent class of any class that is 
set up using the C< P6metaclass > C< .register > method. (By default: all 
classes.)

Thus, methods on this class correspond roughly to the C< UNIVERSAL >
methods from P5.

=item sub onload()  I<(standard)>

Sets up the C< P6protoobject >, C< P6object >, and 
C< P6metaclass > classes. Creates protoobjects for 
C< P6object > and C< P6metaclass >.

=item method __ABSTRACT__()

Sugar. Throws an AbstractMethodCalled exception.

=end

method __ABSTRACT__() {
	Exception::AbstractMethodCalled.new().throw;
	exit_code, message, severity, type
}

=begin

=item method HOW()  I<(standard)>

Returns the L<P6metaclass> of the invocant. 

=item PROTOOVERRIDES()  I<(standard)>

Returns a list of methods to be overridden in the I< protoobjects > for 
the class.  The methods defined (or imported) in the Foo::Bar namespace whose 
names are returned in the C< PROTOOVERRIDES > list will replace any standard
proto-object methods with the same name provided by the P6object library.

By default, the list returned consists solely of the method C< new >. Thus,
any C< new > method defined in the C< class > or C< module > block will
supersede the default C< new > method provided by the P6object library.

(Note that if you don't provide a replacement C< new > method, the default one 
gets used. Returning a name in the C< PROTOOVERRIDES > list I< allows >, but 
does not I< require > replacing a method.)

=item method WHAT()  I<(standard)>

Return the L<P6protoobject> for the invocant. The protoobject is the object 
the lives under the C<Foo::Bar> class name . Calling C< Foo::Bar.new() >actually
looks up the C< Foo::Bar > object (a protoobject) and runs it's C< .new > method.

=item method WHERE()  I<(standard)>

Returns the memory address of the invocant. (Useful for identity tests.)

=item method WHO()  I<(standard)>

Returns the package for the invocant. That is, the namespace where the 
proto-object lives. For example, objects of class C< Foo::Bar > have a 
protoobject C< Foo::Bar > (of type P6protoobject) that belongs to a 
I<namespace> (a different PMC type) also called C< Foo::Bar >.

=end
method IDONTKNOW() {
	return Undef.new;
}

method WHY() {
}

method BECAUSE() {
}

method TODAY() {
}

method TOMORROW() {
}

method IDONTGIVEADARN() {
}

method clone() {
	pir::clone__PP(self);
}

method defined() {
# returns true. (Overridden for the Undef PMC type.)
	return 1;
}

method __dump($dumper, $label) {
	my @results		:= Parrot::call_tuple_method($dumper, 'newIndent');
	my $subindent	:= "\n" ~ @results.shift;
	my $indent		:= @results.shift;
	my $brace		:= '{';

	my $class := Opcode::class(self);
	my %attributes := $class.inspect('attributes');
	
	say("Attributes: ");
	if +%attributes {
		for %attributes {
			print($brace, $subindent);
			$brace := '';
			
			my $attr := ~ $_;
			my $value := Opcode::getattribute(self, $attr);
		
			print($attr, ' => ');
			$dumper.dump($label, $value);
		}
		
		print("\n", $indent, '}');
	}
	else {
		print("(no attributes set)");
	} 
	
	$dumper.deleteIndent();
}

method get_bool() {
# returns true.
	return 1;
}

method get_string() {
# Returns a perl5-style object class+address.
	return Class::name_of(self) ~ ' @' ~ self.WHERE;
}

method _init_(@pos, %named) {
	# First, set up the default data
	# ...
	
	# Accept args.
	self._init_args_(@pos, %named);
}

method _init_args_(@pos, %named) {
	self._init_named_(%named);
	self._init_positional_(@pos);
}

method _init_named_(%named) {	
	for %named {
		my $name := ~ $_;
		
		if Opcode::can(self, $name) {
			Parrot::call_method(self, $name, %named{$name});
		}
		else {
			Program::die("No accessor defined for attribute '", $name, "'.");
		}
	}
}

method _init_positional_(@pos) {
	if +@pos {
		Program::die("Don't know what to do with positional parameters. Define your own 'init_' method to handle them.");
	}
}

method isa($type) {
	return self.HOW.isa(self, $type);
}

method new(*@pos, *%named) {
	my $class := Opcode::getattribute(self.HOW, 'parrotclass');
	my $new_object := pir::new__PP($class);

	# NB: I'm not flattening the params, because that forces
	# everybody to do call_method or in-line pir to pass
	# along flat args.
	$new_object._init_(@pos, %named);
	return $new_object;
}
