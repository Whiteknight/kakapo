module ManagedQueue;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;	
	
	Pair::_ONLOAD();
	
	Dumper::_ONLOAD();
Testcase::_ONLOAD();
	Global::use('Dumper');
	
	my $class_name := 'ManagedQueue';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Class::HashBased',
	);
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
	my $target;
	
	if %opts<first_out> {
		$index := 0;
	}
	elsif %opts.contains('after') {
		$target := %opts<after>;
		$after := 1;
	}
	elsif %opts.contains('before') {
		$target := %opts<before>;
	}
	elsif %opts.contains('replacing') {
		$target := %opts<replacing>;
		$replace := 1;
	}
	# else { default case: append at end }
	
	if Parrot::defined($target) {
		my $insert := $after 
			?? self.last_index_of($target)
			!! self.first_index_of($target);
		
		if $insert >= 0 {
			$index := $insert + $after;
		}
		elsif $replace { # not found && must replace
			return self;
		}
	}

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
