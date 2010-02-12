# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module DependencyQueue;
# A queue that orders its entries according to their prerequisites.

our method add_entry($name, $value, :@requires?) {
	unless @requires { @requires := Array::new(); }
	
	my @entry := Array::new($name, $value, @requires);
say("add_entry");
Dumper::DUMP_(@entry);
pir::backtrace();
	self.pending{$name} := @entry;
}

my method already_added($name) {
	return self.already_done{$name} || self.added{$name};
}

method _init_positional_(@pos) {
	for @pos {
		self.mark_as_done(~ $_);
	}
	
	self.locked(0);
}

our method is_empty() {
	return self.locked
		?? self.queue.elements == 0
		!! self.pending.elements == 0;
}

our method mark_as_done($label) {
	self.already_done{$label} := 1;
}

our method next() {
	unless self.locked {
		self.tsort_queue();
	}

	if self.queue.elements {
		my $node := self.queue.shift;
		self.mark_as_done($node[0]);
		return $node[1];
	}
	
	return Undef.new;
}

sub _pre_initload() {
	use(	'P6metaclass' );
	
	has(	'%!added',
		'%!already_done',
		'%!cycle',
		'@!cycle_keys',
		'$!locked',
		'%!pending',
		'@!queue'
	);
}
		
method reset() {
	self.locked(0);
	self.pending(Hash::empty());
}

method tsort_queue() {
say("Tsort queue");
	self.locked(1);
	self.cycle_keys(Array::empty());
	self.cycle(Hash::empty());
	self.added(Hash::empty());

	self.tsort_add_keys(self.pending.keys);
}

method tsort_add_keys(@list) {
# Visits a list of keys, adding the attached calls to the queue in topological order.

Dumper::DUMP_(@list);
	for @list {
		my $key := $_;		
say("key: $key");		
		unless self.already_added($key) {
	say("adding");
			## First, check for cycles in the graph.
			my $cycle_elts := self.cycle_keys.elements;
	say("cycle checked");
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