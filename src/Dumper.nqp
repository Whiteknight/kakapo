# $Id: Dumper.nqp 183 2009-10-19 00:53:58Z austin_hastings@yahoo.com $

class Dumper;

our %Already_in;
our %Bits;
our $Caller_depth;
our $Prefix;

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;

	Parrot::_ONLOAD();
	#say("Dumper::_ONLOAD");
	
	%Already_in<ASSERTold>	:= 0;
	%Already_in<ASSERT>	:= 0;
	%Already_in<DIE>		:= 0;
	%Already_in<DUMP>	:= 0;
	%Already_in<INFO>	:= 0;
	%Already_in<NOTE>	:= 0;

	%Bits<NOTE>	:= 1;	
	%Bits<DUMP>	:= 2;
	%Bits<ASSERT>	:= 4;
	
	$Caller_depth := 0;
	
	Parrot::load_bytecode('dumper.pbc');
}

sub ASSERTold(@info, $condition, @message) {
	if %Already_in<ASSERTold> { return $condition; }
	%Already_in<ASSERTold>++;

	if $condition {
		if @info[0] && @info[0] % 8 >= 4 {
			@message.unshift("ASSERT PASSED: ");
			NOTEold(@info, @message);
		}
	}
	else {
		@message.unshift("ASSERT FAILED: ");
		DIE(@info, @message);
	}
	
	%Already_in<ASSERTold>--;
}

sub ASSERT($condition, *@message, :$caller_level?) {
	if %Already_in<ASSERT> { return $condition; }
	%Already_in<ASSERT>++;
	
	my $message;
	
	if +@message {
		$message := @message.join;
	}
	else {
		$message := "ASSERTION FAILED";
	}
	
	unless $condition {
		Q:PIR {
			$P0 = find_lex '$message'
			$S0 = $P0
			die $S0
		};
	}
	
	%Already_in<ASSERT>--;
	return $condition;
}

sub BACKTRACE() {
	Q:PIR {
		backtrace
	};
}

sub DIE(*@msg) {
	if %Already_in<DIE> { return 0; }
	%Already_in<DIE>++;

	my $message := 'DIE: ' ~ @msg.join;
		
	Q:PIR {
		$P0 = find_lex '$message'
		$S0 = $P0
		die $S0
	};
	
	%Already_in<DIE>--;
}

sub DUMP(*@pos, :$caller_level?, :@info?, *%named) {
	if %Already_in<DUMP> { return 0; }
	%Already_in<DUMP>++;

	unless $caller_level {
		$caller_level := 0;
	}

	unless @info {
		# $caller_level + 2 for DUMP(), unless-block()
		@info := info(:caller_level($caller_level + 2));
	}

	if @info[0] && @info[0] % 4 > 1 {
		$Prefix := make_bare_prefix(@info[1]);
		
		if +@pos {
			print($Prefix);
			_dumper(@pos, @info[2]);
			#PCT::HLLCompiler.dumper(@pos, @info[2]);
		}
		
		if +%named {
			print($Prefix);
			_dumper(@pos, @info[2]);
			#PCT::HLLCompiler.dumper(%named, @info[2]);
		}
	}
	
	%Already_in<DUMP>--;
}

sub DUMPold(@info, @pos, %named) {
	DUMP(@pos, %named,
		:caller_level(+1),
		:info(@info));
}

sub DUMP_(*@what, :$label?, :$prefix?) {
	unless $label { $label := '$VAR'; }
	print($prefix);
	PCT::HLLCompiler.dumper(@what, $label);
}

sub NOTE(*@parts, :$caller_level?, :@info?) {
	if %Already_in<NOTE> { return 0; }
	%Already_in<NOTE>++;

	unless $caller_level {
		$caller_level := 0;
	}
	
	unless @info {
		# $caller_level + 2 for NOTE(), unless-block()
		@info := info(:caller_level($caller_level + 2));
	}
	
	if @info[0] && @info[0] % 2 {
		$Prefix := make_named_prefix(@info);
		say($Prefix, ': ', @parts.join);
	}
	
	%Already_in<NOTE>--;
}

