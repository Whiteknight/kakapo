# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Sub;

method __dump($dumper, $label) {
	my @results		:= Parrot::call_tuple_method($dumper, 'newIndent');
	my $subindent	:= "\n" ~ @results.shift;
	my $indent		:= "\n" ~ @results.shift;
	
	my $nsp := self.get_namespace;
	
	if ! Opcode::isnull($nsp) && Opcode::defined($nsp) {
		$nsp := $nsp.get_name.join('::');
	}
	else {
		$nsp := '<no namespace>';
	}
	
	print('\'', ~self, '\'  {'); #'
	print($subindent, "Namespace : ", $nsp);
	
	my $flags := '';
	if my $subid := self.get_subid	{ $flags := " subid('" ~ $subid ~ "')"; }
	if my $outer := self.get_outer	{ $flags := " outer('" ~ $outer ~ "')"; }
	print($subindent, "Flags     :", $flags ?? $flags !! '<none>');
	
	print($subindent, "Parameters: (+", Opcode::inspect_string(self, "pos_required"), 
		", ?", Opcode::inspect_string(self, "pos_optional"),
		Opcode::inspect_string(self, "pos_slurpy") ?? ", *@" !! '',
		", :+", Opcode::inspect_string(self, "named_required"),
		", :?", Opcode::inspect_string(self, "named_optional"),
		Opcode::inspect_string(self, "named_slurpy") ?? ", *%" !! '',
		")");
	print($indent, '}');
	$dumper.deleteIndent();
}
