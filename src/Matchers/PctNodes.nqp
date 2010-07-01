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

method bad_attrs($item) {
	my @bad;

	for %!attrs -> $attr {
		if $attr.value.isa( Matcher ) {
			@bad.push: ~$attr
				unless $attr.value.matches: $item{~$attr};
		}
		else {
			@bad.push: ~$attr
				unless pir::iseq__IPP($item{ ~$attr}, $attr.value);
		}
	}

	@bad;
}

method describe_children(@children = [ ]) {
	@children.map: -> $kid {
		if pir::isa($kid, 'Matcher') {
			$kid.describe_self('');
		}
		elsif pir::isa($kid, 'Capture') {
			self.describe_node($kid);
		}
		else {
			pir::typeof__SP($kid) ~ ": " ~ $kid;
		}
	};
}

# Return a string suitable for use in an expression like:
# Match failed. Expected [describe_self] but [describe_failure].
method describe_failure($previous, $item) {
	my $descr := $previous ~ "was " ~ self.describe_node($item);

	$descr;
}

method describe_hash(%hash) {
	%hash.keys.sort.map: -> $key {
		my $value := %hash{$key};

		if pir::isa($value, 'Boolean')
			|| (pir::isa($value, 'Integer')
				&& ($value == 1 || $value == 0)) {
			":" ~ ($value ?? '' !! '!') ~ $key;
		}
		elsif pir::isa($value, 'Matcher') {
			$value.describe_self('');
		}
		else {
			":{$key}<$value>";
		}
	};
}

method describe_node($node) {
	self.describe_type( pir::typeof__SP($node) )
	~ '( '
	~ cat(
		self.describe_hash( $node.hash ),
		self.describe_children( $node.list ),
	).join(', ')
	~ ' )';
}

# Return a string suitable for use in an expression like:
# Match failed. Expected [describe_self] but [describe_failure].
method describe_self($previous) {
	my $descr := $previous ~ self.describe_type( ~$!node_type )
	~ '( '
	~ cat(
		self.describe_hash( %!attrs ),
		self.describe_children( @!children ),
	).join(', ')
	~ ' )';

	$descr;
}

method describe_type($type) {
	$type := $type.split('(')[0].split(';').pop.split('::').pop;
	$type := pir::downcase__SS($type);
}

method _init_obj(*@children, *%attrs) {
	@!children := @children;
	%!attrs := %attrs;
	$!node_type := 'PCT::Node';
	super();
}

method matches($item) {

	if ! $item.isa: $!node_type
		|| pir::elements__IP($item) < @!children.elems
		|| self.bad_attrs( $item ).elems != 0 {
		return 0;
	}

	my $index := 0;

	for @!children -> $child {
		return 0
			unless $child.matches: $item[$index];
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