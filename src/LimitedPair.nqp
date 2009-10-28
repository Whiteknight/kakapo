# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module LimitedPair;
=module
Provides very basic Pair functionality.

DEPRECATED. Don't use this. Don't inherit from it. Pretend it doesn't exist.

But it's part of the startup code, so it's not going away. :(

=end

Class::SUBCLASS('LimitedPair', 'Class::ArrayBased');

method init(@args, %opts) {
	unless Opcode::get_integer(self) {
		Opcode::set_integer(self, 2);
	}

	if +@args { self.key(@args.shift); }
	if +@args { self.value(@args.shift); }
}

method key(*@value)			{ self._ATTR(0, @value); }
method value(*@value)			{ self._ATTR(1, @value); }
