# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

# Orders code execution among interdependent components.
module ComponentMarshaller;

has $!name;
has $!queue;

sub _pre_initload(*@modules_done) {
	has(<
		$!name
		$!queue
	>);
}

# Add a call to C< $sub >, optionally named C< $name >, to the queue. Any dependencies
# will be specified by the (optional) C< :requires(...) > named parameter. If C< $sub > is a
# string name, the C< :namespace > parameter may by used to provide relevant context.
# (Not necessary if the string includes a namespace: 'Foo::bar'.)

my method add_call($sub, $name?, :$namespace = Parrot::caller_namepace(), :@requires) {

	$sub := Parrot::qualified_name($sub, :namespace($namespace))
		unless $sub.isa('Sub');

	$name := Parrot::qualified_name($sub)
		unless $name.defined;

	$!queue.add_entry($name, $sub, @requires);
}

our method _init_obj(*@pos, *%named) {
	$!queue := DependencyQueue.new;

	self._init_args(|@pos, |%named);
}

our method is_empty() {
	$!queue.is_empty;
}

our method mark_as_done($name) {
	$!queue.mark_as_done($name);
}

our method process_queue($invocant) {
	my &callee;

	# FIXME: Not doing namespaces right, here.
	until $!queue.is_empty {
		&callee := $!queue.next_entry;

		&callee := Parrot::get_hll_global(&callee)
			if &callee.isa('String');

		die( "Got null callee while processing $!name queue" )
			if pir::isnull(&callee);

		&callee($invocant);
	}

	$!queue.reset;
}
