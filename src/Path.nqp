# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Abstract representation of filesystem entries.
class Path; 

INIT {
	our %_Osname_class_map := Hash.new(
		:DEFAULT(	Path::Unix),
		:linux(	Path::Unix),
	);
}

method get_osname_map() {
	our %_Osname_class_map;
}

method _init_obj(*@pos, *%named) {
	my %map := self.get_osname_map();
	my $osname := %*VM<osname>;
	
	$osname := 'DEFAULT' 
		unless %map.contains: $osname;

	my $class := %map{$osname};
	my $obj := $class.new( |@pos, |%named );	# NB: Returns a different type than Path.
	$obj;
}

class Path::Unix
	is Path;

has	@!elements;
has	$!filesystem;
has	$!volume;
has	$!is_relative;
has	$!initialized;

INIT {
	auto_accessors(:private);
	
	Parrot::define_multisub( <append>, :method, :starting_with( <append> ));
	Parrot::define_multisub( <append>, [ Path::Unix::append__String ], :method, :signatures( [ < _ string > ]));
}

our method absolute($bool = 1)		{ $!is_relative := ! $bool; }

my method append__ANY($element, :$dynamic) {
	die( "Can't use a ", pir::typeof__SP($element), " as part of a Path - use a String or Path instead.");
}

my method append__Path($element, :$dynamic = 0) {

	unless $!initialized {
		$!initialized := $element.initialized;
		$!is_relative := $element.is_relative;
		$!volume := $element.volume;
	}
		
	$dynamic
		?? @!elements.push: $element 
		!! @!elements.append( $element.elements );
	
	self;
}

# Scenario:  "x" -> [ 'x' ], :relative
# Scenario: "/x" -> [ '', 'x' ] -> ['x'] :absolute
# Scenario: "x/" -> [ 'x', '' ] -> [ 'x' ] :relative
# Scenario: "" -> [ '' ] -> [ ] :absolute (confused with /)

my method append__String($element, :$dynamic = 0) {
	die( "Cannot use :dynamic with a String, only a Path argument" )
		if $dynamic;

	my @parts := $element.split: self.directory_separator;

	# If this $element is first one, it determines $!is_relative.
	unless $!initialized {
		$!initialized := 1;
		if @parts[0] eq '' {
			@parts.shift;
			$!is_relative := 0;
		}
		else {
			$!is_relative := 1;
		}
	}
	
	# Take care of trailing /:  "foo/" -> [ 'foo', '' ]
	my $last := @parts.pop;
	
	@parts.push: $last
		unless $last eq '';
		
	@!elements.append: @parts;
	
	self;
}

our method directory_separator()	{ '/'; }

our method elements() {
	my @result := [ ];

	for @!elements -> $elt {
		if $elt.isa: <String> {
			@result.push: $elt;
		}
		else {
			@result.append: $elt.elements;
		}
	}

	@result;
}

our method exists()			{ $!filesystem.exists(self); }

# NB: This is called by the 'get_string' vtable provided by P6object
method get_string() {
	my $slash := self.directory_separator;
	
	self.is_absolute
		?? $!volume ~ $slash ~ self.elements.join: $slash
		!! self.elements.join: $slash;
}

my method _init_obj(*@parts, :$dynamic = 0, *%named) {
	@!elements := @!elements;	
	$!filesystem := $*FileSystem;
	$!initialized := 0;
	$!is_relative := 1;
	$!volume := '';
	
	self._init_args(|%named);

	for @parts -> $part {
		self.append($part, :dynamic($dynamic && $part.isa: 'Path'));
	}

	self;
}

our method is_absolute() {
	if @!elements.elems == 0 || @!elements[0].isa('String') {
		! $!is_relative;
	}
	else {
		@!elements[0].is_absolute;
	}
}

our method is_relative() {
	if @!elements.elems == 0 || @!elements[0].isa('String') {
		$!is_relative;
	}
	else {
		@!elements[0].is_relative;
	}
}

our method relative($bool = 1)		{ $!is_relative := $bool; }

############## Stuff that is delegated to filesystem
#~ our method is_directory()	{ self.exists && self._stat_query(2); }
#~ our method is_device()	{ self.exists && self._stat_query(3); }
#~ our method is_file()		{ self.exists && get_file().is_file(self._complete); }
#~ our method is_link()		{ self.exists && get_file.is_link(self._complete); }
#~ our method modify_time()	{ self._stat_query(6); }
#~ our method size()		{ self._stat_query(1); }
#~ our method access_time()	{ self._stat_query(5); }
#~ our method backup_time()	{ self._stat_query(8); }
#~ our method change_time()	{ self._stat_query(7); }
#~ our method create_time()	{ self._stat_query(4); }
#~ my method _stat_query($index) {	# $index
	#~ pir::stat__ISI(self._complete, $index);
#~ }
#~ our method gid()		{ self._stat_query(10); }
#~ our method uid()		{ self._stat_query(9); }
our method open(*%named) {
	$!filesystem.open(self, |%named);
}

our method slurp(*%named) {
	$!filesystem.slurp(self, |%named);
}



#~ class Path::Cwd;

#~ my method _complete() {
	#~ '.';
#~ }
