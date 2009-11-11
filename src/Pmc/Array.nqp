# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Array;
=module

A common dumping ground for methods added to RPA and RSA, plus a central 
point for convenience functions like ::new and ::empty.

=end

Global::use('Dumper');

our %Bsearch_compare_func;
%Bsearch_compare_func{'<=>'}	:= Array::cmp_numeric;
%Bsearch_compare_func{'R<=>'}	:= Array::cmp_numeric_R;
%Bsearch_compare_func{'cmp'}	:= Array::cmp_string;
%Bsearch_compare_func{'Rcmp'}	:= Array::cmp_string_R;

our @Empty := Array::empty();

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

sub bsearch(@array, $value, *%opts) {
	my $cmp	:= %opts<cmp> ?? %opts<cmp> !! '<=>';
	my $high	:= %opts<high> > 0 ?? %opts<high> !! @array.elements;
	my $low	:= 0 + %opts<low>;
	my $top	:= $high;
	
	if $high > @array.elements { $high := @array.elements; }
	if $low < 0 { $low := $low + @array; }

	my &compare := %Bsearch_compare_func{$cmp};

	if Opcode::isa($cmp, 'Sub') || Opcode::isa($cmp, 'MultiSub') {
		&compare := $cmp;
	}
	
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
		
		if &compare(@array[$mid], $value) < 0 {
			$low := $mid + 1;
		}
		else {
			$high := $mid;
		}
	}
	
	my $result := - ($low + 1);
	
	if $low < $top
		&& &compare(@array[$low], $value) == 0 {
		$result := $low;
	}
	
	return $result;
}

# FIXME: Legacy implementation that permits undef/null original. This must die.
sub clone(@original) {
	my @clone := Array::empty();
	
	if +@original {
		for @original {
			@clone.push($_);
		}
	}
	
	return @clone;
}

sub cmp_numeric($a, $b) { return $a - $b; }
sub cmp_numeric_R($a, $b) { return $b - $a; }
sub cmp_string($a, $b) { if $a lt $b { return -1; } else { return 1; } }
sub cmp_string_R($a, $b) { if $b lt $a { return -1; } else { return 1; } }

=sub concat(@a1, @a2, ...)

Concatenates a list of zero or more arrays into one long array. Returns the 
resulting array. Returns an empty array if no arrays are given, or if the given
arrays have no elements.

=cut 

sub concat(*@sources) {
	if +@sources == 0 {
		return Array::empty();
	}
	
	my @result := @sources.shift.clone;

	while @sources {
		@result.append(@sources.shift);
	}

	return @result;
}
	
method contains($item) {
	for self {
		if Opcode::iseq($item, $_) {
			return 1;
		}
	}
	
	return 0;
}

method elements(*@value)			{ elements_(self, @value); }

method elements_(@value) {
	if +@value {
		Opcode::set_integer(self, @value.shift);
	}

	return Opcode::elements(self);
}

sub empty() {
	return Opcode::new('ResizablePMCArray');
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

method slice(:$from?, :$to?) {
	my $elements := self.elements;
	unless Opcode::defined($from)	{ $from := 0; }
	unless Opcode::defined($to)	{ $to := $elements; }
	
	if $from < 0	{ $from := $from + $elements; }
	if $to < 0	{ $to := $to + $elements; }
	
	if $from >= $elements {
		Opcode::die("$from parameter out of range: ", $from, " exceeds # elements: ", $elements);
	}
	
	if $to >= $elements {
		Opcode::die("$to parameter out of range: ", $from, " exceeds # elements: ", $elements);
	}

	my @slice := self.clone;
	@slice.splice(@Empty, :from(0), :replacing($from));
	
	$to := $to - $from;
	$to++;
	@slice.splice(@Empty, :from($to), :replacing(@slice.elements - $to));
	return @slice;
}

# Found some kind of bug with named args in 1.7, but since pcc branch is landing,
# there's no hope of a fix. So move all the opts to %opts, and DIY.
method splice(@value, *%opts) {
	my $from := %opts.contains('from') ?? %opts<from> !! 0;
	my $replacing := %opts.contains('replacing') ?? %opts<replacing> !! 0;

	Q:PIR {
		.local pmc new_data
		new_data	= find_lex '@value'
		.local int offset, count
		$P2 = find_lex '$from'
		offset = $P2
		$P3 = find_lex '$replacing'
		count = $P3
		
		splice self, new_data, offset, count
	};
	
	return self;
}

sub unique(@original) {
	my @result := Array::empty();
	
	for @original {
		my $o := $_;
		my $found := 0;
		
		for @result {
			my $match := Q:PIR {
				
				$P0 = find_lex '$_'
				$P1 = find_lex '$o'
				$I0 = cmp $P0, $P1
				not $I0
				%r = box $I0
			};
			
			$found := $found || $match;
		}
		
		unless $found {
			@result.push($o);
		}
	}
	
	return @result;
}