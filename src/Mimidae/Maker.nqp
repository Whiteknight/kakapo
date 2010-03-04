# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Mimus::Maker;

sub mock_class_name($parent) {
	our $_Next_id := 0
		unless $_Next_id;
	
	if $parent eq 'P6object' {
		$parent := '<anonymous>';
	}
	
	my $name := $parent ~ "::<mock{$_Next_id++;}>";
}

method make($parent? = 'P6object', :$named) {
	$named := $named || mock_class_name($parent);
	
	my $cuckoo := Mimus::Cuculus.new;
	my $mock_class := P6metaclass.new_class: $named, :parent( 'Mimus::Cuculus::Ovum' );
	P6metaclass.add_parent: $mock_class, $parent;

	# Now there's a proto-ovum. Back it up with a cuckoo.
	$cuckoo.init_egg($mock_class);

	$mock_class;
}
