# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

sub _kakapo_top_pre_initload() {
	pir::say("# Verify that krt0 calls the right sequence of symbols");
	pir::say("1..2");
	pir::say("ok 1 - pre_initload called");
}

module Kakapo;

sub is_loaded() {
	pir::say("not ok 100 - is_loaded() should be checked, but never called.");
}

module Program;

sub call_main() {
	pir::say("ok 2 - Program::call_main called third")
}