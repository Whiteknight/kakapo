module DependencyQueue;
=module
Always after.

Program::_initload(:after(...)) as before

always store the constraints

process the constraints in a bunch

save each key in an "already run" cache

reset the q completely after processing.
=end

_pre_initload();

method added(*@value)		{ self._ATTR_HASH('added', @value); }
method already_done(*@value)	{ self._ATTR_HASH('already_done', @value); }
method cycle(*@value)		{ self._ATTR_HASH('cycle', @value); }
method cycle_keys(*@value)	{ self._ATTR_ARRAY('cycle_keys', @value); }
method open(*@value)		{ self._ATTR_HASH('open', @value); }
method pending(*@value)		{ self._ATTR_HASH('pending', @value); }
method queue(*@value)		{ self._ATTR_ARRAY('queue', @value); }
	
method add_entry($name, $value, :@requires?) {
	unless @requires { @requires := Array::new(); }
	
	my @entry := Array::new($name, $value, @requires);
	self.pending{$name} := @entry;
}

method already_added($name) {
	return self.already_done{$name} || self.added{$name};
}

method init(@args, %opts) {
	for @args {
		self.mark_as_done(~ $_);
	}
	
	self.open(1);
}

method is_empty() { 
	if self.open {
		return self.pending.elements == 0;
	}
	
	return self.queue.elements == 0;
}

method mark_as_done($label) {
	self.already_done{$label} := 1;
}

method marked_done($label) {
	return self.already_done{$label};
}

method next() {
	if self.open {
		self.tsort_queue();
	}

	if self.queue.elements {
		my $node := self.queue.shift;
say("Next node: ", $node[0]);
		self.mark_as_done($node[0]);
		return $node[1];
	}
	
	return my $undef;
}

sub _pre_initload() {
	if our $_Pre_initload_done { return 0; }
	$_Pre_initload_done := 1;
	
	Global::use('Dumper');
	
	Class::SUBCLASS('DependencyQueue', 
		'Class::HashBased');
}

method reset() {
	self.open(1);
	self.pending(Hash::empty());
}

method tsort_queue() {
	self.open(0);
	self.cycle_keys(Array::empty());
	self.cycle(Hash::empty());
	self.added(Hash::empty());

	self.tsort_add_keys(self.pending.keys);
}

method tsort_add_keys(@list) {
=method
	Visits a list of keys, adding the attached calls to the queue in topological order.
=end

	for @list {
		my $key := $_;		
		
		unless self.already_added($key) {
			## First, check for cycles in the graph.
			my $cycle_elts := self.cycle_keys.elements;
			self.cycle_keys.push($key);
			
			if self.cycle.exists($key) {
				my @slice := self.cycle_keys.slice(:from(self.cycle{$key}));

				Opcode::die("Cycle detected in dependencies: ",
					@slice.join(', '),
				);
			}
			
			self.cycle{$key} := $cycle_elts;
			
			## Put everything $key depends on ahead of $key
			my $node := self.pending{$key};
			
			my @prerequisites := $node[2];
			self.tsort_add_keys(@prerequisites);
			
			## Finally, it's my turn.
			self.added{$key} := 1;
			self.queue.push($node);
		}
	}
}