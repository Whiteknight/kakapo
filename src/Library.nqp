# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Library;

has $!at_init_queue;
has $!at_load_queue;

sub _pre_initload(*@modules_done) {
	has(<	
		$!at_init_queue
		$!at_load_queue
	>);
}

my method add_call($queue, $sub, $name?, *%named) {
	unless %named.contains('namespace') {
		%named<namespace> := Parrot::caller_namespace(2);
	}
	
	unless $name {
		if $sub.isa('String') {
			$name := ~ $sub;
		}
		elsif $sub.isa('Sub') {
			$name := $sub.get_namespace.string_name;
		}
		else {
			Exception::InvalidArgument.new(
				:message('Invalid $call argument. Must be Sub or String'),
			).throw;
		}
	}
	
	$queue.add_entry($name, $sub, %named<requires>);
}

our method at_init(*@pos, *%named) {
	self.add_call($!at_init_queue, |@pos, |%named);
}

our method at_initload(*@pos, *%named) {
	self.at_init(|@pos, |%named);
	self.at_load(|@pos, |%named);
}

our method at_load(*@pos, *%named) {
	self.add_call($!at_load_queue, |@pos, |%named);
}

our method do_init() {
	self.process_queue($!at_init_queue, :name('init'));
}

our method do_load() {
	self.process_queue($!at_load_queue, :name('load'));
}

our method _init_obj(*@pos, *%named) {
	$!at_init_queue :=DependencyQueue.new;
	$!at_load_queue := DependencyQueue.new;

	self._init_args(|@pos, |%named);
}

our method module_initload_done($name) {
	$!at_init_queue.mark_as_done($name);
	$!at_load_queue.mark_as_done($name);
}

my method process_queue($queue, :$name!) {
	my &callee;
	
	# FIXME: Not doing namespaces right, here.
	while ! $queue.is_empty {
		&callee := $queue.next_entry;
		&callee := Parrot::get_hll_global(&callee)
			if &callee.isa('String');
		
		die( "Got null callee while processing $name queue" )
			if pir::isnull(&callee);
			
		&callee(self);
	}
	
	$queue.reset;
}
