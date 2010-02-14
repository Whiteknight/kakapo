# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell the Kakapo runtime which library file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

module Kakapo;

sub is_loaded() {
	pir::say("not ok 100 - is_loaded() should be checked, but never called.");
}

module Program;

sub call_main() {
	pir::say( '# Verify that krt0 loads nothing if is_loaded exists' );
	pir::say("1..2");
	
	if base_loaded() {
		print("not");
	}
	pir::say("ok 1 - base library should not be loaded");
	
	if test_loaded() {
		print("not");
	}
	pir::say("ok 2 - test library should not be loaded");
}

sub base_loaded() {
	Q:PIR {
		$P0 = get_hll_global ['Program'], 'register_main'
		$I0 = isnull $P0
		$I0 = not $I0
		%r = box $I0
	};
}

sub test_loaded() {
	Q:PIR {
		$P0 = get_hll_global ['UnitTest'], 'Testcase'
		$I0 = isnull $P0
		$I0 = not $I0
		%r = box $I0
	};
}
