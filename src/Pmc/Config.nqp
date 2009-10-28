# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Config;
=module
	Wrapper for config.pbc, a generated file containing Parrot configuration data.
=cut 

Global::use(Dumper);

sub _get_pmc() {
	our $_Pmc;

	unless Opcode::defined($_Pmc) {
		$_Pmc := Q:PIR {
			load_bytecode "config.pbc"
			%r = _config()
		};		
	}
	
	DUMP($_Pmc);
	return $_Pmc;
}

sub query($key) {
	NOTE("Querying for Config setting: '", $key, "'");
	my $result := _get_pmc(){$key};
	DUMP($result);
	return $result;
}