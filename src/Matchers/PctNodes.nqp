# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::PCT::Node;

has	%!attrs;
has	@!children;
has	$!node_type;

INIT {
	Kakapo::depends_on(|<
		Matcher 
		Matcher::Factory
	>);
}

sub _initload() {
	extends( <Matcher> );
	has(<
		%!attrs
		@!children
		$!node_type
	>);
}

method _init_obj(*@children, *%attrs) {
	@!children := @children;
	%!attrs := %attrs;
	super();
}

method matches($node) {

	return 0
		unless $node.isa: $!node_type;
		
	for %!attrs -> $attr {
		if $attr.value.isa( Matcher ) {
			return 0
				unless $attr.value.matches: $node{~$attr};
		}
		else {
			return 0
				unless pir::iseq__IPP($node{ ~$attr}, $attr.value);
		}
	}

	return 0
		unless pir::elements__IP($node) >= @!children.elems;

	my $index := 0;
	
	for @!children -> $child {
		return 0 
			unless $child.matches: $node[$index];
		++$index;
	}
	
	1;
}

method node_type(*@value)	{ @value ?? ($!node_type := @value.shift) !! $!node_type; }

module Matcher::PAST::Node;

INIT {	
	Kakapo::depends_on(|<
		Matcher 
		Matcher::Factory
	>);
}

sub _initload() {
	export( |<
		block
		control
		op
		stmts
		val
		var
		varlist
	>);
}

my sub factory($node_type, @children, %attrs) {
	my $matcher := Matcher::PCT::Node.new: |@children, |%attrs;
	$matcher.node_type: $node_type;
	$matcher;
}

sub block(*@children, *%attrs)		{ factory(PAST::Block, @children, %attrs); }
sub control(*@children, *%attrs)	{ factory(PAST::Control, @children, %attrs); }
sub op(*@children, *%attrs)		{ factory(PAST::Op, @children, %attrs); }
sub stmts(*@children, *%attrs)		{ factory(PAST::Stmts, @children, %attrs); }
sub val(*@children, *%attrs)		{ factory(PAST::Val, @children, %attrs); }
sub var(*@children, *%attrs)		{ factory(PAST::Var, @children, %attrs); }
sub varlist(*@children, *%attrs)	{ factory(PAST::VarList, @children, %attrs); }