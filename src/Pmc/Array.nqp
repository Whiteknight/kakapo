# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Array;

INIT {
    our %Bsearch_compare_func;

    %Bsearch_compare_func{'<=>'}	:= Array::cmp_numeric;
    %Bsearch_compare_func{'R<=>'}	:= Array::cmp_numeric_R;
    %Bsearch_compare_func{'cmp'}	:= Array::cmp_string;
    %Bsearch_compare_func{'Rcmp'}	:= Array::cmp_string_R;

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
    my %methods;
    for @methods {
        %methods{~ $_} := $_;
    }

    my %pmcs;
    %pmcs<ResizablePMCArray> := %methods;
    %pmcs<ResizableStringArray> := pir::clone__PP(%methods); # No common yet
    %pmcs<ResizableStringArray>{"append"} := append;

    my $from_nsp := pir::get_namespace__P();

    for %pmcs {
        my $pmc_name := ~ $_;
        my $namespace;
        Q:PIR {
            $P0 = find_lex '$pmc_name'
            $S0 = $P0
            $P1 = get_root_namespace ['parrot'; $S0]
            store_lex '$namespace', $P1
        };
        my $to_class := pir::get_class__PP($namespace);

        install_methods($to_class, %pmcs{$pmc_name}, :skip_new);
    }

    # Put some helper functions in the global namespace.

    # These are "list-of-list" subs, and have no corresponding methods.
    for <cat roundrobin zip> {
            Global::inject_root_symbol($from_nsp{$_});
    }

    # These have corresponding methods.
    for <grep join map reduce> {
        Global::inject_root_symbol(
            Parrot::get_hll_global('Array::' ~ $_ ~ '_args'),
            :as($_),
        );
    }
}

sub install_methods($class, @methods, :$skip_new?) {
    my $from_nsp := pir::get_namespace__P();
    my $from_class := pir::get_class__PP($from_nsp);
    my %to_methods := pir::inspect__PPS($class, 'methods');
    my %from_methods := pir::inspect__PPS($from_class, 'methods');

    for @methods {
        unless %to_methods{~ $_} {
            if %from_methods{~ $_} {
                %to_methods{~ $_} := %from_methods{~ $_};
            }
            elsif $_ eq 'new' {
                unless $skip_new {
                    create_new_method($class);
                }
            }
            else {
                pir::die("Request to export unknown COMMON method '$_'");
            }
        }
    }
}


method append(@other) {
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
#
#=end

method bsearch($value, *%opts) {
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

method elements() {
        die("No more elements! Use .elems");
}

method elems() {
        pir::elements__IP(self);
}

sub grep_args(&match, *@values) {
        @values.grep: &match;
}

method grep(&match) {
        my @matches;

        for self {
                @matches.push($_)
                        if &match($_);
        }

        @matches;
}

method is_sorted(:&cmp = Array::cmp_string) {
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

method keys() {
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

method kv() {
        my @result;

        my $i := 0;

        for self {
                @result.push($i.clone);
                @result.push($_);
        }

        @result;
}

method join($delim? = '') {
        pir::join__SSP($delim, self);
}

sub map_args(&func, *@args) {
        @args.map: &func;
}

method map(&func) {
        my @result;

        for self {
                @result.push(&func($_));
        }

        @result;
}

sub new(*@elements) {
        @elements;
}

sub reduce_args(&expression, *@values) {
        @values.reduce(&expression);
}

method reduce(&expression) {
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

method reverse(:$from = 0, :$to) {
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

method set_size($size) {
        pir::assign__vPI(self, $size);
        self;
}

method slice(:$from = 0, :$to) {
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

        my $bound := self.elems - 1;
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

