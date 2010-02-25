# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.
=begin

=NAME Hash - Adds subs and methods to the Hash PMC namespace.

=DESCRIPTION

This is a collection of subs and methods that add common functionality to 
Hashes in NQP. In many cases, the code acts as a bridge between the NQP
sub/method syntax and PIR opcodes. 


=SYNOPSIS

=begin code

    %pies := Hash.new( :apple(1), :blueberry(2), :cherry(3) );

    unless %pies.contains('rhubarb') { ... }	

    if %pies.defined { ... }			

    %pies.delete('cherry');			

    $number_of_pies := %pies.elements;	

    @pies := %pies.keys;

    %all_pies := Hash.merge(%good_pies, %bad_pies);

    %all_pies.merge(%more_pies);

=end code
=end

module Hash;

=begin
=METHODS

=item contains($key) returns Boolean

The C< .contains > method returns true (1) if the key exists in the Hash, 
fales (0) otherwise. Note that there is no guarantee about the value stored
in the Hash - it may be any value, including C< null >.

=for code
	if %hash.contains('null') { ... }

=end

our method contains($key) {
	Q:PIR {
		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		$I0 = exists $P0[$P1]
		%r = box $I0
	};
}

=begin
=item delete($key) returns self

The C< delete > method deletes the C< $key > from the Hash. If C< $key > is
not a valid entry, nothing happens. Returns C< self > for method chaining.

=for code
	%week.delete('Wednesday');

=end

our method delete($key) {
	Q:PIR {
		%r  = find_lex 'self'
		$P1 = find_lex '$key'
		delete %r[$P1]
	};
}

our method elements() {
	pir::elements__IP(self);
}

our method keys() {
	my @keys := Array::empty();
	
	for self {
		@keys.push(~ $_);
	}
	
	@keys;
}

=begin
=item merge

FIXME: This becomes a synonym for .new.

=end

sub merge(%first, *@hashes, :%into?, :$use_last?) {
	
	@hashes.unshift(%first);	# Ensure at least one element.

	unless Opcode::defined(%into) {
		%into := @hashes.shift();
		
		unless Opcode::defined(%into) {
			%into := Hash.new();
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

=begin
=item merge_keys

FIXME: Merge this sub with .merge( :keys )

=end

sub merge_keys(%first, *@hashes, :@keys!, :%into?, :$use_last?) {
	@hashes.unshift(%first);
	
	unless Opcode::defined(%into) {
		%into := @hashes.shift();
		
		unless Opcode::defined(%into) {
			%into := Hash.new();
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

=begin
=item new( [ %hash, ... ], [ :key(value), ... ] ) return Hash

The new method creates and returns a Hash. If no arguments are specified, an
empty hash is returned. If positional arguments are given, they must also be
Hashes. The entries are merged from left to right (right-most values dominate)
into the new hash. If named parameters are provided, they are added to the
new hash I< after > the positional hashes are merged. Effectively, the 
positional hashes are default values.

=for code
    my %dictionary := Hash.new(%defaults, :one('uno'), :two('dos'));

=end

our method new(*@pos, *%pairs) {
	if +@pos {
		my $message := 'Invalid call to Hash.new with positional args.';
		
		if Opcode::isa(@pos[0], 'NameSpace') {
			$message := $message ~ ' '
				~ 'Likely a call to (Hash-based) ' 
				~ @pos[0].get_name.join('::')
				~ '.new() - before class was created';
		}

		pir::die($message);
	}

	%pairs;
}
