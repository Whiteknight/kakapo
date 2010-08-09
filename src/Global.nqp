# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# =NAME Global - provides global symbol manipulation functions.
#
# =DESCRIPTION
#
# This module exports (to the root namespace) a set of functions for perl-like management 
# of global symbols. 
#
# =SYNOPSIS
#
# =begin code
#
#	 use( 'Any::Module' );
#	 use( 'Some::Other::Module', :tags('A', 'B'));
#
# 	export('foo', 'bar', 'baz', :tags('SPECIAL', 'DEFAULT'));
#
# =end code
#
# B<NOTE:> This module is one of the very first modules initialized in the Kakapo library. Because of 
# this, it must call no external functions that depend on being initialized. (In general, only calls to
# Parrot support subs should be made: Opcode, pir::, Parrot)

module Global;

# Special sub called when the Kakapo library is loaded or initialized. This is to guarantee this 
# module is available during :init and :load processing for other modules.

our sub _pre_initload() {
	inject_root_symbol( Global::use );
	inject_root_symbol( Global::export );
}

# =signature	export($symbol [...], [ :namespace(_), ] [ :tags( [ string [...] ] ) ] )
# =signature	export($symbol, :as(<name>), [:namespace(_), ] [ :tags( [ string [...]] ) ] )
#
# Adds a list of symbols - either String names or Subs - to one or more export groups. If a String is passed 
# to identify the symbol, then the String will be the export name of the symbol.
#
# If desired, a C< :namespace(_) > may be provided, either a String or a NameSpace object, that specifies
# the namespace of the symbol(s) being exported. This can be used to add a different namespace's symbols
# to the current module's export set.
#
# If no C< :tags > are given, the tag 'DEFAULT' is used. (This is the same tag used by C<import> when no 
# other tags are specified.) The symbol is added to all of the export groups named in C< :tags >. This allows
# definition of partially overlapping tag sets, by adding the common symbols to multiple tags:
#
#	export( 'c1', 'c2', 'c3', :tags('A', 'B'));
#	export( 'a1', 'a2', :tags('A'));		# A include a1, a2, c1, c2, c3
#	export( 'b1', :tags('B'));		# B includes b1, c1, c2, c3
#
# The option C<:as($name)> can only be used with a single symbol. In this case, the symbol - which in this 
# case may be an object, or the String name of an object - is added to the specified export tags under the 
# C<$name> given. (This can be used to export dynamically created objects, or to export some other module's 
# sub under a different name.)
#
# Note finally that there are two I< reserved > tag names: C< ALL > and C< DEFAULT >. The C< DEFAULT >
# tag, as mentioned above, is used if no C< :tags > are specified. Similarly, calls to L<C< use >> that do 
# not specify any tags will import the C< DEFAULT > tag. The C< ALL > tag is automatically attached to 
# every exported symbol. This is more to support L<C< use >>-ing a particular symbol than anything else,
# but it is a valid import tag.

our sub export($symbol, *@symbols, :$as?, :$namespace = Parrot::caller_namespace(), :@tags?) {
	if pir::isa($symbol, 'String') || ! pir::does__IPS($symbol, 'array') {
		@symbols.unshift($symbol);
	}
	else {
		@symbols := $symbol;	# Array: <name name name>
	}

	if ! pir::isa(@tags, 'ResizablePMCArray') { @tags := [ @tags ]; }
	elsif +@tags == 0 { @tags.push('DEFAULT'); }

	if Opcode::isa($namespace, 'String') {
		$namespace := Parrot::get_hll_namespace($namespace);
	}

	my $export_nsp := Parrot::caller_namespace().make_namespace('EXPORT');
	
	@tags.push('ALL');
	
	for @tags {
		my $tag_nsp := $export_nsp.make_namespace(~ $_);
		
		if Opcode::defined($as) {
			my $export_sym := @symbols[0];
			if Opcode::isa($export_sym, 'String') {
				$export_sym := $namespace.get_sym($export_sym);
			}

			inject_symbol($export_sym, :as($as), :namespace($tag_nsp));
		}
		else {
			$namespace.export_to($tag_nsp, @symbols);
		}
	}
}

