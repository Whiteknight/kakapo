# $Id:  $

module Config;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
}


sub DUMPold(*@pos, *%what) {
	my @info := Dumper::info();
	@info[0] and Dumper::DUMPold(@info, @pos, %what);
}

sub NOTEold(*@parts) {
	my @info := Dumper::info();
	@info[0] and Dumper::NOTEold(@info, @parts);
}

################################################################

our $_Pmc;

sub _get_pmc() {
	unless Parrot::defined($_Pmc) {
		$_Pmc := Q:PIR {
			load_bytecode "config.pbc"
			%r = _config()
		};		
	}
	
	DUMPold($_Pmc);
	return $_Pmc;
}

sub query($key) {
	NOTEold("Querying for Config setting: '", $key, "'");
	my $result := _get_pmc(){$key};
	DUMPold($result);
	return $result;
}