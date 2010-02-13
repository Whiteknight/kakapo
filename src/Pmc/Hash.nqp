# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Hash;
# Provides some extra methods for Hash, plus some convenient creator subs.

method contains($key) {
	my $result := Q:PIR {
		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		$I0 = exists $P0[$P1]
		%r = box $I0
	};
	
	return $result;
}

method defined()			{ 1 }

method delete($key) {
	Q:PIR {
		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		delete $P0[$P1]
	};
}

sub elements(%hash) {
	my %results := Q:PIR {
		$P0 = find_lex '%hash'
		$I0 = elements $P0
		%r = box $I0
	};
	
	return %results;
}

sub empty() {
	my %empty;
	return %empty;
}

sub exists(%hash, $key) {
	my $result;
	
	if %hash {
		$result := %hash.contains($key);
	}
	else {
		$result := 0;
	}
	
	return $result;	
}

method keys() {
	my @keys := Array::empty();
	
	for self {
		@keys.push(~ $_);
	}
	
	return @keys;
}

sub merge(%first, *@hashes, :%into?, :$use_last?) {
	
	@hashes.unshift(%first);	# Ensure at least one element.

	unless Opcode::defined(%into) {
		%into := @hashes.shift();
		
		unless Opcode::defined(%into) {
			%into := Hash::new();
		}
	}
	
	my %stored := %into;
	
	if $use_last {
		@hashes := Array::reverse(@hashes);
		%stored := Hash::empty();
	}

	for @hashes {
		my $hash := $_;
		for $hash {
			unless Hash::exists(%stored, $_) {
				# Order matters, %stored may alias %into
				%into{$_} := 
				%stored{$_} := $hash{$_};
			}
		}
	}
	
	return %into;
}

sub merge_keys(%first, *@hashes, :@keys!, :%into?, :$use_last?) {
	@hashes.unshift(%first);
	
	unless Opcode::defined(%into) {
		%into := @hashes.shift();
		
		unless Opcode::defined(%into) {
			%into := Hash::new();
		}
	}
	
	my %stored := %into;
	
	if $use_last {
		@hashes := Array::reverse(@hashes);
		%stored := Hash::empty();
	}
	
	for @hashes {
		my $hash := $_;
		
		for @keys {
			if ! Hash::exists(%stored, $_) && Hash::exists($hash, $_) {
				%into{$_} := 
				%stored{$_} := $hash{$_};
			}
		}
	}
	
	return %into;
}

sub new(*@pos, *%pairs) {
	if +@pos {
		my $message := 'Invalid call to Hash::new with positional args.';
		
		if Opcode::isa(@pos[0], 'NameSpace') {
			$message := $message ~ ' '
				~ 'Likely a call to ' 
				~ @pos[0].get_name.join('::')
				~ '.new() - before class was created';
		}

		Dumper::DUMP_(@pos, 'positional args to Hash::new');
		Program::die($message);
	}

	return %pairs;
}

sub sorted_keys(%hash) {
	return %hash.keys.sort;
}
