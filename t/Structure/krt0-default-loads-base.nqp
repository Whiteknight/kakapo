# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub base_loaded() {
	Q:PIR {
		$P0 = get_hll_global ['Program'], 'register_main'
		$I0 = isnull $P0
		$I0 = not $I0
		%r = box $I0
	};
}

sub main() {
	pir::say( '# Verify that krt0 loads base library by default' );
	pir::say("1..2");
	
	unless base_loaded() {
		print("not");
	}
	pir::say("ok 1 - base library should be loaded");
	
	if test_loaded() {
		print("not");
	}
	pir::say("ok 2 - test library should not be loaded");
}

sub test_loaded() {
	Q:PIR {
		$P0 = get_hll_global ['UnitTest'], 'Testcase'
		$I0 = isnull $P0
		$I0 = not $I0
		%r = box $I0
	};
}
