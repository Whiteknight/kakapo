# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::CallSig;

has $!expecting;

INIT {
	Kakapo::depends_on( 'Matcher' );

	#export(< ANY ETC >);
}

sub _initload() {
	extends( 'Matcher' );
	has( <$!expecting> );
}

# Unique argument value meaning "match anything in this position".
# Usage: $foo.method(1, ANY, 3) would match $foo.method(1, 'a', 3)
sub ANY() {
	Matcher::CallSig::ANY;
}

# Unique argument value meaning "match any extra args starting here".
# Usage: $foo.method(1, ETC) would match (1), (1,2), (1,2,'z')
sub ETC() {
	Matcher::CallSig::ETC;
}

method describe_failure($previous, $item) {
	$previous ~ "was a call to " ~ self.format_sig($item);
}

method describe_self($previous) {
	$previous ~ "a call matching " ~ self.format_sig($!expecting);
}

method format_sig($callsig) {
	'CallSignature:{ ' ~ self.format_obj($callsig.object)
		~ '.' ~ $callsig.method ~ '( '
		~ $callsig.positional.map( -> $obj { self.format_obj($obj) }).join(', ')
		~ $callsig.named.keys.map( -> $key { ":$key(" ~ self.format_obj($!expecting.named{$key}) ~ ')' }).join(', ')
		~ ' ) }';
}

method format_obj($obj) {
	if pir::isa__IPS($obj, 'String') {
		"String:'$obj'";
	}
	elsif pir::isa__IPS($obj, 'Float') || pir::isa__IPS($obj, 'Integer') {
		~ $obj;
	}
	else {
		'[' ~ Opcode::typeof($obj) ~ '@' ~ Opcode::get_addr($obj) ~ ']';
	}
}

method matches($actual) {
	! $!expecting.defined
	|| self.method_matches($actual)
		&& self.object_matches($actual)
		&& self.positionals_match($actual)
		&& self.named_match($actual);
}

method method_matches($actual) {
	$!expecting.method eq $actual.method
	|| $!expecting.method =:= ANY();
}

method named_match($actual) {
	my %act := $actual.named;

	for $!expecting.named -> $exp {
		unless %act.contains($exp.key)
			&& ($exp.value =:= ANY()
				|| pir::iseq__IPP($exp.value, %act{$exp.key})) {
			return 0;
		}
	}

	1;
}

method object_matches($actual) {
	$!expecting.object =:= $actual.object
	|| $!expecting.object =:= ANY();
}

method positionals_match($actual) {
	my $count := 0;
	my $num_expecting := $!expecting.positional;
	my @wanted := $!expecting.positional;
	my @got := $actual.positional;

	while $count < $num_expecting {
		return 1 if @wanted[$count] =:= ETC();
		return 0 if $count == @got;	# Could be ok if ETC() above.

		unless @wanted[$count] =:= ANY()
			|| @wanted[$count] =:= @got[$count]
			|| pir::iseq__IPP(@wanted[$count], @got[$count]) {
			return 0;
		}

		$count++;
	}

	1;
}