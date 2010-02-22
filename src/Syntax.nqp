# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Syntax;
# Syntax additions for NQP

sub _pre_initload() {
	Global::inject_root_symbol(Syntax::die);
	Global::inject_root_symbol(Syntax::last);
	Global::inject_root_symbol(Syntax::next);
	Global::inject_root_symbol(Syntax::redo);
	Global::inject_root_symbol(Syntax::super);
	Global::inject_root_symbol(Syntax::super_);
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

sub super($method, *@pos, *%named) {
	super_($method, @pos, %named);
}

sub super_($method, @pos, %named) {
	my $self := Parrot::get_self();
	P6object::SUPER_($self, $method, @pos, %named);
}
