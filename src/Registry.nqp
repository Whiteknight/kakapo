# $Id: String.nqp 166 2009-09-27 15:58:50Z austin_hastings@yahoo.com $

module Registry;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	#say("Registry::_onload");
	
	Registry := Hash::new();
}

################################################################

# No methods, no subs.