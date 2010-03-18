# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Sub;

sub set_dump_detail($level) {
	our $Dump_detail := $level;
}

sub get_dump_detail() {
	our $Dump_detail;
	
	if Opcode::isnull($Dump_detail) {
		$Dump_detail := 0;
	}
	
	return $Dump_detail;
}

method __dump($dumper, $label) {
	my @results		:= Parrot::call_tuple_method($dumper, 'newIndent');
	my $subindent	:= "\n" ~ @results.shift;
	my $indent		:= "\n" ~ @results.shift;
	
	if get_dump_detail() == 0 {
		print('\'', ~ self, '\'');
	}
	else {
		my $nsp := self.get_namespace;
		
		if ! Opcode::isnull($nsp) && Opcode::defined($nsp) {
			$nsp := pir::join('::', $nsp.get_name);
		}
		else {
			$nsp := '<no namespace>';
		}
		
		print('\'', ~self, '\'  {'); #'
		print($subindent, "Namespace : ", $nsp);
		
		my $flags := '';
		
		my $subid := self.get_subid;
		if ! Opcode::isnull($subid) && $subid { $flags := " subid('" ~ $subid ~ "')"; }
		
		my $outer := self.get_outer;
		if ! Opcode::isnull($outer) && $outer { $flags := " outer('" ~ $outer ~ "')"; }
		
		print($subindent, "Flags     :", $flags ?? $flags !! '<none>');
		
		print($subindent, "Parameters: (+", Opcode::inspect_string(self, "pos_required"), 
			", ?", Opcode::inspect_string(self, "pos_optional"),
			Opcode::inspect_string(self, "pos_slurpy") ?? ", *@" !! '',
			", :+", Opcode::inspect_string(self, "named_required"),
			", :?", Opcode::inspect_string(self, "named_optional"),
			Opcode::inspect_string(self, "named_slurpy") ?? ", *%" !! '',
			")");
		print($indent, '}');
	}
	
	$dumper.deleteIndent();
}
