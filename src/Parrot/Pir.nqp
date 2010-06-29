# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Pir;
# Provide helper methods for constructing and compiling PIR code.

sub _pre_initload() {
	use(	Opcode,	:tags('DEFAULT', 'TYPE'));
	use(	Parrot,	:tags('NAMESPACE'));
}

sub compile($string) {
	my $compiler := pir::compreg__PS('PIR');
	$compiler($string);
}

sub compile_sub(:@body = "die 'I-i-i ain\'t got no- bo-dy!'", :$method, :@multi, :$name, :$namespace, :@params, :$vtable?) {
	unless does(@params, 'array') { @params := Array::new(@params); }
	unless does(@body, 'array') { @body := Array::new(@body); }
	unless ! @multi.defined || does(@multi, 'array') { @multi := Array::new(@multi); }

	$method := $method ?? ':method' !! '';
	my $multi := @multi ?? ":multi({ @multi.join(', ') })" !! '';
	$vtable := $vtable
		?? $vtable.isa('String') ?? ":vtable('$vtable')" !! ':vtable'
		!! '';

	my @sub_decl := Array::new(
		".namespace { pir_namespace($namespace); }",
		".sub '$name' $method $multi $vtable",
		|(@params.map: -> $param { "\t$param" }),
		"",
		|@body,
		".end\n",
	);

	my $sub := pir::join__SSP("\n", @sub_decl);
	compile($sub);
}

sub pir_namespace($nsp) {
	if pir::isa($nsp, 'P6protoobject') {
		$nsp := pir::typeof__SP($nsp);
	}

	if pir::isa($nsp, 'String') {
		$nsp ?? "[ '{ $nsp.split('::').join(q<'; '>) }' ]" !! '[ ]'
	}
	elsif pir::isa($nsp, 'NameSpace') {
                my @parts := $nsp.get_name();
                return "['" ~ pir::join__SSP("'; '", @parts) ~ "']";
	}
	else {
		die("Don't know how to format namespace name of ",
			pir::typeof__SP($nsp), " $nsp");
	}
}
