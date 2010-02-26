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

sub super(*@pos, *%named) {
	my $self := Parrot::get_self();
	my $class := pir::class__PP($self);
	my @mro := $class.inspect('all_parents');
	
	if @mro == 1 {
		die("Call to 'super' on object with no parent classes");
	}

	my &caller := Parrot::caller();
	my $caller_name := ~ &caller;
	my $found_myself := 0;
	my &super;	

	while @mro {
		my $parent := @mro.shift;
		&super := $parent.find_method($caller_name);

		if $found_myself {
			unless &super =:= &caller {
				return &super($self, |@pos, |%named); # This is it.
			}
		}
		else {
			$found_myself := (&super =:= &caller);
		}
	}

	Exception::MethodNotFound.new(
		:message("Could not find superclass method '$caller_name'"),
	).throw;
}
