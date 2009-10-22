# $Id: File.nqp 171 2009-10-04 19:18:10Z austin_hastings@yahoo.com $
class File;

Parrot::IMPORT('Dumper');
	
################################################################

our $_Pmc;

sub _get_pmc() {
	unless Parrot::defined($_Pmc) {
		$_Pmc := Q:PIR {
			%r = root_new [ 'parrot' ; 'File' ]
		};
	}
	
	return $_Pmc;
}

sub copy($from, $to) {
	_get_pmc().copy($from, $to);
}

sub exists($path) {
	return _get_pmc().exists($path);
}

sub find_all($path, @search_list) {
	NOTE("Finding all paths matching '", $path, "' in ", +@search_list, " directories");
	my @results := Array::empty();
	
	if String::char_at($path, 0) eq '/' {
		NOTE("Path is rooted - not using search paths");
		@search_list := Array::new('');
	}
	else {
		$path := '/' ~ $path;
	}
	
	for @search_list {
		my $name := $_ ~ $path;
		NOTE("Trying ", $name);
		
		if exists($name) {
			NOTE("Success! it's a match");
			@results.push($name);
		}
	}
	
	NOTE("Found ", +@results, " results");
	DUMP(@results);
	return @results;
}
			
sub find_first($path, @search_list) {
	return find_all($path, @search_list)[0];
}

sub is_dir($path) {
	return _get_pmc().is_dir($path);
}

sub is_file($path) {
	return _get_pmc().is_file($path);
}

sub is_link($path) {
	return _get_pmc().is_link($path);
}

sub rename($from, $to) {
	_get_pmc().rename($from, $to);
}

sub slurp($path) {
	NOTE("Slurping contents of file: ", $path);
	
	my $data := Q:PIR {
		$P0 = new 'FileHandle'
		$P1 = find_lex '$path'
		$S0 = $P0.'readall'($P1)
		%r = box $S0
	};
	
	NOTE("done");
	DUMP($data);
	return $data;
}
