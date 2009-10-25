module Program;

our $At_end_queue;
our $At_start_queue;
our $Init_queue;
our $Load_queue;
our $Main;

_ONLOAD();

sub _ONLOAD() {
	if our $Onload_done { return 0; }
	$Onload_done := 1;
	
	ManagedQueue::_ONLOAD();
	
	$At_end_queue	:= ManagedQueue.new();
	$At_start_queue	:= ManagedQueue.new();
	$Init_queue		:= ManagedQueue.new();
	$Load_queue		:= ManagedQueue.new();	
}

sub add_call($q, $name, $call, %opts) {
	my $pair := Pair.new($name, $call);
	
	if %opts<after>	{ $q.insert($pair, :after(%opts<after>)); }
	elsif %opts<before>	{ $q.insert($pair, :before(%opts<before>)); }
	elsif %opts<first>	{ $q.insert($pair, :first_out(1)); }
	else			{ $q.insert($pair, :last_out(1)); }
}

sub at_end($name, $call, *%opts) {
	add_call($At_end_queue, $name, $call, %opts);
}
	
sub at_start($name, $call, *%opts) {
	add_call($At_start_queue, $name, $call, %opts);
}

sub call($call) {
	if Parrot::isa($call, 'String') {
		$call := Parrot::get_hll_global($call);
	}
	
	if $call {
		return $call();
	}
	
	return my $undef;
}

sub call_main() {
	process_queue($At_start_queue);
	
	my $result := call($Main);
	exit($result);
}

sub exit($result) {
	process_queue($At_end_queue);
	_exit($result);
}

sub _exit($result) {
	Parrot::exit($result);
}

sub register_init($name, $call, *%opts) {
	add_call($Init_queue, $name, $call, %opts);
}

sub register_initload($name, $call, *%opts) {
	add_call($Init_queue, $name, $call, %opts);
	add_call($Load_queue, $name, $call, %opts);
}

sub register_load($name, $call, *%opts) {
	add_call($Init_queue, $name, $call, %opts);
}

sub process_init_queue() {
	process_queue($Init_queue);
}

sub process_load_queue() {
	process_queue($Load_queue);
}

sub process_queue($q) {
	while my &call := $q.next {
		call(&call);
	}
}

sub register_main($call) {
	$Main := $call;
}
