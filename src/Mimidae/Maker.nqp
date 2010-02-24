# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Mimus::Maker;

method next_id() {
	our $_Next_id := 0
		unless $_Next_id;
	$_Next_id++;
}

our method mock($name?, :$of) {
	die( 'Error: :of(null) - Attempting to create mock of uninitialized class?' )
		if pir::isnull($of);
	
	my $parent_class := 'P6object';

	for <Class NameSpace PMCProxy String> {
		if $of.isa(~ $_) {
			$parent_class := $of;
			last();
		}
	}

	$parent_class := P6metaclass.get_parrotclass($of);
	
	unless $name {
		$name := 'Mock::' ~ self.next_id ~ '::' 
		~ (pir::isnull($parent_class) ?? '<anonymous>' !! ~$parent_class);
	}
		
	my $mock := P6metaclass.new_class($name, :parent('Mimus::SuiGeneris'));
	P6metaclass.add_parent($mock, $parent_class);

	my $parrotclass := P6metaclass.get_parrotclass($mock);
	
	my @methods := self.find_methods_of($parent_class);
	
	for self.find_methods_of($parent_class) -> $method {
		self.mock_method($parrotclass, $method);
	}
	
	$mock;
}

my method find_methods_of($class, :$root = 'P6object') {
	
	die( '$class parameter must be a Class' )
		unless $class.isa('Class');
	
	if $root.isa('String') {
		$root := P6metaclass.get_parrotclass($root);
	}
	
	die( '$root parameter must be a classname or a class object' )
		unless ! pir::isnull($root) && $root.isa('Class');
	
	my %root_methods := $root.methods;
	my %mock_methods;

	my @mro := $class.inspect('all_parents');
	
	my %parent_methods;
	my $parent;
	
	while @mro {
		$parent := @mro.shift;
		
		last() if $parent =:= $root;
		%parent_methods := $parent.methods;
		
		for %parent_methods {
			if %mock_methods.contains( ~ $_ )
				|| %parent_methods{ $_ } =:= %root_methods{ $_ }
				{
				next();
			}
			
			%mock_methods{ ~$_ } := %parent_methods{ ~ $_ };
		}
		
	}
	
	%mock_methods.keys;
}

my method mock_method($parrotclass, $method) {
	my @body := (
		"\t" ~ q{$P0 = get_hll_global ['Mimus'], 'log_call'},
		"\t" ~ q{$P0(self, '} ~ $method ~ q{', pos, named)},
		"\t" ~ q{.return (self)},
	);

	my &sub := Pir::compile_sub(	:method,
		:name($method),
		:namespace($parrotclass.get_namespace),
		:params(
			".param pmc pos :slurpy",
			".param pmc named :slurpy :named",
		),
		:body(@body),
	);

	# Apparently, classes glom on to all their inherited methods at create time?
	# Anyway, this to address "method some-inherited-method already in namespace..."
	$parrotclass.remove_method($method);
	$parrotclass.add_method($method, &sub);
}