sub NOTEold(@info, @parts) {
	NOTE(@parts.join, 
		:caller_level(+1), 
		:info(@info));
}

=sub caller_depth_below($namespace, $name, :$limit?)

Computes the number of "named" subs (name != '_blockNNN') between
the caller and the sub identified by $namespace::$name on the current
call stack. If more than $limit (default: 80) named subs are seen,
$limit is returned.

=cut

sub caller_depth_below($namespace, $name, :$starting, :$limit?) {
	unless $limit {
		$limit := 80;
	}

	my $depth := Q:PIR {
		.local pmc interp
		interp = getinterp
		
		.local int depth, show_depth, show_limit
		$P0 = find_lex '$starting'
		depth = $P0

		show_depth = 1
		$P0 = find_lex '$limit'
		show_limit = $P0
		
		.local string sub_name, nsp_name
		$P0 = find_lex '$name'
		sub_name = $P0
		$P0 = find_lex '$namespace'
		nsp_name = $P0
		
		.local pmc key, namespace, caller
		.local string caller_name
		
		push_eh handler
		
	while_not_root:
		
		inc depth
		
		# Make a [ 'sub' , $depth ] key
		key = new 'Key'
		key = 'sub'
		$P0 = new 'Key'
		$P0 = depth
		push key, $P0
		
		caller = interp[ key ]
		
		caller_name = caller
		$S1 = substr caller_name, 0, 6

		if $S1 == '_block' goto while_not_root

		inc show_depth		
		if show_depth >= show_limit goto  done

		unless caller_name == sub_name goto while_not_root
		
		namespace = caller.'get_namespace'()
		
		$P0 = namespace.'get_name'()
		$S0 = join '::', $P0

		unless $S0 == nsp_name goto while_not_root
	
		goto done

	handler:
		say "Suppressed exception in caller_depth_below"
		backtrace
		
	done:
		pop_eh
		# Done: depth indicates depth from "parrot::Slam::main" to present.
		%r = box show_depth
	};

	return $depth;
}

sub find_named_caller(:$nth?, :$starting?) {
	unless $nth { $nth := 1; }
	
	$starting := 0 + $starting;
	
	my $caller := Q:PIR {
		.local pmc interp
		interp = getinterp
		
		.local int how_many
		$P0 = find_lex '$nth'
		how_many = $P0
		
		.local int num_found
		num_found = 0

		.local int depth
		$P0 = find_lex '$starting'
		depth = $P0
		
		.local pmc caller, key, namespace
		.local string caller_name		
	
	find_named_caller:
	
	skip_over_blocks:	# Skip over '_block...' lexical scopes
		inc depth
		
		# Make a [ 'sub'; $depth ] key
		key = new 'Key'
		key = 'sub'
		$P0 = new 'Key'
		$P0 = depth
		push key, $P0
		
		caller = interp [ key ]
		caller_name = caller
		$S0 = substr caller_name, 0, 6
		
		if $S0 == '_block' goto skip_over_blocks
		
		# Found one. Is that enough?
		inc num_found
		if num_found < how_many goto done
		
	done:		
		# Remember the caller depth for stack_depth
		$P0 = get_global '$Caller_depth'
		$P0 = depth
		
		# Now we have a sub named other than '_block'
		%r = caller
	};

	return $caller;
}

sub get_caller($level?, :$attr?) {
	$level := 1 + $level;
	
	unless $attr {
		$attr := 'sub';
	}
	
	my $caller := Q:PIR {
		.local string attr
		$P0 = find_lex '$attr'
		attr = $P0
		
		.local pmc interp, key
		interp = getinterp
		
		key = new 'Key'
		key = attr
		
		.local int level
		$P0 = find_lex '$level'
		level = $P0
		
		$P0 = new 'Key'
		$P0 = level
		
		push key, $P0
		
		%r = interp [ key ]
	};

	return $caller;
}

