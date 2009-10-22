# $Id: Config.nqp 185 2009-10-19 02:14:23Z austin_hastings@yahoo.com $

module Slam::Config;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;

	Parrot::IMPORT('Dumper');
	
	Class::SUBCLASS('Slam::Config',
		'Class::HashBased');	
	
	# Store an instance in the Registry
	my $config := Slam::Config.new();
	Registry<CONFIG> := $config;
	
	#$config.store('Dump::File::slurp', 1);
	
	$config.store('Dump::Slam::Config::_onload', 0);
	#$config.store('Dump::Slam::Config::file', 1);
	$config.store('Dump::Slam::Config::parse_config', 0);
	$config.store('Dump::Slam::Config::query', 0);
	#$config.store('Dump::Slam::Config::store', 1);
	$config.store('Dump::Parrot::defined', 7);
	
	$config.store('Dump::Stack::Root', 'parrot::close::Compiler::main');
	
	NOTE("Slam::Config::_onload: done");
}
		
################################################################

method file($filename?) {
	
	if $filename && self<_filename> ne $filename {
		NOTE("Reading filename: ", $filename);
		my $data := File::slurp($filename);
		self<_data> := Hash::empty();
		self.parse_config($data);
		self<_filename> := $filename;
		DUMP(self);
	}
	
	return self<_filename>;
}

method init(@children, %attributes) {
	self<_filename> := '<no filename set>';
	
	# There is no parent .init
	return self;
}

method parse_config($data) {
	my @lines := $data.split("\n");
	DUMP(@lines);
	
	my $line_number := 0;
	for @lines {
		$line_number++;
		NOTE(substr("    " ~ $line_number, -4), ": ", $_);
		
		my $line := String::trim($_);
		
		if $line && $line[0] ne '#' {
			my @kv := $line.split('=');
			my $key := String::trim(@kv.shift);
			
			if String::length($key) == 0 {
				say("Warning: in file '", self<_filename>,
					"', line #", $line_number,
					": zero-length keys are not allowed.");
				say($line);
			}
			else {
				
				my $value := String::trim(@kv.join('='));
				
				NOTE("Key:	", $key);
				NOTE("Value:	", $value);
				
				self.store($key, $value);
			}
		}
	}
	
	DUMP(self);
}

method query(*@keys) {
	my $key := @keys.join('::');
	NOTE('Querying for key: ', $key);
	
	my $value := self<_data>{$key};
	NOTE("Value: ", $value);
	
	return $value;
}

method store($key, $value) {
	NOTE("Slam::Config: Storing key '", $key, "' value: ", $value);
	return self<_data>{$key} := $value;
}