# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Array;

# Special sub called when the Kakapo library is loaded or initialized to 
# guarantee this module is already initialized during :init and :load 
# processing.
sub _pre_initload() {

	our %Bsearch_compare_func;

	%Bsearch_compare_func{'<=>'}	:= Array::cmp_numeric;
	%Bsearch_compare_func{'R<=>'}	:= Array::cmp_numeric_R;
	%Bsearch_compare_func{'cmp'}	:= Array::cmp_string;
	%Bsearch_compare_func{'Rcmp'}	:= Array::cmp_string_R;

	our @Empty := Array::empty();
	
	my %pmcs;
	
	# NB: This one doesn't get 'append'
	%pmcs<ResizablePMCArray>	:= <
		bsearch
		concat
		contains 
		delete 
		elements 
		is_sorted
		join
		slice 
		splice
		unsort
	>;
	%pmcs<ResizableStringArray>	:= <
		append 
		bsearch
		concat
		contains 
		delete 
		elements 
		is_sorted
		join
		slice 
		splice
		unsort
	>;
	
	my $from_nsp := pir::get_namespace__P();

	for %pmcs {
		my %export_subs;
		my $pmc_name := ~ $_;
		my $to_nsp := Parrot::get_hll_namespace($pmc_name);
		
		for %pmcs{$_} {
			if $from_nsp.contains($_) {
				%export_subs{$_} := $from_nsp{$_};
			}
			else {
				pir::die("Request to export unknown Array method '$_'");
			}

		}
		
		$from_nsp.export_to($to_nsp, %export_subs);
	}
}

method append(@other) {
	for @other {
		self.push($_);
	}
}

#=begin 
#
#=item bsearch($value, :cmp($)?, :low($)?, :high($)?) returns Integer
#
#Binary search for C< $value > in the invocant array. The array must be sorted
#in the order implied by the comparison function used.
#
#By default, bsearch uses the "natural" ascending order of the array -- string order
#for PMC and String array types, numeric order for numeric arrays. The caller may 
#specify an alternate comparator using the C< :cmp() > option.
#
#The string labels C<< '<=>' >> and C<< 'R<=>' >> are defined aliases for the
#ascending and descending ('R' for reversed) numeric comparators. Likewise,
#the labels C< cmp > and C< Rcmp > are defined aliases for the string comparators.
#
#A user-provided function may be passed to C< :cmp() > -- just pass the Sub PMC.
#As you might expect, the function must accept two parameters and return an 
#integer value less than zero when the first parameter should appear earlier in
#the array than the second parameter.
#
#The C< :low() > and C< :high() > options may be specified to artificially restrict 
#the range of the search. By default, C< bsearch > assumes values of C< :low(0) >
#and C< :high( self.elements ) >. 
#
#If C< $value > is stored in the array, C< bsearch > returns the index where the 
#value can be found. If C< $value > is I< not > in the array, the return value is
#(-V) - 1, where V is the index where C< $value > would be inserted in order. This
#avoids trying to deal with "negative zero" indices for values that would be inserted
#at the start of the array. The mapping (-V) - 1 reverses itself.
#
#=begin code
#	my $index := @a.bsearch('needle');
#	
#	if $index < 0 {
#		insert_record(@a, -$index - 1);
#	}
#	else {
#		say("Found it at index: $index");
#	}
#=end code
#
#=end

method bsearch($value, *%opts) {
	our %Bsearch_compare_func;
	
	my $cmp	:= %opts<cmp> ?? %opts<cmp> !! '<=>';
	my $high	:= %opts<high> > 0 ?? %opts<high> !! self.elements;
	my $low	:= 0 + %opts<low>;
	my $top	:= $high;

	my $elts	:= self.elements;
	
	if $high > $elts { $high := $elts; }
	if $low < 0 { $low := $low + $elts; }

	my &comparator := %Bsearch_compare_func.contains($cmp)
		?? %Bsearch_compare_func{$cmp}
		!! $cmp;

	unless &comparator.isa('Sub') || &comparator.isa('MultiSub') {
		Opcode::die("Bsearch :cmp function parameter was not a (Multi)Sub");
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
		
		if &comparator(self[$mid], $value) < 0 {
			$low := $mid + 1;
		}
		else {
			$high := $mid;
		}
	}
	
	my $result := - ($low + 1);
	
	if $low < $top
		&& &comparator(self[$low], $value) == 0 {
		$result := $low;
	}
	
	$result;
}

