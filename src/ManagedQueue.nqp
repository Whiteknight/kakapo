module ManagedQueue;

Program::initload(:after('Class', 'Dumper', 'Global'));

sub _initload() {
	Global::use('Dumper');

	my $class_name := 'ManagedQueue';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Class::HashBased',
	);	
}

sub after($q, @items) {
	if Parrot::isa(@items, 'String') { @items := Array::new(@items); }
	
	my $index := $q.elements;
	
	while $index >= 0 {
		$index--;
		
		for @items {
			if $q[$index].key eq ~$_ {
				return $index + 1;
			}
		}
	}
	
	return -1;
}
	
sub before($q, @before) {
	if Parrot::isa(@before, 'String') { @before := Array::new(@before); }
	
	my $index := 0;

	while $index < $q.elements {
		for @before {
			if $q[$index].key eq ~$_ {
				return $index;
			}
		}
		
		$index++;
	}
	
	return -1;
}

method contains($key) {
	return self.first_index_of($key) != -1;
}

method delete($item, *@items) {
	if +@items { @items.unshift($item); }
	else { @items := Array::new($item); }
	
	for @items {
		my $index := self.first_index_of($_);
		
		if $index >= 0 {
			self.queue.delete($index);
		}
	}
}

method element_at($index)		{ return self.queue[$index]; }
method elements()				{ return self.queue.elements; }

method first_index_of($key) {
	my $index := 0;
	my $limit := self.queue.elements;
	
	while $index < $limit {
		if Parrot::iseq(self.queue[$index].key, $key) {
			return $index;
		}
		
		$index++;
	}
	
	return -1;
}

method last_index_of($key) {
	my $index := self.queue.elements;
	
	while $index {
		$index--;
		
		if Parrot::iseq(self.queue[$index].key, $key) {
			return $index;
		}
	}
	
	return -1;
}

method init(@items, %opts) {
	while @items {
		my $item := @items.shift;
		
		if Parrot::isa($item, 'Pair') {
			self.insert($item);
		}
		else {
			self.insert(Pair.new($item, @items.shift));
		}
	}
}

=method insert($pair [, :first_out(1) ] [, :last_out(1) ] 
[, :after($other) ], [, :before($other) ] [, :replacing($other) ])

=method insert($key, $value, [ as above ])

Inserts an element C<$pair> in the queue. If no options are specified, the
default is C<:last_out>. That is, 
    
    $mq.insert($a);
    $mq.insert($b);

will produce a queue that yields $a, $b in the same order. Option C<:first_out(1)>
puts the inserted element at the head of the queue, so that it is the next 
item out.

The C<:before($other)> and C<:after($other)> options specify relative ordering.
Insertions are performed immediately adjacent to (before or after) the target 
pair. If the target occurs more than once, C<:before> inserts before the earliest,
while C<:after> inserts after the latest.

If the target pair is no longer in the queue, the options are ignored and 
the default C<:last_out> is assumed.

The C<:replacing($other)> option specifies that the various items added will
actually replace their target. If the target is not found, nothing is done. The 
search is always for the earliest occurrence.

Specifying multiple options is undefined - the code will pick one and implement
that behavior.

=cut

method insert($key, *@value, *%opts) {
	unless Parrot::isa($key, 'Pair') {
		unless +@value {
			Parrot::die("Inserting a ", Parrot::typeof($key),
				"as a key requires a second $value element");
		}
		
		$key := Pair.new($key, @value.shift);
	}
	
	self.insert_actual($key, %opts);
}

method insert_actual($pair, %opts) {
	my $after	:= 0;		# 0 = before, 1 = after
	my $index	:= self.queue.elements;
	my $replace	:= 0;
	
	if %opts<first_out> {
		$index := 0;
	}
	elsif %opts.contains('after') {
		$index := after(self.queue, %opts<after>);
	}
	elsif %opts.contains('before') {
		$index := before(self.queue, %opts<before>);
	}
	elsif %opts.contains('replacing') {
		$index := before(self.queue, %opts<replacing>);
		if $index < 0 { return self; }
		$replace := 1;
	}
	# else { default case: append at end }
	
	my @items := Array::new($pair);
	self.queue.splice(@items, :from($index), :replacing($replace));
	return self;
}

method is_empty()				{ return +self.queue == 0; }
method next() {
	if self.queue {
		return self.queue.shift.value;
	}
	
	return my $undef;
}

method queue(*@value)			{ self._ATTR_ARRAY('queue', @value); }

method remove_element_at($index) {
	my $item := self.queue[$index];
	self.queue.delete($index);
	return $item;
}

