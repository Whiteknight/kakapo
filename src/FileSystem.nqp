# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Provides a conventional framework for program execution. 
class FileSystem;

has	$!file;
has	$!os;

INIT {
	Parrot::define_multisub('exists', :method, :starting_with('exists'));
}

our method chdir($path = '') {
	$path := ~$path;
	$!os.chdir($path);
}

our method cwd() {
	$!os.cwd;
}

our method directory_separator() { '/' }

our method exists__Path($path) {
	$!file.exists( ~ $path );
}

our method exists__String($path) {
	$!file.exists($path);
}

our method exists__ANY($ignored) {
	die( "Don't know how to check if ", pir::typeof__SP($ignored), " exists. Use a String or Path");
}

my method _init_obj(*@pos, *%named) {
	$!file := pir::new__PS( 'File' );
	$!os := pir::new__PS( 'OS' );
	
	self._init_args(|@pos, |%named);
}

our method instance($value?) {
	if $value.defined {
		our $_Instance := $value;
	}
	elsif ! our $_Instance.defined {
		$_Instance := self.new;
	}
	else {
		$_Instance;
	}
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

our method slurp($path, *%named) {
	%named<mode> := 'r';
	my $fh := self.open($path, |%named);
	my $slurp := $fh.readall;
	$fh.close;
	$slurp;
}

our method volume_separator() { ':' }
