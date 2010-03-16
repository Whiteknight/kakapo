# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Abstract representation of filesystem entries.
class Path;

has	$!filesystem;
has	$!volume;
has	$!base_path;
has	@!directories;
has 	$!filename;

	#~ basename
	#~ dirname
	#~ compose
	#~ is_relative
	#~ is_absolute
	#~ open
	#~ get_contents

our method access_time()	{ self._stat_query(5); }
our method backup_time()	{ self._stat_query(8); }
our method change_time()	{ self._stat_query(7); }
our method create_time()	{ self._stat_query(4); }

my method _complete() {
	my $complete;
	my $slash := self.name_separator;
	
	if self.is_relative {
		$complete := $!base_path._complete ~ $slash;
	}
	else {
		$complete := self.root;
	}
	
	$complete := $complete ~ @!directories.join($slash);
	
	$complete := $complete ~ $slash ~ $!filename
		if $!filename;
		
	$complete;
}

our method exists()		{ $!filesystem.exists(self); }

our method filename($value?)	{ $value.defined ?? ($!filename := $value) !! $!filename; }
our method filesystem($value?)	{ $value.defined ?? ($!filesystem := $value) !! $!filesystem; }

sub _get_file() {
	unless our $_File {
		$_File := pir::new__PS('File');
	}
	
	$_File;
}

# NB: This is called by the 'get_string' vtable.
method get_string() {
	self._complete;
}

our method gid()		{ self._stat_query(10); }

method _init_obj(*@pos, *%named) {
	%named<filesystem> := FileSystem.instance()
		unless %named<filesystem>;
	$!volume := '';
	@!directories := @!directories;
	$!filename := '';

	self._init_args(|%named);
	
	# Needs to be after %named, because that inits filesystem, etc.
	self.parse_path(|@pos) if @pos.elems;
	self;
}

our method is_absolute()	{ ! $!base_path.defined; }
our method is_directory()	{ self.exists && self._stat_query(2); }
our method is_device()	{ self.exists && self._stat_query(3); }
our method is_file()		{ self.exists && get_file().is_file(self._complete); }
our method is_link()		{ self.exists && get_file.is_link(self._complete); }
our method is_relative()	{ $!base_path.defined; }
our method modify_time()	{ self._stat_query(6); }

my method name_separator()	{ '/'; }

method parse_path(*@parts) {
	my $complete := @parts.shift;
	
	if $complete.isa( Path ) {
		$!base_path := $complete;
		$complete := @parts.shift;
	}
	
	die( "Don't know how to handle multiple parts" )
		if @parts > 1;
	
	@!directories := $complete.split(self.name_separator);	
	
	if $complete.length != 0 && $complete[0] eq self.name_separator {	# absolute
		$!base_path := my $undef;
		@!directories.shift;
	}
	else {
		$!base_path := Path::Cwd;
	}
	
	unless self.is_directory {
		$!filename := @!directories.pop;
	}
}

method path_separator()	{ ':'; }

# Needs to return volume, etc, on dos/win/vms.
method root() {
	'/';
}

our method size()		{ self._stat_query(1); }
our method slurp()	{ $!filesystem.slurp(~ self); }

my method _stat_query($index) {	# $index
	pir::stat__ISI(self._complete, $index);
}

our method uid()		{ self._stat_query(9); }
our method volume($value?)	{ $value.defined ?? ($!volume := $value) !! $!volume; }

class Path::Cwd;

my method _complete() {
	'.';
}
