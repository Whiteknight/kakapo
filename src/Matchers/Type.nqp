# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Evaluates match in TrueFalse context
module Matcher::Type;

has $!class;

INIT {
	Kakapo::depends_on(|<
		Matcher 
		Matcher::Factory
	>);
}

sub _initload() {
	extends(	Matcher );
	has(		'$!class' );
	auto_accessors( :private );
	
	Matcher::Factory::export_sub(Matcher::Type::factory, :as('type'));
}

our method describe_failure( $previous, $item ) {
	$previous ~ "had type '{ self.describe_type: pir::class__pp($item) }'";
}

our method describe_self( $previous = '' ) {
	$previous 
		~ "an object with type "
		~ self.describe_type: $!class;
}

my method describe_type($type) {
	if pir::isa( $type, 'P6protoobject' ) {
		$type := P6metaclass.get_parrotclass: $type;
	}
	
	if pir::isa( $type, 'Class' ) {
		$type.get_namespace.string_name;
	}
	elsif pir::isa( $type, 'NameSpace' ) {
		$type.string_name;
	}
	elsif pir::isa( $type, 'String' ) {
		$type;
	}
	else {
		die( "Don't know how to describe a class given as a { pir::typeof__sp($type) }" );
	}
}

sub factory($class) {
	Matcher::Type.new: :class( $class );
}

our method matches($item) {
	pir::isa( $item, self.class );
}