# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module P6object;

# Special sub called when the Kakapo library is loaded or initialized. This is to guarantee 
# this module is available during :init and :load processing for other modules.
sub _pre_initload() {

	Pir::compile_sub(:name('__get_bool'), :vtable('get_bool'),
		:namespace('P6object'),
		:body(
			'$I0= self."get_bool"()',
			'.return ($I0)',
		),
	);
	
	Pir::compile_sub(:name('__get_string'), :vtable('get_string'),
		:namespace('P6object'),
		:body(
			'$S0 = self."get_string"()',
			'.return ($S0)',
		),
	);
}

# # P6object - the root of the P6/NQP class hierarchy. #
#
# P6object is added automatically as the parent class of any class that is set up using the 
# `.register` method of `P6metaclass`. (By default: all classes.)
#
# Thus, methods on this class correspond roughly to the `UNIVERSAL` methods from P5.
#
#  * `sub onload()` _(standard)_
#
#   Sets up the `P6protoobject`, `P6object`, and `P6metaclass` classes. Creates protoobjects for 
# `P6object` and `P6metaclass`.
#
#  * `__ABSTRACT__()`
# 
#    Sugar. Throws an AbstractMethodCalled exception.

method __ABSTRACT__() {
	my $name := ~ Parrot::caller();
	Exception::AbstractMethodCalled.new(
		:message("Invalid call to abstract method '$name'"),
	).throw;
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

method SUPER($method, *@pos, *%named) {
	self.SUPER_($method, @pos, %named);
}

method SUPER_($method, @pos, %named) {
	#my $class := self.HOW.get_parrotclass;
	my $class := pir::class__PP(self);
	my @mro := $class.inspect('all_parents');
	
	if @mro == 1 {
		die("Call to 'super' on object with no parent classes");
	}
	
	my $parent := @mro[1];
	my &sub := $parent.find_method($method);

	if pir::isnull(&sub) {
		Exception::MethodNotFound.new(:message("Method '$method' not found")).throw;
	}
	
	Parrot::call_method_(self, &sub, @pos, %named);
	
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
	my $indent		:= "\n" ~ @results.shift;
	my $brace		:= '{';
	my $empty		:= '';
	
	my $class := Opcode::class(self);
	my @mro := $class.inspect('all_parents');
	my $attributes_set := 0;
	
	for @mro {
		my $parent := $_;
		my @attributes := $parent.attributes.keys;
		
		if +@attributes {
			print($brace);
			$brace := $empty;
			
			my $class_name := $parent.get_namespace.get_name.join('::');
			unless $_ =:= $class {
				print($subindent, '# -- from ', $class_name);
			}
			
			$attributes_set := $attributes_set + +@attributes;
			@attributes.sort;

			for @attributes {
				my $attr := ~ $_;
				my $value := pir::getattribute__PPPS(self, $parent, $attr);
				print($subindent, $attr, ' => ');
				$dumper.dump($label, $value);
				print(',');
				
				CATCH {
					say("\n*** Bad attribute: $attr (from $class_name): $!");
				}
			}
		}
	}
	
	if $attributes_set {
		print($indent, '}');
	}
	else {
		print("(no attributes set)");
	} 
	
	$dumper.deleteIndent();
}

method get_bool() {
	1;
}

method get_string() {
# Returns a perl5-style object class+address.
	Class::name_of(self) ~ ' @' ~ self.WHERE;
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
			pir::die("Accessor not found for attribute '$name'.");
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
	self.new_(@pos, %named);
}

method new_(@pos, %named) {
	my $class := Opcode::getattribute(self.HOW, 'parrotclass');
	my $new_object := pir::new__PP($class);

	$new_object._init_(@pos, %named);
	$new_object;
}