sub get_config(*@key) {
	my $result;

	if Registry<CONFIG> {
		$result := Registry<CONFIG>.query(@key.join('::'));
	}

	return $result;
}

sub get_dumper_config($named_caller, :$starting) {
	unless our %_dumper_config_cache {
		%_dumper_config_cache := Hash::empty();
	}

	my $addr := Parrot::get_address_of($named_caller);

	unless my @config := %_dumper_config_cache{$addr} {
		my $name := ~ $named_caller;
		
		my @namespace := $named_caller.get_namespace.get_name.clone;
		# Replace hll 'parrot' with 'Dump' for dumper config settings.
		@namespace[0] := 'Dump';
		@namespace.push($name);
		
		my $key := @namespace.join('::');

		@config := Array::new(
			get_config($key),
			0,
			$key
		);

		%_dumper_config_cache{$addr} := @config;
	}

	# Even if cached, recompute stack depth. A function may
	# be at different depths throughout the program. (Worse,
	# it may recurse.)
	if @config[0] {
		@config[1] := stack_depth(:starting($starting + 2));
	}
		
	return @config;
}

=sub info

Returns an array of 4 items:

=item * [0] = proceed, either 0 or the flags set in config file for caller name

=item * [1] = depth, the stack depth of the caller

=item * [2] = caller full name:  Path::To::Class::sub

=cut 

our @Info_rejected := Array::new(0, -1, 'null');

sub info(:$caller_level) {
	if %Already_in<INFO> { return @Info_rejected; }	
	%Already_in<INFO>++;

	unless $caller_level {
		# The old dump and note code calls info direct.
		$caller_level := +1;
	}
	
	$caller_level ++;
	our $last_lexpad_addr;
	our @result;
	
	# If lexpad address is the same, it's the same call frame.
	# Return identical result.
	my $lexpad_addr := Parrot::get_address_of(get_caller($caller_level, :attr('lexpad')));
	
	if $lexpad_addr && $lexpad_addr == $last_lexpad_addr {
		# Do nothing - last result still in @result.
	}
	else {
		$last_lexpad_addr	:= $lexpad_addr;
		my $caller		:= find_named_caller(:starting($caller_level + 1));

		@result		:= get_dumper_config($caller, :starting($Caller_depth));
	}

	%Already_in<INFO>--;
	return @result;
}

our $Prefix_string := ':..';
our $Prefix_string_len := String::length($Prefix_string);

sub make_bare_prefix($depth) {
	if $depth < 1 {
		$depth := 1;
	}

	$depth --;
	my $prefix := String::repeat($Prefix_string, ($depth / $Prefix_string_len));
	
	$prefix := $prefix ~ String::substr($Prefix_string, 0, $depth % 3);

	return $prefix ~ '+-';
}

sub make_named_prefix(@info) {
	my $prefix := make_bare_prefix(@info[1]) ~ @info[2];
	return $prefix;
}

sub stack_depth(:$starting) {
	our $Stack_root_offset;
	our $Root_sub;
	our $Root_nsp;

	my $depth := 0;
	
	unless $Root_sub {
		my $stack_root := get_config('Dump', 'Stack', 'Root');
		$Stack_root_offset := 0 + get_config('Dump', 'Stack', 'Root_offset');

		if $stack_root {
			my @parts	:= $stack_root.split('::');
			$Root_sub	:= @parts.pop();
			$Root_nsp	:= @parts.join('::');
		}
	}
	
	# If config doesn't know Root yet, we're probably in the early stages,
	# before the config file loads. Return 0.
	if $Root_sub {
	say("Root sub: ", $Root_nsp, " :: ", $Root_sub);
		$depth := caller_depth_below($Root_nsp, $Root_sub, 
			:starting($starting + 2));
		$depth := $depth - $Stack_root_offset;
	}

	return $depth;
}
