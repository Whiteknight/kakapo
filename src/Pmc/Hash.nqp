# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# =NAME Hash - Adds subs and methods to the Hash PMC namespace.
#
# =DESCRIPTION
#
# This is a collection of subs and methods that add common functionality to 
# Hashes in NQP. In many cases, the code acts as a bridge between the NQP
# sub/method syntax and PIR opcodes. 
#
# =SYNOPSIS
#
#	 %pies := Hash.new( :apple(1), :blueberry(2), :cherry(3) );
#
#	 unless %pies.contains('rhubarb') { ... }	
#
#	 if %pies.defined { ... }			
#
#	 %pies.delete('cherry');			
#
#	 $number_of_pies := %pies.elems;	
#
#	 @pies := %pies.keys;
#
#	 %all_pies := Hash.merge(%good_pies, %bad_pies);
#
#	 %all_pies.merge(%more_pies);

module Pmc::Hash;

sub _pre_initload() {
	Global::inject_root_symbol( Pmc::Hash::hash );
	
	unless pir::isa( Parrot::get_hll_global( <Hash> ), 'P6protoobject' ) {
		P6metaclass.register: <Hash>;
	}
	
	my $hash_nsp := pir::get_hll_namespace__pp( pir::split__pss('::', 'Hash') );
	my $hash_pmc := $hash_nsp.get_class;

say("Initializing Hash namespace");
	my $nsp := pir::get_namespace__p();
	my &new := $nsp.get_method: 'new';
	$hash_nsp.install_method: 'new', &new;
	$nsp.export_methods_to: <Hash>;
	$nsp.export_to: $hash_nsp, [<merge_keys> ];	
}

# Returns true (1) if `$key` exists in the Hash. Returns false (0) otherwise. 
# Note that there is no guarantee about the value stored in the Hash - it may 
# be any value, including `null`.
#
# Example:
#	if %week.contains: <Sunday> { ... }

our method contains($key) {
	Q:PIR {
		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		$I0 = exists $P0[$P1]
		%r = box $I0
	};
}

# Deletes the `$key` from the Hash. If `$key` is not an entry, nothing happens. 
#
# Returns `self` for method chaining.
#
# Example:
#    %week.delete: <Wednesday>;

our method delete($key) {
	Q:PIR {
		$P0 = find_lex '$key'
		delete self[$P0]
	};

	self;
}

# Returns the number of elements in the Hash.
# 
# Example:
#   $num_days := %week.elems;

our method elems() {
	pir::elements__IP(self);
}

our method exists($key) {
	self.contains($key);
}

our method grep(&match) {
	my %matches;
	
	for self {
		%matches{$_.key} := $_.value
			if &match($_);
	}
	
	%matches;
}

sub hash(*%hash) {
	%hash;
}

our method keys() {
	my @keys;
	
	for self {
		@keys.push($_.key);
	}
	
	@keys;
}

our method kv() {
	my @kv;
	
	for self {
		@kv.push($_.key);
		@kv.push($_.value);
	}
	
	@kv;
}

our method map(&match) {
	my %result;
	
	for self {
		%result{$_.key} := &match($_);
	}
	
	%result;
}

=begin
=item merge

FIXME: This becomes a synonym for .new.

=end

method merge(*@hashes, :%into = self, :$priority = 'left') {
	
	if ! pir::isa(self, 'P6protoobject') {
		@hashes.unshift: self;
	}
	elsif @hashes.elems == 0 {
		die("You must provide at least one real hash to .merge()");
	}

	# %stored may alias %into if and ONLY if the values in %into will take
	# precedent over other values. In that case, if %into has a key then don't
	# bother merging that key. But if %into's values may be replaced, %stored
	# has to be separated.
	my %stored := %into;
	
	if $priority eq 'right' {
		@hashes.reverse;
		%stored := Hash.new;
	}

	for @hashes -> $hash {
		for $hash {
			my $key := $_.key;
			
			unless %stored.contains( $key ) {
				# BEWARE: %stored =?= %into =?= $hash aliases
				%into{ $key } := %stored{ $key } := $_.value;
			}
		}
	}
	
	%into;
}

# =item merge_keys
#
# FIXME: Merge this sub with .merge( :keys )
#

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

# NB: This is a lie. The positionals are errors, for now, because catching the errors
# is more valuable than the merge constructor.

# The new method creates and returns a Hash. If no arguments are specified, an
# empty hash is returned. If positional arguments are given, they must also be
# Hashes. The entries are merged from left to right (right-most values dominate)
# into the new hash. If named parameters are provided, they are added to the
# new hash I< after > the positional hashes are merged. Effectively, the 
# positional hashes are default values.
#
# Example:
#     my %defaults := Hash.new:   one => '1', two => '2', three => '3';
#     my %dictionary := Hash.new(%defaults, :one('uno'), :two('dos'));

our method new(*@pos, *%pairs) {
	if +@pos {
		my $message := 'Invalid call to Hash.new with positional args.';

		if pir::isa__IPS(@pos[0], 'NameSpace') {
			$message := $message
				~ ' Likely a call to {@pos[0].string_name}.new() - before class was created';
		}

		_dumper(@pos, %pairs);
		pir::die($message);
	}

	%pairs;
}

# Returns an array of the values stored in the Hash. There is _no_ ordering 
# imposed.

our method values() {
	my @values;
	
	for self {
		@values.push($_.value);
	}
	
	@values;
}