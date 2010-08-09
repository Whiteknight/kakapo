# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Subsystem of Parrot dealing with multisubs.
module Parrot;

# Creates a set of multisub trampolines, declared with the :multi() signatures explicitly specified by
# the caller, or inferred from the specially formatted name of the sub. Each trampoline calls an NQP
# sub or method.
sub define_multisub($name, @subs?, :$method, :$namespace = caller_namespace(), :@signatures, :$starting_with) {
	$namespace := get_hll_namespace($namespace)
		if $namespace.isa('String');
	$namespace := $namespace.WHO
		if $namespace.isa('P6protoobject');


	unless @subs {
		pir::die( "You must provide either @subs or a :starting_with prefix")
                    unless $starting_with;

		my $len := $starting_with.length;
		for $namespace.keys -> $sub {
			@subs.push: $sub
				if $sub.substr(0, $len) eq $starting_with;
		}
	}

	pir::die("@signatures must have same #elements as @subs, if provided")
		if @signatures && @signatures.elems != @subs.elems;

	unless @signatures {
		@signatures := @subs.map: -> $name {
			my @sig := parse_multisig(~ $name);
			@sig.unshift: <_>
				if $method;
			@sig};
	}

	my @adverbs;
	my $index := 0;

	for @subs -> $sub {
		pir::die( "Null sub in call to define_multisub")
			if Parrot::is_null($sub);

		@adverbs := [ ":multi({ @signatures[$index].join(', ') })",
			":subid('$name({@signatures[$index].join(', ') })')"
		];
		@adverbs.unshift(':method')
			if $method;

		$index++;

		my $source := trampoline($name,
			:adverbs(@adverbs),
			:method($method),
			:namespace($namespace),
			:target($sub)
		);
		#say($source);
		Pir::compile($source);
	}
}

sub parse_multisig($name) {
	my @sig := $name.split('__');
	@sig.shift;
	@sig := @sig.map: -> $sig { $sig eq 'ANY' ?? '_' !! $sig; };
}

sub trampoline($name, :$namespace!, :@adverbs, :@body, :$method = 0, :$target!) {

	unless @body {
		@body := trampoline_default(
			:method($method),
			:namespace($namespace),
			:target($target),
		);
	}

	my $pir_namespace := Pir::pir_namespace($namespace);
	my $sub_modifiers := @adverbs.join(' ');

	my $code := qq{
.namespace $pir_namespace
.sub '$name' $sub_modifiers
	.param pmc pos   :slurpy
	.param pmc named :slurpy :named
	{ @body.join("\n") }
.end
	};
}

sub trampoline_default(:$method!, :$namespace!, :$target!) {
	my $tailcall := $method
		?? '.tailcall self.'
		!! '.tailcall ';

	my @nsp_parts;
	my $target_nsp;
	my $target_name;

	if $target.isa('String') {
		@nsp_parts := $target.split('::');
		$target_name := @nsp_parts.pop;
		$target_nsp := @nsp_parts.join('::');
		$target_nsp := $namespace
			unless $target_nsp;
	}
	elsif $target.isa('Sub') {
		$target_nsp := $target.get_namespace;
		$target_name := ~ $target;
	}
	else {
		die( "Don't know how to build trampoline for ", pir::typeof__SP($target), " $target" );
	}

	$target_nsp := Pir::pir_namespace($target_nsp);
	my $body;

	if $target_nsp ne Pir::pir_namespace($namespace) {
		$body := qq{
	.local pmc target_sub
	target_sub = get_hll_global $target_nsp, '$target_name'
	{ $tailcall }target_sub(pos :flat, named :flat :named)
		};
	}
	else {
	my $P0 := '$P0';
		$body := qq {
	{ $tailcall }'$target_name'(pos :flat, named :flat :named)
		};
	}

	[ $body ];
}
