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

sub compile_sub(:@body, :$name, :$namespace, :$method?, :@params?, :$vtable?) {
	if ! @params.defined { @params := Array::empty(); }
	elsif ! does(@params, 'array') { @params := Array::new(@params); }
	unless does(@body, 'array') { @body := Array::new(@body); }
	
	my @sub_decl := Array::new(".sub '" ~ $name ~ "'");
	
	if $method {
		@sub_decl.push(":method");
	}
	
	if $vtable {
		if $vtable.isa('String') {
			if $vtable[0] ne "'" && $vtable[0] ne '"' {
				$vtable := "'" ~ $vtable ~ "'";
			}
			
			@sub_decl.push(":vtable(" ~ $vtable ~ ")");
		}
		else {
			@sub_decl.push(":vtable");
		}
	}
	
	@sub_decl := Array::new(@sub_decl.join(' '));
	@sub_decl.unshift(".namespace " ~ pir_namespace($namespace));
	
	for @params {
		@sub_decl.push("\t" ~ $_);
	}

	if @params {
		@sub_decl.push('');
	}
	
	@sub_decl.append(@body);
	@sub_decl.push(".end\n");
	
	my $sub := @sub_decl.join("\n");
	compile($sub);
}

sub pir_namespace($nsp) {
	unless Opcode::isa($nsp, 'String') {
		$nsp := Parrot::namespace_name($nsp);
	}
	
	my @parts := $nsp.split('::');
	
	my $result := "[";
	
	if @parts {
		$result := $result 
			~ " '" 
			~ @parts.join("' ; '")
			~ "'";	# no space!
	}
	
	$result := $result ~ " ]";	# space: [ ] or [ 'foo' ]
	return $result;
}
