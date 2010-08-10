# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Pmc::Array;

# Special sub called when the Kakapo library is loaded or initialized to
# guarantee this module is already initialized during :init and :load
# processing.
sub _pre_initload() {
	our %Bsearch_compare_func;

	%Bsearch_compare_func{'<=>'}	:= Pmc::Array::cmp_numeric;
	%Bsearch_compare_func{'R<=>'}	:= Pmc::Array::cmp_numeric_R;
	%Bsearch_compare_func{'cmp'}	:= Pmc::Array::cmp_string;
	%Bsearch_compare_func{'Rcmp'}	:= Pmc::Array::cmp_string_R;

	my @methods := <
	        bsearch
	        contains
	        delete
	        distinct
	        elems
	        grep
	        is_sorted
	        keys
	        kv
	        join
	        map
	        reduce
	        reverse
	        slice
	        splice
	        unsort
	>;
	
	my $from_nsp := pir::get_namespace__p();

	my %new_methods;
	%new_methods<ResizablePMCArray> := 'new_rpa';
	%new_methods<ResizableStringArray> := 'new_rsa';
	
	for %new_methods.kv -> $pmc_name, $method_name {
		# NB: Calling register on the same name, twice, destroys the namespace. (TT#1481)
		# So check first!
		unless pir::isa( Parrot::get_hll_global( $pmc_name ), 'P6protoobject' ) {
			P6metaclass.register: $pmc_name;
		}
		
		my $to_nsp := Parrot::get_hll_namespace( $pmc_name );
		
		$from_nsp.export_methods_to: $to_nsp, @methods;
		my &new := $from_nsp.get_method: $method_name;
		$to_nsp.install_method: 'new', &new;
		
		unless $to_nsp.contains: 'append' {
			$from_nsp.export_methods_to: $to_nsp, [ <append> ];
		}
	}

	# Put some helper functions in the global namespace.

	# These are "list-of-list" subs, and have no corresponding methods.
	for <cat roundrobin zip> {
		Global::inject_root_symbol($from_nsp{$_});
	}

	# These have corresponding methods.
	for <grep join map reduce> {
	        Global::inject_root_symbol(
		    Parrot::get_hll_global('Pmc::Array::' ~ $_ ~ '_args'),
		    :as($_),
	        );
	}
}

