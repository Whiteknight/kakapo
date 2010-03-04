# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Class;
# Methods for PMC class C< Class >. Note that NPQ classes are built using the P6object
# library, which wraps C< Class > in considerable layers. 

method __dump($dumper, $label) {
	my @results		:= Parrot::call_tuple_method($dumper, 'newIndent');
	my $subindent	:= "\n" ~ @results.shift;
	my $indent		:= "\n" ~ @results.shift;

	my $name := ~ self;
	my $nsp := self.get_namespace;
	
	unless pir::isnull($nsp) {
	say("Namespace is legit");
		$name := Parrot::namespace_name($nsp);
	}

	print($name, ' {');
	
	my $comma := '';
	my @attributes := self.inspect('attributes').keys;
	
	if @attributes {
		print($subindent, "---- Attributes");
		
		@attributes.sort;
		
		for @attributes {
			print($comma, $subindent, ~ $_);
			$comma := ',';
		}
	}
	
	my %methods_seen;

	my @parents := self.inspect('all_parents');
	
	if @parents == 0 {
		print($subindent, "<No parents, even myself. This class is messed up.>");
	}
	else {
		for @parents {
			my $label := ($_ =:= self) 
				?? "---- Methods defined locally" 
				!! "---- Methods inherited from " 
					~ Parrot::namespace_name($_.get_namespace);
			
			my %methods := $_.methods;

			if %methods {
				print($subindent, $label);
				
				my @methods := %methods.keys;
				@methods.sort;
				my $arrow := String::repeat(' ', 24) ~ ' => ';
				
				for @methods {
					my $name := ~ $_;
					
					unless %methods_seen{$name} {
						print($subindent, $name);
						print($arrow.substr($name.length > 24 ?? 24 !! $name.length));
						$dumper.dump($label, %methods{$name});
						print(',');
						%methods_seen{$name} := 1;
					}
				}
			}
		}
	}	
	
	print($indent, '}');
	$dumper.deleteIndent;
}

#method add_attribute($name, $type?)		- built-in

#method add_method($name, &sub)		- built-in

#method add_parent($parent)			- built-in

#method add_role($role, :$alias?, :$exclude?)	- built-in

#method add_vtable_override($name, &sub)	- built-in

#method attributes()				- built-in

#method does($role_name)				- built-in

#method find_method($name)			- built-in

#method get_namespace()				- built-in

#method inspect($what?)				- built-in

#method isa($class_name)				- built-in

#method methods()					- built-in

#method name($name?)				- built-in

#method new(*%args)				- built-in

#method parents()					- built-in

#method remove_method($name)			- built-in

#method resolve_method(@resolve_list?)		- built-in

#method roles()					- built-in
