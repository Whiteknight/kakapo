# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::DependencyQueue::AlreadyDone
	is Exception::Wrapper;

# A queue that orders its entries according to their prerequisites.
module DependencyQueue;

has %!added;
has %!already_done;
has %!cycle;
has @!cycle_keys;
has $!locked;
has %!pending;
has @!queue;

sub _pre_initload() {

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
	if self.already_done.contains($name) {
		Exception::DependencyQueue::AlreadyDone.new(
			:message("Added already-done $name to DependencyQueue")
		).throw;
	}

	if @requires.isa('String') { @requires := Array::new(@requires); }
	my @entry := Array::new($name, $value, @requires);
	self.pending{$name} := @entry;
}

my method already_added($name) {
	return self.already_done.contains($name)
		|| self.added.contains($name);
}

method _init_obj(*@pos, *%named) {
	self.locked(0);

	while @pos {
		self.mark_as_done: @pos.shift;
	}

	self._init_args(|@pos, |%named);
}

our method is_empty() {
	return self.locked
		?? self.queue.elems == 0
		!! self.pending.elems == 0;
}

our method mark_as_done($label) {
	self.already_done{$label} := 1;
}

our method next_entry() {
	unless self.locked {
		self.tsort_queue();
	}

	if self.queue.elems {
		my $node := self.queue.shift;
		self.mark_as_done($node[0]);
		$node[1];
	}
	else {
		Undef.new;
	}
}

our method reset() {
	self.locked(0);
	self.pending(Hash.new);
}

method tsort_queue() {
	self.locked(1);
	self.cycle_keys(Array::new());
	self.cycle(Hash.new());
	self.added(Hash.new());
	self.tsort_add_pending_entries(self.pending.keys);
}

my method tsort_add_pending_entries(@list) {
# Visits a list of keys, adding the attached calls to the queue in topological order.

	for @list {
		my $key := $_;

		if self.already_added($key) {
			next;
		}

		## Check for cycles in the graph.

		my $next_index := self.cycle_keys.elems;
		self.cycle_keys.push($key);

		if self.cycle.contains($key) {
			my @slice := self.cycle_keys.slice(:from(self.cycle{$key}));

			die("Cycle detected in dependencies: ", @slice.join(', '));
		}

		self.cycle{$key} := $next_index;

		## Put everything $key depends on ahead of $key

		if self.pending.contains($key) {
			my $node := self.pending{$key};
			my @prerequisites := $node[2];

			if +@prerequisites {
				self.tsort_add_pending_entries(@prerequisites);
			}

			## Finally, it's my turn.
			self.added{$key} := 1;
			self.queue.push($node);
		}
		else {
			die("$key is a requirement, but is not marked done, and not in the pending queue.");
		}
	}
}