sub cmp_numeric($a, $b) { return $a - $b; }
sub cmp_numeric_R($a, $b) { return $b - $a; }
sub cmp_string($a, $b) { if $a lt $b { return -1; } else { return 1; } }
sub cmp_string_R($a, $b) { if $b lt $a { return -1; } else { return 1; } }

# Concatenates a list of zero or more arrays into one long array. Returns the 
# resulting array. Returns an empty array if no arrays are given, or if the given
# arrays have no elements.
method concat(*@sources) {
	my @result := self.isa('P6protoobject') ?? self.new !! self.clone;
	
	for @sources {
		@result.append($_);
	}
	
	@result;
}

method contains($item) {
	for self {
		if pir::iseq__IPP($item, $_) {
			return 1;
		}
	}
	
	0;
}

method delete($key) {
	Opcode::delete(self, $key);	# NB: Needs special key reference
	self;
}

method distinct(:&cmp = Array::cmp_string) {
	my $elements := self.elements;
	my $i := 0;
	my $j;
	my $array_i;
	
	while $i < $elements {
		$array_i := self[$i];
		$i++;
		
		while $i < $elements && &cmp($array_i, self[$i]) == 0 {
			self.delete($i);
			$elements--;
		}
	}
	
	self;
}

method elements(*@value) {
	elements_(self, @value); 
}

method elements_(@value) {
	if +@value {
		pir::assign__vPI(self, @value.shift);
		self;
	}
	else {
		pir::elements__IP(self);
	}
}

method is_sorted(:&compare?) {
	my $index := 0;
	my $limit := self.elements - 1;
	
	while $index < $limit {
		if &compare(self[$index], self[$index + 1]) > 0 {
			return 0;
		}
	}
	
	return 1;
}

method join($delim? = '') {
	pir::join__SSP($delim, self);
}

sub new(*@elements) {
	@elements;
}

method reverse(:$from = 0, :$to) {
	$to := self.elements unless $to.defined;
	my $temp;
	if $from > $to {
		$temp := $from;
		$from := $to;
		$to := $temp;
	}

	while $from < $to {
		$temp := self[$from];
		self[$from] := self[$to];
		self[$to] := $temp;
		$from++;
		$to--;
	}
	
	self;
}

method slice(:$from = 0, :$to) {
	my $elements := self.elements;
	$to := $elements unless $to.defined;

	if $from < 0	{ $from := $from + $elements; }
	if $to < 0	{ $to := $to + $elements; }
	
	if $from >= $elements {
		die('$from parameter out of range: ', $from, ' exceeds # elements: ', $elements);
	}
	
	if $to > $elements {
		die('$to parameter out of range: ', $from, ' exceeds # elements: ', $elements);
	}

	our @Empty;
	my @slice := self.clone;
	@slice.splice(@Empty, :from($to + 1), :replacing($elements - $to));
	@slice.splice(@Empty, :from(0), :replacing($from));
	@slice;
}

method splice(@value, :$from = 0, :$replacing = 0) {
	pir::splice__vPPII(self, @value, $from, $replacing);
	self;
}

method unsort() {
	our &Parrot_range_rand;
	
	if ! pir::defined( &Parrot_range_rand ) {
		#$_Math_lib := pir::loadlib__PS('math_ops');
		my $lib := pir::loadlib__PS(pir::null__S);
		&Parrot_range_rand := pir::dlfunc__PPSS($lib, 'Parrot_range_rand', 'iiii');
	}
	
	my $bound := self.elements - 1;
	my $swap;
	my $temp;

	while $bound > 0 {
		$swap := &Parrot_range_rand(0, $bound + 1, 0);	# +1: see TT#1479
		$swap-- if $swap > $bound;	# Rare but possible
		$temp := self[$bound];
		self[$bound] := self[$swap];
		self[$swap] := $temp;
		$bound--;
	}
	
	self;
}