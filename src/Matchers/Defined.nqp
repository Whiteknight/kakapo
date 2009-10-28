# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Matcher::Defined;
=module
	Asserts that a value is not undef.
=end

Global::use('Dumper');	
Program::initload(:after('Matcher'));
Matcher::Factory::export_sub(Matcher::Defined::factory, :as('defined'));

sub _initload() {
	if our $_Initload_done { return 0; }
	$_Initload_done := 1;
			
	my $class_name := 'Matcher::Defined';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Matcher'
	);
}

method describe_self($description) {
	return $description ~ "a defined object";
}

sub factory()				{ Matcher::Defined.new(); }

method matches(*@value) {
	unless +@value {
		Opcode::die("A value must be passed to matches($item)");
	}

	my $result := Opcode::defined(@value[0]);		
	return $result;
}
