# $Id: Array.nqp 183 2009-10-19 00:53:58Z austin_hastings@yahoo.com $

module Array;

our %Bsearch_compare_func;

_ONLOAD(); 

sub _ONLOAD() {
	Parrot::IMPORT('Dumper');

	%Bsearch_compare_func{'<=>'}	:= Array::cmp_numeric;
	%Bsearch_compare_func{'R<=>'}	:= Array::cmp_numeric_R;
	%Bsearch_compare_func{'cmp'}	:= Array::cmp_string;
	%Bsearch_compare_func{'Rcmp'}	:= Array::cmp_string_R;

}

sub cmp_numeric($a, $b) { return $b - $a; }
sub cmp_numeric_R($a, $b) { return $a - $b; }
sub cmp_string($a, $b) { if $a lt $b { return -1; } else { return 1; } }
sub cmp_string_R($a, $b) { if $b lt $a { return -1; } else { return 1; } }

=sub bsearch(@array, $value, ...)

Binary searches for C<$value> in C<@array>, using a selectable comparison 
function. 

The adverbs C<:low(#)> and C<:high(#)> may be specified to search within a subset
of C<@array>.

The adverb C<:cmp(val)> may be specified to select a comparison function. A
user-provided function may be passed as the value to C<:cmp()>, or a string may
be given to choose one of the following default comparison functions:

=item C<< <=> >> - numeric ascending order

=item C<< R<=> >> - numeric descending (reversed) order

=item C<cmp> - string ascending order

=item C<Rcmp> - string descending (reversed) order

If a user-provided function is passed in, it must accept two arguments,
and return some value less than zero if the first argument would appear earlier 
in C<@array> than the second argument.

If the C<$value> is found, returns the index corresponding to the 
value. Otherwise, returns a negative value, V, such that (-V) - 1
is the index where C<$value> would be inserted. These shenanigans
are required because there is no "negative zero" to indicate insertion
at the start of the array.

=cut

sub bsearch(@array, $value, *%adverbs) {
	DUMP(:array(@array));
	NOTE("bsearch: for value ", $value);
	my $low := 0 + %adverbs<low>;

	if $low < 0 {
		$low := $low + @array;
	}
	
	NOTE("low end: ", $low);
	
	my $high := +@array + %adverbs<high>;
	
	if $high > +@array {
		$high := %adverbs<high>;
	}

	NOTE("high end: ", $high);
	
	my $top := $high;
	
	my $cmp := '==';
	
	if %adverbs<cmp> {
		$cmp := %adverbs<cmp>;
	}
	
	my &compare := %Bsearch_compare_func{$cmp};
	unless &compare {
		&compare := %adverbs<cmp>;
	}
	
	NOTE("Compare function is: ", &compare);
	
	my $mid;
	while $low < $high {
		# NQP gets this wrong -- floating point math
		#$mid := $low + ($high - $low) / 2;
		$mid := Q:PIR {
			.local int high, low
			$P0 = find_lex '$high'
			high = $P0
			$P0 = find_lex '$low'
			low = $P0
			$I0 = high - low
			$I0 = $I0 / 2
			$I0 = $I0 + low
			%r = box $I0
		};	
		
		if &compare($value, @array[$mid]) < 0 {
			$low := $mid + 1;
		}
		else {
			$high := $mid;
		}
	}
	
	my $result := - ($low + 1);
	
	if $low < $top
		&& &compare(@array[$mid], $value) == 0 {
		$result := $low;
	}
	
	NOTE("Returning ", $result);
	return $result;
}

sub clone(@original) {
	my @clone := Array::empty();
	
	if +@original {
		for @original {
			@clone.push($_);
		}
	}
	
	return @clone;
}

sub concat(*@sources) {
	my @result := empty();
	
	for @sources {
		for $_ {
			@result.push($_);
		}
	}
	
	return @result;
}
	
method contains($item) {
	for self {
		if $_ =:= $item {
			return 1;
		}
	}
	
	return 0;
}

sub delete(@array, $index) {
	Q:PIR {
		$P0 = find_lex '@array'
		$P1 = find_lex '$index'
		$I0 = $P1
		delete $P0[$I0]
	};
}

sub empty() {
	my @empty := Q:PIR { %r = new 'ResizablePMCArray' };
	return @empty;
}

sub join($_delim, @parts) {
	BACKTRACE();
	my $result := '';
	my $delim := '';

	for @parts {
		$result := $result ~ $delim ~ $_;
		$delim := $_delim;
	}

	return $result;
}

sub new(*@elements) {
	return @elements;
}

sub reverse(@original) {
	my @result := empty();
	
	for @original {
		@result.unshift($_);
	}
	
	return @result;
}

sub unique(@original) {
	my @result := Array::empty();
	
	for @original {
		my $o := $_;
		my $found := 0;
		
		for @result {
			if  $o =:= $_ {
				$found := 1;
			}
		}
		
		unless $found {
			@result.push($o);
		}
	}
	
	return @result;
}

################################################################

module ResizablePMCArray {
	# method append(@other) - built in
	
	method clone() {
		my @clone := Q:PIR {
			$P0 = find_lex 'self'
			%r = clone $P0
		};
		
		return @clone;
	}

	method contains($what) {
		my $result := Q:PIR {
			.local pmc it, what
			$P0	= find_lex 'self'
			it	= iter $P0
			%r	= box 0
			what	= find_lex '$what'
			
		foreach:
			unless it goto done
			
			$P0	= shift it
			ne_addr $P0, what, foreach
			
			%r	= box 1
		
		done:
		};
		
		return $result;
	}

	method elements(*@value) {
		my $elements;
		
		if +@value {
			$elements := @value.shift;
			
			Q:PIR {
				$P0 = find_lex '$elements'
				$I0 = $P0
				$P0 = find_lex 'self'
				$P0 = $I0
			};
		}
		else {
			$elements := Q:PIR {
				$P0 = find_lex 'self'
				$I0 = elements $P0
				%r = box $I0
			};
		}
		
		return $elements;
	}			
			
	method join(*@delim) {
		@delim.push('');
		my $delim := @delim.shift;
		
		my $result := Q:PIR {
			.local pmc array
			array = find_lex 'self'
			.local string delim
			$P0 = find_lex '$delim'
			delim = $P0
			$S0 = join delim, array
			%r = box $S0
		};
		
		return $result;
	}
}

################################################################

module ResizableStringArray {
	method append(@other) {
		for @other {
			self.push(~ $_);
		}
	}

	method clone() {
		my @clone := Q:PIR {
			$P0 = find_lex 'self'
			%r = clone $P0
		};
		
		return @clone;
	}

	method contains($what) {
		my $result := Q:PIR {
			.local pmc it
			$P0	= find_lex 'self'
			it	= iter $P0
			
			%r	= box 0
			
			.local string what
			$P0	= find_lex '$what'
			what	= $P0
			
		foreach:
			unless it goto done
			$S0	= shift it
			unless $S0 == what goto foreach
			%r	= box 1
		
		done:
		};
		
		return $result;
	}

	method elements(*@value) {
		my $elements;
		
		if +@value {
			$elements := @value.shift;
			
			Q:PIR {
				$P0 = find_lex '$elements'
				$I0 = $P0
				$P0 = find_lex 'self'
				$P0 = $I0
			};
		}
		else {
			$elements := Q:PIR {
				$P0 = find_lex 'self'
				$I0 = elements $P0
				%r = box $I0
			};
		}
		
		return $elements;
	}
			
			
	method join(*@delim) {
		@delim.push('');
		my $delim := @delim.shift;
		
		my $result := Q:PIR {
			.local pmc array
			array = find_lex 'self'
			.local string delim
			$P0 = find_lex '$delim'
			delim = $P0
			$S0 = join delim, array
			%r = box $S0
		};
		
		return $result;
	}
	
	sub new(*@contents) {
		my @array := Q:PIR { %r = new 'ResizableStringArray' };
		
		for @contents {
			@array.push( ~ $_);
		}
		
		return @array;
	}
}
