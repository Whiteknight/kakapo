# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Kakapo::Pmc::COMMON;
# Provides some common methods to all PMC types.

sub _pre_initload() {
	my @pmcs := Array::new(
		'Float',
		'Sub',
		'Undef',
	);
	
	my $from_nsp := Opcode::get_namespace();
	
	for @pmcs {
		my $pmc_type := ~ $_;
		my %export_subs := Hash::new();		
		my $to_nsp := Opcode::get_hll_namespace($pmc_type);

		# NB: Moving this line down causes strange failures.
		P6metaclass::register_pmc_type($pmc_type);

		unless $to_nsp.contains('new') {
			my &new := Pir::compile_sub(
				:name('new'),
				:namespace($pmc_type),
				:method(1),
				:body( (
					"\t" ~ '$P0' ~ " = new [ '$pmc_type' ]",
					"\t" ~ '.return ($P0)',
				) ),
			);
			
			$to_nsp.add_sub('new', &new);
		}
		
		for $from_nsp {
			my $name := ~ $_;
			
			unless $name eq '_pre_initload' 
				|| $to_nsp.contains($name) {
				%export_subs{$name} := $from_nsp{$name};
			}
		}
		
		$from_nsp.export_to($to_nsp, %export_subs);
	}
}

method can($method)			{ pir::can(self, $method); }
method clone()				{ pir::clone(self); }
method defined()				{ 1 }
method does($role)				{ pir::does(self, $role); }
method isa($type)				{ pir::isa(self, $type); }

# method new() { ... }  # Generated above.
