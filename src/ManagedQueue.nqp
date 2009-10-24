module ManagedQueue;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;	
	
	Parrot::IMPORT('Dumper');
	
	my $class_name := 'ManagedQueue';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Class::HashBased',
	);	
}

method contains($item) {
	return self.queue.contains($item);
}

method delete($item, *@items) {
	if +@items { @items.unshift($item); }
	else { @items := Array::new($item); }
	
	for @items {
		my $index := self.index_of($_);
		
		if $index >= 0 {
			self.queue.delete($index);
		}
	}
}

method elements()				{ return self.queue.elements; }

method index_of($item) {
	my $index := -1;
	my $found := -1;
	
	for self.queue {
		$index++;
		
		if Parrot::iseq($_, $item) {
			$found := Parrot::clone($index);
		}
	}
	
	return $found;
}

method init(@items, %opts) {
	self.queue(@items);
}

=method insert($item, ... [, :first_out(1) ] [, :last_out(1) ] 
[, :after($other) ], [, :before($other) ] [, :replacing($other) ])

Inserts an element C<$what> in the queue. If no options are specified, the
default is C<:last_out>. That is, 
    
    $mq.insert($a);
    $mq.insert($b);

will produce a queue that yields $a, $b in the same order. Option C<:first_out(1)>
puts the inserted values at the head of the queue, so that they are the very 
first nodes out. Note that multiple values are inserted together, as a group, so
calling:
    $mq.insert($a, $b, :first_out(1));
will produce $a then $b, while calling:
    $mq.insert($a, :first_out(1));
    $mq.insert($b, :first_out(1));
will produce $b, then $a.

The C<:before($other)> and C<:after($other)> options specify relative ordering.
Insertions are performed immediately adjacent to (before or after) the target 
node. If the target node is no longer in the queue, the options are ignored and 
the default C<:last_out> is assumed.

The C<:replacing($other)> option specifies that the various items added will
actually replace their target. If the target is not found, nothing is done.

Specifying multiple options is undefined - the code will pick one and implement
that behavior.

=cut

method insert($item, *@items, *%opts) {
	if +@items { @items.unshift($item); }
	else { @items := Array::new($item); }
	
	my $adjust	:= 0;		# 0 = before, 1 = after
	my $index	:= self.queue.elements;
	my $replace	:= 0;
	my $target;
	
	if %opts<first_out> {
		$index := 0;
	}
	elsif %opts.contains('after') {
		$target := %opts<after>;
		$adjust := 1;
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
		my $insert := self.index_of($target);
		
		if $insert >= 0 {
			$index := $insert + $adjust;
		}
		elsif $replace { # not found && must replace
			return self;
		}
	}

	self.queue.splice(@items, :from($index), :replacing($replace));
	return self;
}

method is_empty()				{ return +self.queue == 0; }
method queue(*@value)			{ self._ATTR_ARRAY('queue', @value); }