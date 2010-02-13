# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module DependencyQueue;
# A queue that orders its entries according to their prerequisites.

sub _pre_initload() {
# Special sub called to initialize this module.

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
		
our method add_entry($name, $value, :@requires?) {
	unless @requires { @requires := Array::new(); }
	
	my @entry := Array::new($name, $value, @requires);
	self.pending{$name} := @entry;
}

my method already_added($name) {
	return self.already_done.contains($name)
		|| self.added.contains($name);
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

method reset() {
	self.locked(0);
	self.pending(Hash::empty());
}

method tsort_queue() {
	self.locked(1);
	self.cycle_keys(Array::empty());
	self.cycle(Hash::empty());
	self.added(Hash::empty());
	self.tsort_add_pending_entries(self.pending.keys);
}

my method tsort_add_pending_entries(@list) {
# Visits a list of keys, adding the attached calls to the queue in topological order.

	for @list {
		my $key := $_;
		
		unless self.already_added($key) {
			## First, check for cycles in the graph.
			my $next_index := self.cycle_keys.elements;
			self.cycle_keys.push($key);

			if self.cycle.contains($key) {
				my @slice := self.cycle_keys.slice(:from(self.cycle{$key}));

				Program::die("Cycle detected in dependencies: ",
					@slice.join(', '),
				);
			}
			
			self.cycle{$key} := $next_index;

			## Put everything $key depends on ahead of $key
			
			if self.pending.contains($key) {
				my $node := self.pending{$key};
				my @prerequisites := $node[2];
				self.tsort_add_pending_entries(@prerequisites);
			
				## Finally, it's my turn.
				self.added{$key} := 1;
				self.queue.push($node);
			}
			else {
				Program::die("$key is a requirement, ",
					"but is not marked done, and not in the pending queue.");
			}
		}
	}
}