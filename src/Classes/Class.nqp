# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Class;
#	Provides a class/subclass management library.

sub compile_default_multi($class_name, $multi_name, :$is_method) {
	my $kind := $is_method ?? 'multimethod' !! 'multisub';

	NOTE("Compiling default ", $kind, " for: ", 
		$class_name, " :: ", $multi_name);

	NOTE("Looking for fallback method in parent class(es)");
	my $default_method := Class::find_method_named($class_name, $multi_name);
	
	while Opcode::isa($default_method, 'MultiSub') {
		NOTE("I don't think nesting multisubs is possible, but...");
		$default_method := $default_method[0];
	}

	my @actions;
	
	unless $default_method {
		@actions := [
			"say 'No method available that will accept the following arguments:'",
			'$P0 = get_hll_global ["Dumper"], "DUMP_"',
			'$P0(pos)',
			"die 'No method available that will accept the arguments given'",
		];
	}

	compile_multi($class_name, $multi_name,
		:actions(@actions),
		:is_method($is_method),
		:target($default_method),
	);
}

sub get_method_list($obj) {
	my $class := Class::of($obj);

	unless Opcode::defined($class) {
		die("No class. Don't know what to do.");
	}

	my @methods := $class.methods.keys;
	return @methods;
}

sub signature(@types) {
	my @sig_names;
	
	for @types {
		my $type := ~ $_;
		my $type_sig := $type eq '_'
			?? $type
			!! "['" ~ $type.split('::').join(q<';'>) ~ "']";
		@sig_names.push($type_sig);
	}

	return @sig_names.join(", ");
}