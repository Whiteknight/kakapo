# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class CallSignature;

has $!object;
has $!method;
has @!positional;
has %!named;

our method _init_obj(*@pos, *%named) {
	$!method	:= Matcher::CallSig::ANY();
	%!named	:= %!named;
	$!object	:= Matcher::CallSig::ANY();
	@!positional	:= @!positional;
	self._init_args(|@pos, |%named);
}

our method object(*@value)	{ @value ?? ($!object := @value.shift) !! $!object; }
our method method($value?)	{ pir::defined($value) ?? ($!method := $value) !! $!method; }
our method positional($value?)	{ pir::defined($value) ?? (@!positional := $value) !! @!positional; }
our method named($value?)	{ pir::defined($value) ?? (%!named := $value) !! %!named; }
