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

sub super($method, *@args, *%opts) {
	super_($method, @args, %opts);
}

sub super_($method, @args, %opts) {
	my $self := Parrot::get_self();
	my $class := pir::class__PP($self);
	my @mro := $class.inspect('all_parents');
	
	if @mro == 1 {
		die("Call to 'super' on object with no parent classes");
	}
	
	my $parent := @mro[1];
	my &sub := $parent.find_method($method);

	if pir::isnull(&sub) {
		Exception::MethodNotFound.new(:message("Method '$method' not found")).throw;
	}
	
	Parrot::call_method_($self, &sub, @args, %opts);
}