our sub inject_root_symbol($pmc, :$as, :$force) {
	my $hll_namespace := pir::get_hll_namespace__P();
	inject_symbol($pmc, :as($as), :namespace($hll_namespace), :force($force));
}

our sub inject_symbol($object, :$namespace, :$as?, :$force?) {
# Injects a PMC C< $object > into a C< $namespace >, optionally C< $as > a certain name. For C< Sub > and 
# C< MultiSub > PMCs, the name is not a requirement since they know their own names. For other PMC types,
# including injecting variable rather than functions, the C< $as > name must be provided by the caller. If 
# C< $force > is specified, any pre-existing symbol is overwritten. Otherwise, if a name collision occurs
# FIXME: an exception should be thrown, but currently isn't.

	$as := $as // ~$object;	# Subs carry their name.

	unless pir::isa($namespace, 'NameSpace') {
		$namespace := Opcode::get_hll_namespace($namespace);
	}

	# NB: find_var searches for *anything*, while find_sub requires isa(sub). In this case,
	# any collision is bad.
	if ! $force && Opcode::defined($namespace.find_var($as)) {
		my $ns_name := pir::join__SSP('::', $namespace.get_name);
		pir::say("Warning: symbol $as already exists in namespace $ns_name");
		Sub::set_dump_detail(1);
		_dumper($namespace.find_var($as));
		return 0;
	}
	
	$namespace.add_var($as, $object);
}

# Registers a symbol C< $name > in the C< Global:: > namespace, bound to C< $object >.
#
# This function is used to create global symbols. The C< :namespace() > option may be specified to use 
# a different namespace than Global. The intended usage pattern is that the Global namespace serves 
# as a I< Registry > for locating shared objects and services.

our sub register_global($name, $object, :$namespace? = 'Global') {
	if Opcode::isa($namespace, 'String') {
		$namespace := $namespace.split('::');
	}
	
	my $nsp := pir::get_hll_namespace__P();
	$nsp := $nsp.make_namespace($namespace);
	
	$nsp{$name} := $object;	
	export($name, :namespace($nsp));
}

our sub use($module = Parrot::caller_namespace(0), :@except?, :@tags?, :@symbols?) {
# Imports global symbols into the caller's namespace. If neither C<:tags> nor
# C<:symbols> are specified, C< :tags('DEFAULT') > is assumed.

# The strings given to C<:tags > are tag names. The C<DEFAULT> tag is one 
# of two special tag names known to the system. Otherwise, each module may 
# define its own tagging scheme. (The other predefined tag is C<ALL>.)

# If C<:symbols> are specified, specific symbol names may be imported. The 
# symbols must be in the target module's C<ALL> export group, as this is where
# they are looked up. (This will normally be true, unless the same name has been
# used for different exports in different TAGS. In which case, don't do that.)

# If no source C< $module > is specified, the default is the Global:: module itself. 
# This is a shortcut for defining global variables, in conjunction with the
# C<register_global> function. (q.v.)

# Any symbols listed in C< @except > will I< not > be imported, regardless of how the
# symbol list is generated. This allows the caller to block certain symbols, perhaps 
# in order to rename or override them.

	if pir::isa(@tags, 'String')		{ @tags	:= [ @tags ]; }
	if pir::isa(@symbols, 'String')	{ @symbols	:= [ @symbols ]; }

	if pir::isa($module, 'P6object')	{ $module	:= Opcode::typeof($module); }
	if pir::isa($module, 'String')	{ $module	:= Parrot::get_hll_namespace($module); }

	if +@tags == 0 && +@symbols == 0 {
		@tags.push('DEFAULT');
	}	

	my $export_nsp := $module.make_namespace('EXPORT');
	my $target_nsp := Parrot::caller_namespace();

	my %except;
	
	for @except {
		%except{$_} := 1;
	}
	
	for @tags {
		my $source_nsp := $export_nsp.make_namespace(~ $_);
		my @tag_symbols;
		
		for $source_nsp {
			unless %except{$_} {
				@tag_symbols.push(~ $_);
			}
		}
			
		if +@tag_symbols {
			$source_nsp.export_to($target_nsp, @tag_symbols);
		}
	}
	
	if +@symbols {
		$export_nsp{'ALL'}.export_to($target_nsp, @symbols);
	}
}
