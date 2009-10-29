# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

=NAME	Kakapo - a program framework and run-time library for NQP

=VERSION
	Release:		0.1
	Release Date:	01 November, 2009
	Repository:		git@gitorious.org:kakapo/kakapo.git

=SYNOPSIS

	=head1	Using Kakapo in-line from NQP

		# myprogram.nqp
		
		Q:PIR { load_bytecode 'kakapo.pbc' };
		
		main(*@argv) {
			if +@argv {
				say("Called with ", +@argv, " args: ");
				say(@argv.join("\n"));
				
				exit(0);
			}
			else {
				say("Usage: myprogram arg1 [...]");
				exit(1);
			}
		}
		
	=head1	Linking with Kakapo

		# Makefile
		KRT0 = $(LIB_DIR)/Kakapo/krt0.pir
		KRT9 = $(LIB_DIR)/Kakapo.krt9.pir
		
		program.pbc: main.pbc
			$(LINK) --output=program.pbc $(KRT0) main.pbc $(KRT9)
		
		
		# main.nqp
		
		main() {
			say("Hello, world.");
		}
		
=DESCRIPTION

The Kakapo library provides a program framework and a useful collection of other features for developers
of NQP programs. This document does not describe them all, but rather serves as an overview and index for
what is available elsewhere. 

=table
Functionality		| Kakapo Component	| Synopsis
-----------------------------------------------------------------------------------------
Classes			| Classes/*			| Class and subclass declarations,
				|				| Array- and Hash-based objects, multi-subs and methods.
Symbol import/export	| Global			| C<export>, C<use>, C<register_global>.
Parrot Opcodes		| Opcode			| NQP functions for various Parrot ops.
PMC methods		| Pmc/*			| Useful methods for built-in PMC types
Program framework	| Program			| Supports inter-module dependencies, ordering, C<main> and C<exit>.
Testing			| Test/, Matchers/*	| xUnit/Hamcrest-like testcase and Matchers.

=head1 Classes

C< Class > and related modules allow specifying class inheritance for NQP classes. There is also support 
for building multi-methods and multi-subs composed from existing NQP subs and methods.

=head1 Global

C< Global > provides C< Global::export > and C< Global::use > for exporting and importing symbols. 
Also, Global provides C< register_global > for creating a registry of global symbols.

=head1 Opcode

The C< Opcode > library defines functions like C< Opcode::get_hll_namespace > that are NQP proxies for 
Parrot opcodes. In many cases, the functions do slightly more than the opcode version, to make them easier 
to use. (For example, namespace names may be "A::b" format.)

=head1 Pmc

The various built-in PMCs don't have method versions of most of their vtable operations. So there is no way,
from NQP, to call C< append > on a C< ResizablePMCArray >. In contrast, there is no C< append > vtable
defined for C< ResizableStringArray >, which makes it difficult to treat the two array types interchangeable.
(Doubly irritating, since C< split > returns an RSA.)
 
 The C< Pmc > modules add methods I<to the existing PMC types> to make the various types more consistent,
 and to fill in missing methods (like C< ResizableStringArray::append >). In addition, some useful add-on 
 methods are defined: C< *Array::bsearch >, C< String::trim >, etc.
 
 =head1 Program
 
 One problem with NQP classes is that declaring a subclass means you have to worry about ensuring that the 
 parent class has been registered before the subclass can be declared. The C< Program > module provides 
 dependency-based initialization of modules, plus some standard C-like program operations (calling 'main',
 defining C< exit > and C< _exit >, startup and shutdown queues).
 
 =head1 Testing
 
 The testing modules supply some Hamcrest-like C< Matcher > classes to test for various conditions.
 
 =end
 