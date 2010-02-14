# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo {
	# Tell the Kakapo runtime which library file to load.	
	sub library_name()		{ 'kakapo_test.pbc' }
}

sub base_loaded() {
	my $result := Q:PIR {
		$P0 = get_hll_global ['Program'], 'register_main'
		_dumper($P0)
		$I0 = isnull $P0
		$I0 = not $I0
		%r = box $I0
	};
}

sub main() {
	pir::say( '# Verify that krt0 loads test library as instructed' );
	pir::say("1..2");
	
	unless base_loaded() {
		print("not ");
	}
	pir::say("ok 1 - base library should be loaded");
	
	unless test_loaded() {
		print("not ");
	}
	pir::say("ok 2 - test library should be loaded");
}

sub test_loaded() {
	my $result := Q:PIR {
		$P0 = get_hll_global ['UnitTest'], 'Testcase'
		$I0 = isnull $P0
		$I0 = not $I0
		%r = box $I0
	};
}
