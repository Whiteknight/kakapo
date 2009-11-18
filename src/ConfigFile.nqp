# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module ConfigFile;
# Queryable config settings file, must like Properties in Java.

use('Dumper');

Class::SUBCLASS('ConfigFile',
	'Class::HashBased');	

# Create a Global for config data.
my $config := ConfigFile.new();
Global::register_global('$Kakapo_config', $config);

#$config.store('Dump::File::slurp', 1);

$config.store('Dump::ConfigFile::_onload', 0);
#$config.store('Dump::ConfigFile::file', 1);
$config.store('Dump::ConfigFile::parse_config', 0);
$config.store('Dump::ConfigFile::query', 0);
#$config.store('Dump::ConfigFile::store', 1);
$config.store('Dump::Opcode::defined', 7);

#$config.store('Dump::Stack::Root', 'parrot::Testcase::_ONLOAD');

NOTE("ConfigFile::_onload: done");

method file($filename?) {
# Gets or sets the file used by this object. If no C< $filename > is given, just 
# returns the current filename. Else, if the specified filename is different from
# the current one, the new file is read in, parsed, and replaces the current
# config data.

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

method init(@args, %opts) {
# New object initialization method, called by C< .new() >.

	self<_filename> := '<no filename set>';
	
	# There is no parent .init
	return self;
}

method parse_config($data) {
# Parses a string C< $data > containing the 'config file' contents. Blank lines 
# and lines beginning with '#' are ignored, other lines are processed as 
# key = value pairs.

	my @lines := $data.split("\n");
	DUMP(@lines);
	
	my $line_number := 0;
	for @lines {
		$line_number++;
		NOTE(("    " ~ $line_number).substr(-4), ": ", $_);
		
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
# Looks up the entry indicated by joining the various C<@keys> with '::'. That 
# is, C< query('A', 'B') > looks up the config entry stored as 'A::B'.

	my $key := @keys.join('::');
	NOTE('Querying for key: ', $key);
	
	my $value := self<_data>{$key};
	NOTE("Value: ", $value);
	
	return $value;
}

method store($key, $value) {
# Stores the given C< $value > for C< $key >.

	NOTE("ConfigFile: Storing key '", $key, "' value: ", $value);
	return self<_data>{$key} := $value;
}