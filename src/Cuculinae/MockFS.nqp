# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Provides a Mock FileSystem to avoid IO during testing.
class Cuculus::MockFS;

has	%!volumes;
has	$!cwd;
has	@!cwd_path;

has	$!user_id;
has	%!user_groups;

INIT {
	Parrot::define_multisub('exists', :method, :starting_with('exists'));
}

my method _chdir($child) {
	unless $!cwd.contains( $child ) {
		# throw an exception
	}
	
	@!cwd_path.push: $!cwd;
	$!cwd := $!cwd{$child};
}

our method chdir($path) {
	if $path.isa( 'String' ) {
		$path := Path.new: $path;
	}
	elsif ! $path.isa( Path ) {
		die( "Don't know how to chdir to a(n) ", 
			pir::typeof__SP($path), 
			". Use a String or Path");
	}
	
	# Figure out where cwd should be pointing - relative or absolute
	
	if $path.is_absolute {
		die( "Don't know how to CD absolute yet.");
		
		my $volume := $path.volume;
		@!cwd_path := [ ];
		
		@!cwd_path.push: $volume;
	}
	else {
		for $path.directories -> $subdir {
			self._chdir( $subdir );
		}
	}
}

our method cwd() {
	Path.new(|@!cwd_path, :filesystem(self));
}


our method directory_separator() { '/' }

our method exists__Path($path) {
	$!file.exists( ~ $path );
}

our method exists__String($path) {
	self.exists( Path.new($path) );
}

our method exists__ANY($ignored) {
	die( "Don't know how to check if ", pir::typeof__SP($ignored), " exists. Use a String or Path");
}

my method _init_obj(*@pos, *%named) {
	%!volumes<> := Hash.new;
	$!cwd := %!volumes<>;
	@!cwd_path := [ '' ];
	
	self._init_args(|@pos, |%named);
}

our method mkpath($path) {
	
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
