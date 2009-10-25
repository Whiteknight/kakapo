module Global;

_ONLOAD(); 

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;

}

=sub export(*@symbols, :$as?, :@tags?)

Adds a list of symbols - either String names or Subs - to one or more export 
groups.

If a String is passed to identify the symbol, then the String will be the export
name of the symbol.

The symbol is added to all of the export groups named in C<@tags>.  This allows
definition of partially overlapping tag sets, by adding the common symbols to
multiple tags:
    Global::export('c1', 'c2', 'c3', :tags('A', 'B'));
    Global::export('a1', 'a2', :tags('A'));     # A include a1, a2, c1, c2, c3
    Global::export('b1', :tags('B'));           # B includes b1, c1, c2, c3

If no tags are specified, the tag 'DEFAULT' is used. (This is the same tag used
by C<import> when no other tags are specified.)

The option C<:as($name)> can only be used with a single symbol. In this case,
the symbol - which in this case may be an object, or the String name of an 
object - is added to the specified export tags under the C<$name> given. (This
can be used to export dynamically created objects, or to export some other 
module's code under your own name.)

=cut

sub export($symbol, *@symbols, :$as?, :$namespace?, :@tags?) {
	unless @symbols { @symbols := Array::empty(); }
	@symbols.unshift($symbol);
	if ! Parrot::defined(@tags) { @tags := Array::new('DEFAULT'); }
	elsif Parrot::isa(@tags, 'String') { @tags := Array::new(@tags); }
	
	my $source_nsp := Parrot::defined($namespace)
		?? $namespace
		!! Parrot::caller_namespace(2);
	
	if Parrot::isa($source_nsp, 'String') {
		$source_nsp := Parrot::get_namespace($source_nsp);
	}

	my $export_nsp := $source_nsp.make_namespace('EXPORT');
	
	@tags.push('ALL');
	
	for @tags {
		my $tag_nsp := $export_nsp.make_namespace(~ $_);
		
		if Parrot::defined($as) {
			my $export_sym := $symbol;
			if Parrot::isa($export_sym, 'String') {
				$export_sym := $source_nsp.get_sym($export_sym);
			}
			
			$tag_nsp{$as} := $export_sym;
		}
		else {
			$source_nsp.export_to($tag_nsp, @symbols);
		}
	}
}

=sub register_global($name, $object, :$namespace?)

Registers a symbol C<$name> in the Global:: namespace, bound to C<$object>.

This function is used to create global variables. The C<:namespace()> option
may be specified to use another namespace in preference to Global.

The intended usage pattern is that the Global namespace serves as a D<Registry>
for locating shared objects and services.

=cut

sub register_global($name, $object, :$namespace?) {
	unless $namespace { $namespace := 'Global'; }

	my $nsp := Parrot::get_namespace($namespace);
	$nsp{$name} := $object;
	export($name, :namespace($namespace));
}

=sub use($module?, :import('TAG', ...)?, :symbols('name', ...)?)

Imports global symbols into the caller's namespace. If neither C<:import> nor
C<:symbols> are specified, C<:import('DEFAULT')> is assumed.

The strings given to C<:import> are tag names. The C<DEFAULT> tag is one 
of two special tag names known to the system. Otherwise, each module may 
define its own tagging scheme. (The other predefined tag is C<ALL>.)

If C<:symbols> are specified, specific symbol names may be imported. The 
symbols must be in the target module's C<ALL> export group, as this is where
they are looked up. (This will normally be true, unless the same name has been
used for different exports in different TAGS. In which case, don't do that.)

If no C<$from> module is specified, the default is the Global:: module itself. 
This is a shortcut for defining global variables, in conjunction with the
C<register_global> function. (q.v.)

=cut

sub use($module?, :@import?, :@symbols?) {
	if ! Parrot::defined($module) { $module := Parrot::caller_namespace(); }
	elsif Parrot::isa($module, 'String') { $module := Parrot::get_hll_namespace($module); }
	if ! Parrot::defined(@import) { @import := Array::empty(); }
	elsif Parrot::isa(@import, 'String') { @import := Array::new(@import); }
	if ! Parrot::defined(@symbols) { @symbols := Array::empty(); }
	elsif Parrot::isa(@symbols, 'String') { @symbols := Array::new(@symbols); }

	if +@import == 0 && +@symbols == 0 {
		@import.push('DEFAULT');
	}	

	my $export_nsp := $module.make_namespace('EXPORT');
	my $target_nsp := Parrot::caller_namespace(2);

	if $module<_ONLOAD> {
	say("Running _ONLOAD for ", $module.get_name.join('::'));
		$module<_ONLOAD>();
	}
	
	if @import {
		for @import {
			my $source_nsp := $export_nsp.make_namespace(~ $_);
			
			if $source_nsp.keys {
				$source_nsp.export_to($target_nsp, $source_nsp.keys);
			}
		}
	}
	
	if +@symbols {
		$export_nsp{'ALL'}.export_to($target_nsp, @symbols);
	}
}