our method append(@other) {
	for @other {
	        self.push($_);
	}

	self;
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
#and C< :high( self.elems ) >.
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

our method bsearch($value, *%opts) {
	our %Bsearch_compare_func;

	my $cmp	:= %opts<cmp> ?? %opts<cmp> !! '<=>';
	my $high	:= %opts<high> > 0 ?? %opts<high> !! self.elems;
	my $low	:= 0 + %opts<low>;
	my $top	:= $high;

	my $elts	:= self.elems;

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
sub cat(*@sources) {
	my @cat;

	for @sources {
	        @cat.append($_);
	}

	@cat;
}

our method contains($item) {
	for self {
	        if pir::iseq__IPP($item, $_) {
		    return 1;
	        }
	}

	0;
}

our method delete($key) {
	Opcode::delete(self, $key);	# NB: Needs special key reference
	self;
}

our method distinct(:&cmp = Pmc::Array::cmp_string) {
	my $elems := self.elems;
	my $i := 0;
	my $j;
	my $array_i;

	while $i < $elems {
	        $array_i := self[$i];
	        $i++;

	        while $i < $elems && &cmp($array_i, self[$i]) == 0 {
		    self.delete($i);
		    $elems--;
	        }
	}

	self;
}

our method elements() {
	die("No more elements! Use .elems");
}

our method elems() {
	pir::elements__IP(self);
}

sub grep_args(&match, *@values) {
	@values.grep: &match;
}

our method grep(&match) {
	my @matches;

	for self {
	        @matches.push($_)
		    if &match($_);
	}

	@matches;
}

our method is_sorted(:&cmp = Pmc::Array::cmp_string) {
	my $index := 0;
	my $limit := self.elems - 1;

	while $index < $limit {
	        if &cmp(self[$index], self[$index + 1]) > 0 {
		    return 0;
	        }

	        $index++;
	}

	1;
}

sub join_args( $delim, *@args ) {
	@args.join($delim);
}

our method keys() {
	my @result;

	my $i := 0;
	my $limit := self.elems;

	while $i < $limit {
	        if self.exists($i) {
		    @result.push($i.clone);
	        }

	        $i++;
	}

	@result;
}

our method kv() {
	my @result;

	my $i := 0;

	for self {
	        @result.push($i.clone);
	        @result.push($_);
	}

	@result;
}

our method join($delim? = '') {
	pir::join__SSP($delim, self);
}

sub map_args(&func, *@args) {
	@args.map: &func;
}

our method map(&func) {
	my @result;

	for self {
	        @result.push(&func($_));
	}

	@result;
}

our method new_rpa(*@elements) { @elements; }
our method new_rsa(*@elements) {
	my @rsa := Parrot::new( 'ResizableStringArray' );
	
	for @elements {
		pir::push__vps( @rsa, $_ );
	}

	@rsa;
}
	
sub reduce_args(&expression, *@values) {
	@values.reduce(&expression);
}

our method reduce(&expression) {
	my $result;
	my $first := 1;

	if self.elems {
	        for self {
		    if $first {
			$first--;
			$result := $_;
		    }
		    else {
			$result := &expression($result, $_);
		    }
	        }
	}

	$result;
}

our method reverse(:$from = 0, :$to) {
	$to := self.elems - 1 unless $to.defined;
	my $temp;

	if $from > $to {
	        $temp := $from;
	        $from := $to;
	        $to := $temp;
	}

	if $from >= 0 {
	        while $from < $to {
		    $temp := self[$from];
		    self[$from] := self[$to];
		    self[$to] := $temp;
		    $from++;
		    $to--;
	        }
	}

	self;
}

sub roundrobin(*@sources) {
	my @result;
	my $i := 0;
	my $done;

	until $done {
	        $done := 1;

	        for @sources -> @a {
		    if @a.elems > $i {
			$done := 0;
			@result.push(@a[$i]);
		    }
	        }
	}

	@result;
}

our method set_size($size) {
	pir::assign__vPI(self, $size);
	self;
}

our method slice(:$from = 0, :$to) {
	my $elems := self.elems;
	$to := $elems unless $to.defined;

	if $from < 0	{ $from := $from + $elems; }
	if $to < 0	{ $to := $to + $elems; }

	if $from >= $elems {
	        die('$from parameter out of range: ', $from, ' exceeds # elements: ', $elems);
	}

	if $to > $elems {
	        die('$to parameter out of range: ', $from, ' exceeds # elements: ', $elems);
	}

	our @Empty;
	my @slice := self.clone;
	@slice.splice(@Empty, :from($to + 1), :replacing($elems - $to));
	@slice.splice(@Empty, :from(0), :replacing($from));
	@slice;
}

our method splice(@value, :$from = 0, :$replacing = 0) {
	pir::splice__vPPII(self, @value, $from, $replacing);
	self;
}

our method unsort() {
	my $bound := self.elems - 1;
	my $swap;
	my $temp;

	while $bound > 0 {
	        $swap := pir::rand__iiii(0, $bound);
	        $swap-- if $swap > $bound;	# Rare but possible
	        $temp := self[$bound];
	        self[$bound] := self[$swap];
	        self[$swap] := $temp;
	        $bound--;
	}

	self;
}

sub zip(*@sources) {
	my @result;
	my $limit := 0;

	if @sources.elems {
	        $limit := @sources[0].elems;
	}

	for @sources -> @a {
	        $limit := @a.elems
		    if @a.elems < $limit;
	}

	my $i := 0;

	while $i < $limit {
	        for @sources -> @a {
		    @result.push(@a[$i]);
	        }

	        $i++;
	}

	@result;
}
