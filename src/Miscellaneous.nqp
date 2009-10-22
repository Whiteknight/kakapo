module Miscellaneous;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;

	my $say := say;
	unless $say {
		Q:PIR { load_language 'nqp' };
	}
}