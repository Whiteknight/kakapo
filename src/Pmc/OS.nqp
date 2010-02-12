# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module OS;
# Wrapper for OS PMC type.

sub _get_pmc() {
	our $_Pmc;

	unless Opcode::defined($_Pmc) {
		$_Pmc := Q:PIR {
			%r = root_new [ 'parrot' ; 'OS' ]
		};
	}
	
	return $_Pmc;
}

sub chdir($path) {
	_get_pmc().chdir($path);
}

sub chroot($path) {
	return _get_pmc().chroot($path);
}

sub cwd() {
	return _get_pmc().cwd();
}

sub link($from, $to) {
	_get_pmc().link($from, $to);
}

sub lstat($path) {
	return _get_pmc().lstat($path);
}

sub mkdir($path, $mode) {
	_get_pmc().mkdir($path, $mode);
}

sub readdir($path) {
	return _get_pmc().readdir($path);
}

sub rename($oldpath, $newpath) {
	return _get_pmc().rename($oldpath, $newpath);
}

sub rm($path) {
	_get_pmc().rm($path);
}

sub stat($path) {
	return _get_pmc().stat($path);
}

sub symlink($from, $to) {
	_get_pmc().symlink($from, $to);
}

# This isn't provided by the OS object, but where else should it go?
sub time() {
	my $result := Q:PIR {
		$N0 = time
		%r = box $N0
	};
	return $result;
}

sub umask($mask) {
	return _get_pmc().umask($mask);
}
