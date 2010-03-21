# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Integer;

INIT {
	Global::inject_root_symbol( Integer::int );
}

sub int($x) {
	Q:PIR {
		$P0 = find_lex '$x'
		$I0 = $P0
		.return ($I0)
	};
}