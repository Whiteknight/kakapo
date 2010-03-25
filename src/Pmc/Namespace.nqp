# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module NameSpace;
# Provides missing methods to NameSpace PMC.

# TODO: I'd like to add a 'new' that maps to make_namespace.

method contains($name) {
	! pir::isnull__IP(self.find_var($name))
	|| !pir::isnull__IP(self.find_namespace($name));
}

method __dump($dumper, $label) {
	my @results		:= Parrot::call_tuple_method($dumper, 'newIndent');
	my $subindent	:= "\n" ~ @results.shift;
	my $indent		:= "\n" ~ @results.shift;

	my $name := self.string_name(:format('pir'), :with_hll);
	
	print($name, ' {');

	for self {
		print($subindent, $_.key);
		$dumper.dump($label, $_.value);
		print(',');
	}
	
	print($indent, '}');
	$dumper.deleteIndent;
}

method fetch($name, :$relative = 0) {
	my @parts;
	
	die("Currently this only accepts String names")
		unless pir::isa($name, 'String');
		
	if $relative {
		die("You must use a real namespace (not a protoobject) as the base for a :relative fetch")
			if pir::isa(self, 'P6protoobject');
		
		@parts := self.get_name;
		@parts.append: $name.split('::');
	}
	else {
		@parts := $name.split(';');
		my $elems := @parts.elems;
		
		die("Invalid namespace specification: '$name'")
			if $elems > 2;

		@parts.unshift('parrot') 
			if $elems == 1;
		
		my $hll_relative := @parts.pop;
		@parts.append: $hll_relative.split('::');
	}
	
	my $root_nsp := pir::get_root_namespace__P();
	my $namespace := $root_nsp.make_namespace(@parts);
	$namespace;
}

method string_name(:$format, :$with_hll) {
	$format := $format // 'perl6';
	
	my @parts := self.get_name;
	my $delim := ($format eq 'pir') ?? "'; '" !! '::';

	@parts.shift unless $with_hll;
	
	($format eq 'pir') 
		?? "['" ~ @parts.join($delim) ~ "']"
		!! @parts.join('::');
}