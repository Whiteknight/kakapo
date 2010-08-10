# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Pmc::Namespace;
# Provides missing methods to NameSpace PMC.

sub _pre_initload() {
	export_methods_to('NameSpace');
}

# TODO: I'd like to add a 'new' that maps to make_namespace.

method contains($name) {
	! pir::isnull__ip( self.find_var: $name )
	|| ! pir::isnull__ip( self.find_namespace: $name );
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

our sub export_methods_to($to_nsp_name, $from_nsp = Parrot::caller_namespace(), :@methods = $to_nsp_name) {
	my %methods := _get_methods($from_nsp);
	my $to_nsp := pir::get_hll_namespace__pp( pir::split__ps('::', $to_nsp_name) );
	
	unless @methods =:= $to_nsp_name {
		my %methods2;
		
		for @methods {
			%methods2{ ~ $_ } := %methods{ ~ $_ };
		}
		
		%methods := %methods2;
	}
	
	for %methods -> $pair {
		my $name := $pair.key;
		my &sub := $pair.value;
		$to_nsp.add_sub($name, &sub);
	}
}

method export_methods_to($to_nsp_name, :@methods = $to_nsp_name) {
	export_methods_to($to_nsp_name, self, :methods(@methods));
}

method export_method($name, :$as = $name, :@tags?) {
	self.export_sub($name, :as($as), :lookup<get_method>, :tags(@tags));
}

method export_sub($name, :$as? = $name, :$lookup = 'find_sub', :@tags?) {
	if ! pir::does__ips(@tags, 'array') {
		@tags := [ @tags ];
	}
	elsif +@tags == 0 {
		pir::push__vpp( @tags, 'DEFAULT' );
	}

	pir::push__vpp( @tags, 'ALL' );
	my $export_nsp := self.make_namespace: 'EXPORT';
	my &sub := ($lookup eq 'find_sub' 
		?? self.find_sub($name) 
		!! self.get_method($name)
	);
	
	for @tags -> $tag {
		my $tag_nsp := $export_nsp.make_namespace: ~$tag;
		$tag_nsp.add_sub($as, &sub);
	}
	
	&sub;
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

method get_method($name) {
	$name := ~ $name;
	#say("Getting method $name from namespace " ~ self);
	
	my %methods := self.get_methods;
		
	if pir::isnull__ip(%methods) {
		die("Could not find methods hash for namespace " ~ self);
	}
		
	my &method := %methods{ $name };
	&method;
}

sub _get_methods($nsp) {
	my $class := pir::inspect__pps($nsp, 'class');
	my %methods;
	
	if pir::isnull__ip($class) {
		%methods := pir::inspect__pps($nsp, 'methods');
	}
	else {
		%methods := pir::inspect__pps($class, 'methods');
	}
	
	%methods;
}

method get_methods() {
	_get_methods(self);
}

our method install_method($name, &method) {

	my $class := self.get_class;
	
	if pir::isnull__ip( $class ) {
		# WARNING: TT#1718 may bite here if name != method.name
		self.add_sub($name, &method);
	}
	else {
		my $metaclass := pir::getprop__psp( 'metaclass', $class );
		my $protoobject := pir::getattribute__pps( $metaclass, 'protoobject' );
		my $protoclass := pir::class__pp( $protoobject );

		if pir::defined( $class.methods{ $name } ) {
			$class.remove_method: $name;
		}
		
		$class.add_method: $name, &method;
		
		unless $protoclass.find_method( $name ) =:= &method {
			if pir::defined( $protoclass.methods{ $name } ) {
				$protoclass.remove_method: $name;
			}
			
			$protoclass.add_method: $name, &method;
			$protoclass.clear_method_cache;
		}			
	}
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