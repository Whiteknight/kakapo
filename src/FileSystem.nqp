# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Provides a conventional framework for program execution.
class FileSystem;

INIT {
	our %_Osname_class_map := Hash.new(
		:DEFAULT(	FileSystem::Unix),
		:linux(	FileSystem::Unix),
	);

	Kakapo::initload_done();
}

method get_osname_map() {
	our %_Osname_class_map;
}

method _init_obj(*@pos, *%named) {
	my %map := self.get_osname_map();
	my $osname := 'DEFAULT';
        try {
            my $tmp := %*VM<osname>;
            $osname := $tmp if %map.contains: $tmp;

            # if not, whatever. Keep it at DEFAULT
            CATCH { }
        }

	my $class := %map{$osname};
	my $obj := $class.new( |@pos, |%named );	# NB: Returns a different type than Path.
	$obj;
}

our method instance($value?) {
	if $value.defined {
		our $_Instance := $value;
	}
	elsif ! our $_Instance.defined {
		self.instance: self.new;
	}

	$_Instance;
}

class FileSystem::Unix
	is FileSystem;

has	$!file;
has	$!os;

INIT {
	use(	Parrot::Unix::Stat );

	my @multisubs := [ <exists> ];

	for @multisubs -> $name {
		Parrot::define_multisub($name, :method, :starting_with($name));

		my $string_sub := Parrot::get_hll_global( "FileSystem::Unix::{$name}__String" );
		unless is_null( $string_sub ) {
			Parrot::define_multisub($name, [ $string_sub ], signatures => [ <_ string> ] );
		}
	}
}

our method chdir($path = '') {
	$!os.chdir( ~ $path);
}

our method cwd() {
	$!os.cwd;
}

our method directory_separator() { '/' }

my method exists__Path($path) {
	$!file.exists( ~ $path );
}

my method exists__String($path) {
	$!file.exists($path);
}

my method exists__ANY($ignored) {
	die( "Don't know how to check if ", pir::typeof__SP($ignored), " exists. Use a String or Path");
}

our method get_contents($path, *%named) {
	my $contents;

	if self.is_file: $path {
		%named<mode> := 'r';
		my $fh := self.open($path, |%named);
		$contents := $fh.readall;
		$fh.close;
	}
	elsif self.is_directory: $path {
		$contents := $!os.readdir: ~$path;
	}
	else {
		# What to do?
		die("Don't know how to get contents of non-file, non-directory: $path");
	}

	$contents;
}

my method _init_obj(*@pos, *%named) {
	$!file := pir::new__PS( 'File' );
	$!os := pir::new__PS( 'OS' );

	self._init_args(|@pos, |%named);
}

our method is_device($path) {
	my @stat := $!os.stat( ~$path );
	my $mode := @stat[2];
	S_ISBLK($mode) || S_ISCHR($mode) || S_ISFIFO($mode) || S_ISSOCK($mode);
}

our method is_directory($path) {
	my @stat := $!os.stat( ~$path );
	S_ISDIR(@stat[2]);
}

our method is_file($path) {
	my @stat := $!os.stat( ~$path );
	S_ISREG(@stat[2]);
}

our method is_link($path) {
	my @stat := $!os.lstat( ~$path );
	S_ISLNK(@stat[2]);
}

our method open($path, *%named) {

	my $fh	:= pir::new__PS('FileHandle');
	my $mode	:= '' ~ %named<mode> // 'r';

	$fh.open(~ $path, $mode);

	# Not a loop because of prefix ops (+, ~)
	$fh.buffer_size( +%named<buffer_size> )
		if %named.contains( <buffer_size> );
	$fh.buffer_type( ~%named<buffer_type> )
		if %named.contains( <buffer_type> );
	$fh.encoding( ~%named<encoding> )
		if %named.contains( <encoding> );

	$fh;
}

our method volume_separator() { ':' }
