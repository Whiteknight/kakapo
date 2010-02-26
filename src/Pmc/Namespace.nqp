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

method string_name(:$format, :$with_hll) {
	$format := $format // 'perl6';
	
	my @parts := self.get_name;
	my $delim := ($format eq 'pir') ?? "'; '" !! '::';

	@parts.shift unless $with_hll;
	
	($format eq 'pir') 
		?? "['" ~ @parts.join($delim) ~ "']"
		!! @parts.join('::');
}