# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	pir::say( '# Verify that krt0 calls ::main by default');
	pir::say("1..1");
}

sub main() {
	pir::say("ok 1 - main called");
}
