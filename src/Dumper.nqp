# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Dumper;
# Configurable module for generating debug output.

our %Bits;
%Bits<NOTE>		:= 1;	
%Bits<DUMP>		:= 2;
%Bits<ASSERT>		:= 4;

our $Caller_depth;
our %Dumper_config_cache;
our $Kakapo_config;
our $Prefix;

our sub ASSERT($condition, *@message, :$caller_level?) {
	unless lock('ASSERT') { return 0; }
	
	my $message := +@message ?? @message.join !! 'ASSERTION FAILED';

	# This is a bit of a hack, but it shows ASSERT instead of _block99 in the stack trace.
	$condition ?? 0 !! Opcode::die($message);
	
	unlock('ASSERT');
}

our sub DUMP(*@pos, :$caller_level?, :@info?, *%named) {
	unless lock('DUMP') { return 0; }

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
	
	unlock('DUMP');
}

our sub DUMP_(*@what, :$label?, :$prefix?) {
	unless $label { $label := '$VAR'; }
	print($prefix);
	_dumper(@what, $label);
}

our sub NOTE(*@parts, :$caller_level?, :@info?) {
	unless lock('NOTE') { return 0; }

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
	
	unlock('NOTE');
}

sub caller_depth_below($namespace, $name, :$starting, :$limit?) {
# Computes the number of "named" subs (name != '_blockNNN') between
# the caller and the sub identified by $namespace::$name on the current
# call stack. If more than $limit (default: 80) named subs are seen,
# $limit is returned.

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
		#backtrace
		
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
		$S0 = substr caller_name, 0, 8
		
		# NB: '_block13' is magical because it is the block NQP uses for "file scope".
		if $S0 == '_block13' goto dont_skip_block13
		
		$S0 = substr $S0, 0, 6
		
		if $S0 == '_block' goto skip_over_blocks
	dont_skip_block13:
		
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
	our $Kakapo_config; # tt#1308

	if $Kakapo_config {
		$result := $Kakapo_config.query(@key.join('::'));
	}

	return $result;
}

sub get_dumper_config($named_caller, :$starting) {
	my @parts := $named_caller.get_namespace.get_name.clone;
	@parts[0] := 'Dump';
	@parts.push(~ $named_caller);
	
	my $key := @parts.join('::');
	
	unless my @config := %Dumper_config_cache{$key} {
		@config := Array::new(
			get_config($key),
			0,
			$key
		);

		%Dumper_config_cache{$key} := @config;
	}

	# Even if cached, recompute stack depth. A function may
	# be at different depths throughout the program. (Worse,
	# it may recurse.)
	if @config[0] {
		@config[1] := stack_depth(:starting($starting + 2));
	}
		
	return @config;
}

our @Info_rejected := Array::new(0, -1, 'null');

sub info(:$caller_level) {
# Returns an array of:
# [0] = proceed, either 0 or the flags set in config file for caller name
# [1] = depth, the stack depth of the caller
# [2] = caller full name:  Path::To::Class::sub

	unless lock('info') { return @Info_rejected; }

	$caller_level++;
	
	our $Last_lexpad_addr;
	our @Result;
	
	# If lexpad address is the same, it's the same call frame. So return 
	# the identical result. This is a "called-from-same-block" cache, to
	# handle frequent pairings of NOTE+DUMP, e.g.
	my $lexpad_addr := Parrot::get_address_of(get_caller($caller_level, :attr('lexpad')));
	
	if $lexpad_addr && $lexpad_addr == $Last_lexpad_addr {
		# Do nothing - last result still in @Result.
	}
	else {
		$Last_lexpad_addr	:= $lexpad_addr;
		my $caller		:= find_named_caller(:starting($caller_level + 1));
		@Result		:= get_dumper_config($caller, :starting($Caller_depth));
	}

	unlock('info');
	return @Result;
}

sub lock($key) {
	unless our %_Already_in {
		%_Already_in := Hash::new(
			:ASSERT(0),
			:DIE(0),
			:DUMP(0),
			:info(0),
			:NOTE(0),
		);
	}
	
	my $locked := %_Already_in{$key};
	
	if $locked {	
		return 0;
	}
	
	$locked++;
	return 1;
}

our $Prefix_string := ':..';
our $Prefix_string_len := String::length($Prefix_string);

sub make_bare_prefix($depth) {
	if $depth < 1 {
		$depth := 1;
	}

	$depth--;
	my $prefix := String::repeat($Prefix_string, ($depth / $Prefix_string_len));
	
	$prefix := $prefix ~ String::substr($Prefix_string, 0, $depth % 3);

	return $prefix ~ '+-';
}

sub make_named_prefix(@info) {
	my $prefix := make_bare_prefix(@info[1]) ~ @info[2];
	return $prefix;
}

sub _pre_initload() {
# Special sub called when the Kakapo library is loaded or initialized to guarantee this module 
# is already initialized during :init and :load processing.

	Opcode::load_bytecode('dumper.pbc');
	
	$Caller_depth := 0;

	Global::export('ASSERT', 'DUMP', 'DUMP_', 'NOTE');
	#Global::use(:symbols('$Kakapo_config'));		# FIXME: Parameterize this.
}

sub reset_cache() {
	%Dumper_config_cache := Hash::empty();
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
		$depth := caller_depth_below($Root_nsp, $Root_sub, 
			:starting($starting + 2));
		$depth := $depth - $Stack_root_offset;
	}

	return $depth;
}

sub unlock($key) {
	our %_Already_in;		# Shared with lock()
	my $locked := %_Already_in{$key};
	
	if $locked {
		$locked--;
	}
}
