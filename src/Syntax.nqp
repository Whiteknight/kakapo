# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Syntax;
# Syntax additions for NQP

sub _pre_initload() {
	Global::inject_root_symbol(Syntax::die);
	Global::inject_root_symbol(Syntax::last);
	Global::inject_root_symbol(Syntax::next);
	Global::inject_root_symbol(Syntax::redo);
}

sub die(*@why) {
	pir::die(@why.join);
}

sub last() {
	Control::LoopLast.new(:message('Uncaught LAST control exception')).throw;
}

sub next() {
	Control::LoopNext.new(:message('Uncaught NEXT control exception')).throw;
}

sub redo() {
	Control::LoopRedo.new(:message('Uncaught REDO control exception')).throw;
}
