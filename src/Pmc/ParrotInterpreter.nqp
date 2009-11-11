# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module ParrotInterpreter;
=module
	Methods for ParrotInterpreter PMC.
=end

Q:PIR {
	.include 'iglobals.pasm'
};

#method hll_map($core_type, $hll_type)		- built-in

#method run_gc()						- built-in

#method stdhandle($fileno, $newhandle?)		- built-in

method argv_list() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_ARGV_LIST ] };
	return $result;
}

method classname_hash() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_CLASSNAME_HASH ] };
	return $result;
}

method compreg_hash() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_COMPREG_HASH ] };
	return $result;
}

method config_hash() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_CONFIG_HASH ] };
	return $result;
}

method dyn_libs() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_DYN_LIBS ] };
	return $result;
}

method executable() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_EXECUTABLE ] };
	return $result;
}

sub get_interp() {
	return Opcode::getinterp();
}

method lib_paths() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_LIB_PATHS ] };
	return $result;
}

method nci_funcs() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_NCI_FUNCS ] };
	return $result;
}

method pbc_libs() {
	my $result := Q:PIR { %r = self[ .IGLOBALS_PBC_LIBS ] };
	return $result;
}

method iglobals_size() {
	my $result := Q:PIR { %r = box .IGLOBALS_SIZE] };
	return $result;
}
