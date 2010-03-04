# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Mimus::CallSignature;

has $!object;
has $!method;
has @!positional;
has %!named;

method object($value?)	{ $value.defined ?? ($!object := $value) !! $!object; }
method method($value?)	{ $value.defined ?? ($!method := $value) !! $!method; }
method positional($value?)	{ $value.defined ?? (@!positional := $value) !! @!positional; }
method named($value?)	{ $value.defined ?? (%!named := $value) !! %!named; }

module Mimus::CallSignature::SigMatcher;

has $!expecting;

INIT {
	Kakapo::depends_on( 'Matcher' );
}

sub _initload() {
	
	extends( 'Matcher' );
	has( <$!expecting> );
	export(< ANY ETC >);
}

# Unique argument value meaning "match anything in this position".
# Usage: $foo.method(1, ANY, 3) would match $foo.method(1, 'a', 3)
sub ANY() {
	Mimus::CallSignature::SigMatcher::ANY;
}

# Unique argument value meaning "match any extra args starting here".
# Usage: $foo.method(1, ETC) would match (1), (1,2), (1,2,'z')
sub ETC() {
	Mimus::CallSignature::SigMatcher::ETC;
}

method matches($actual) {
	my $expected :=$!expecting;
	
	unless $expected.object =:= $actual.object
		&& $expected.method =:= $actual.method {
		return 0; 
	}

	my $positionals := 0;
	
	for zip( $expected.positional, $actual.positional ) -> $exp, $act {
		$positionals++;

		last() if $exp =:= ETC;
		
		unless $exp =:= ANY || pir::iseq__IPP($exp, $act) {
			return 0;
		}
	}

	# Deal with too-few args in $actual. (Can't just compare counts because
	# ETC matches 0 or more.
	if $positionals != $expected.positional.elems {
		return 0;
	}

	my %act := $actual.named;

	for $expected.named -> $exp {
		unless %act.contains($exp.key) 
			&& ($exp.value =:= ANY
				|| pir::iseq__IPP($exp.value, %act{$exp.key})) {
			return 0;
		}
	}
	
	1;
}
