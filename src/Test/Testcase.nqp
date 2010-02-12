# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

=begin SYNOPSIS

	# mytest.nqp
	class My::Test is Testcase;

	use(		'P6object' );
	
	My::Test.run_all_tests();
	
	method test_something() {
		my @results;
	
		self.test(	'Something should happen'
		).assert(
			that('Results array', @results, is( empty() )),
			that('Happening indicator', System::it_happened(), is( false() )),
		).do(
			@results := System::do_something(),
		).assert(
			that('Results array', @results, is( not( empty() ) )),
			that('Element [0]', @results[0], is( 'x1' )),
			that('Element [1]', @results[1], is( 'x2' )),
		);		
	}	
=end SYNOPSIS

module Testcase;
# An xUnit-like testcase class for NQP.
	
INIT {
	use(	'Dumper' );
	use(	'P6metaclass' );
	
	my $class_name := 'Testcase';

	has(	'_after_methods',
		'_after_prefix',
		'_afterall_methods',
		'_afterall_prefix',
		'_before_methods',
		'_before_prefix',
		'_beforeall_methods',
		'_beforeall_prefix',
	);
	
	say("Testcase init done");
#	P6metaclass::dump_class(Testcase);
}

method after_methods() {
	my @methods := self._after_methods;

	unless @methods {
		@methods := self.fetch_after_methods;
		self._after_methods(@methods);
	}
	
	return @methods;
}

method after_prefix(*@value) {
	if +@value {
		self._after_prefix(@value.shift);
		return self;
	}
	
	my $prefix := self._after_prefix;
	
	unless $prefix {
		$prefix := 'after_';
		self._after_prefix($prefix);
	}
	
	return $prefix;
}
	
method afterall_methods() {
	my @methods := self._afterall_methods;
	
	unless @methods {
		@methods := self.fetch_afterall_methods;
		self._afterall_methods(@methods);
	}
	
	return @methods;
}

method afterall_prefix(*@value) {
	if +@value {
		self._afterall_prefix(@value.shift);
		return self;
	}
	
	my $prefix := self._afterall_prefix;
	
	unless $prefix {
		$prefix := 'afterall_';
		self._afterall_prefix($prefix);
	}
	
	return $prefix;
}

method before_methods() {
	my @methods := self._before_methods;

	unless @methods {
		@methods := self.fetch_before_methods;
		self._before_methods(@methods);
	}
	
	return @methods;
}

method before_prefix(*@value) {
	if +@value {
		self._before_prefix(@value.shift);
		return self;
	}
	
	my $prefix := self._before_prefix;
	
	unless $prefix {
		$prefix := 'before_';
		self._before_prefix($prefix);
	}
	
	return $prefix;
}
	
method beforeall_methods() {
	my @methods := self._beforeall_methods;
	
	unless @methods {
		@methods := self.fetch_beforeall_methods;
		self._beforeall_methods(@methods);
	}
	
	return @methods;
}

method beforeall_prefix(*@value) {
	if +@value {
		self._beforeall_prefix(@value.shift);
		return self;
	}
	
	my $prefix := self._beforeall_prefix;
	
	unless $prefix {
		$prefix := 'beforeall_';
		self._beforeall_prefix($prefix);
	}
	
	return $prefix;
}

method emit(*@parts)			{ say(@parts.join); }

method fetch_after_methods() {
	return self.fetch_methods(:starting_with(self.after_prefix)); 
}

method fetch_afterall_methods() {
	return self.fetch_methods(:starting_with(self.afterall_prefix)); 
}

method fetch_before_methods() {
	return self.fetch_methods(:starting_with(self.before_prefix)); 
}

method fetch_beforeall_methods() {
	return self.fetch_methods(:starting_with(self.beforeall_prefix)); 
}

method fetch_test_methods() {
	return self.fetch_methods(:starting_with(self.test_prefix)); 
}

# FIXME: This doesn't get the methods from parents.
method fetch_methods(:$starting_with) {
	NOTE("Fetching methods starting with: ", $starting_with);
	
	my @list := Class::get_method_list(self);
	
	if $starting_with {
		my @matches;
		my $length := String::length($starting_with);
		
		for @list {
			my $method := ~ $_;
			if $method.substr(0, $length) eq $starting_with {
				@matches.push($method);
			}
		}
		
		@list := @matches;
	}
	
	NOTE("Got ", +@list, " methods: ", @list.join(", "));
	DUMP(@list);
	return @list;
}

method init(@children, %attributes) {
	say("Hello from Testcase::init");
	Class::BaseBehavior::init(self, @children, %attributes);
	self.test_counter(0);
}

method note(*@message) {
	self.emit(
		"#\n",
		"# NOTE: ", @message.join, "\n",
		"#"
	);
}

method run_all_tests() {
	return self.run_tests();
}

method run_after_methods() {
	return self.run_methods(self.after_methods); 
}

method run_afterall_methods() {
	return self.run_methods(self.afterall_methods); 
}

method run_before_methods() {
	return self.run_methods(self.before_methods);
}

method run_beforeall_methods() {
	return self.run_methods(self.beforeall_methods); 
}

method run_methods(@methods, *@args, *%opts) {
	NOTE("Running ", +@methods, " methods");

	for @methods {
		NOTE("Running method: ", $_);
		Parrot::call_method_(self, ~ $_, @args, %opts);
	}
	
	NOTE("done");
}

method run_test($method_name, :$after_prefix?, :$before_prefix?) {
	self.run_before_methods;
	Parrot::call_method(self, $method_name);
	self.run_after_methods;
}

our method run_tests(*@names) {
	NOTE("Creating new testcase");
	my $testcase := self.HOW.new();
	
	NOTE("Running 'beforeall' methods");
	$testcase.run_beforeall_methods;
	
	unless @names {
		NOTE("No test list specified. Running all tests.");
		@names := $testcase.fetch_test_methods();
	}
	
	NOTE("Got ", +@names, " tests to run.");

	for @names {
		my $method := ~ $_;
				
		NOTE("Running 'before' methods");
		$testcase.run_before_methods();
		
		NOTE("Running test: ", $method);
		Parrot::call_method($testcase, $method);
		
		NOTE("Running 'after' methods");
		$testcase.run_after_methods();
	}
	
	NOTE("Done with tests. Running 'afterall' methods");
	$testcase.run_afterall_methods;
}





		
method assert_that($item_desc, *@item) {
	unless +@item == 2 {
		Opcode::die('You must provide 3 args: $item_desc, $item, $matcher');
	}
	
	my $matcher := @item[1];
	my $description := $matcher.describe_self($item_desc ~ ' ');
	my $result := $matcher.matches(@item[0]);
	
	self.ok($result, $description);
	
	unless $result {
		my $explain := $matcher.describe_self("Expected: $item_desc ")
			~ $matcher.describe_failure(@item[0], "\n     but: ");
		self.emit($explain);			
	}		
	
	return $result;
}

method ok($result, $note?) {
	my @output;

	unless $result {
		@output.push('not');
	}
	
	@output.push('ok');
	self.test_counter++;
	@output.push(self.test_counter);
	
	if $note {
		@output.push('-');
		@output.push($note);
	}
	
	self.emit(@output.join(' '));
}

method test_counter(*@value)		{ self._ATTR_CONST('test_counter', @value); }	
method test_methods()			{ self._ATTR_SETBY('test_methods', 'fetch_test_methods'); }	
method test_prefix(*@value)		{ self._ATTR_DEFAULT('test_prefix', @value, 'test_'); }	
