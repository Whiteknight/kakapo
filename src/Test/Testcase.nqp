module Testcase;

our $Kakapo_config;	# Imported

_ONLOAD();

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	ConfigFile::_ONLOAD();
	Global::use(:symbols('$Kakapo_config'));
	$Kakapo_config.file('kakapo.cfg');
	Dumper::reset_cache();
	
	Global::use('Dumper');
	Parrot::IMPORT('Matcher::Factory');
	
	my $class_name := 'Testcase';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Class::HashBased',
	);
			
	NOTE("done");
}

method after_methods(*@value)		{ self._ATTR_SETBY('after_methods', 'fetch_after_methods'); }	
method after_prefix(*@value)		{ self._ATTR_DEFAULT('after_prefix', @value, 'after_'); }	
method afterall_methods(*@value)	{ self._ATTR_SETBY('afterall_methods', 'fetch_afterall_methods'); }	
method afterall_prefix(*@value)		{ self._ATTR_DEFAULT('afterall_prefix', @value, 'afterall_'); }	

method assert_that($item_desc, *@item) {
	unless +@item == 2 {
		Parrot::die("You must provide 3 args: $item_desc, $item, $matcher");
	}
	
	my $matcher := @item[1];
	my $description := $matcher.describe_self($item_desc ~ ' ');
	my $result := $matcher.matches(@item[0]);
	
	self.ok($result, $description);
	
	unless $result {
		my $explain := $matcher.describe_self("Expected: " ~ $item_desc ~ ' ')
			~ $matcher.describe_failure(@item[0], "\n     but: ");
		self.emit($explain);			
	}		
	
	return $result;
}

method before_methods(*@value)		{ self._ATTR_SETBY('before_methods', 'fetch_before_methods'); }	
method before_prefix(*@value)		{ self._ATTR_DEFAULT('before_prefix', @value, 'before_'); }	
method beforeall_methods(*@value)	{ self._ATTR_SETBY('beforeall_methods', 'fetch_beforeall_methods'); }	
method beforeall_prefix(*@value)		{ self._ATTR_DEFAULT('beforeall_prefix', @value, 'beforeall_'); }	

method emit(*@parts)			{ say(@parts.join); }

method note(*@message) {
	self.emit(
		"#\n",
		"# NOTE: ", @message.join, "\n",
		"#"
	);
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

method fetch_after_methods()		{ self.fetch_methods(:starting_with(self.after_prefix)); }
method fetch_afterall_methods()		{ self.fetch_methods(:starting_with(self.afterall_prefix)); }
method fetch_before_methods()		{ self.fetch_methods(:starting_with(self.before_prefix)); }
method fetch_beforeall_methods()		{ self.fetch_methods(:starting_with(self.beforeall_prefix)); }
method fetch_test_methods()		{ self.fetch_methods(:starting_with(self.test_prefix)); }

method init(@children, %attributes) {
	Class::BaseBehavior::init(self, @children, %attributes);
	self.test_counter(0);
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

method run_all_tests() {
	self.run_tests();
}

method run_after_methods()		{ self.run_methods(self.after_methods); }
method run_afterall_methods()		{ self.run_methods(self.afterall_methods); }
method run_before_methods()		{ self.run_methods(self.before_methods); }
method run_beforeall_methods()		{ self.run_methods(self.beforeall_methods); }

method run_methods(@methods, *@args, *%opts) {
	NOTE("Running ", +@methods, " methods");

	for @methods {
		NOTE("Running method: ", $_);
		Class::call_method_(self, ~ $_, @args, %opts);
	}
	
	NOTE("done");
}

method run_test($method_name, :$after_prefix?, :$before_prefix?) {
	self.run_before_methods;
	Class::call_method(self, $method_name);
	self.run_after_methods;
}

method run_tests(*@names) {
	NOTE("Creating new testcase");
	my $testcase := self.new();
	
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
		Class::call_method($testcase, $method);
		
		NOTE("Running 'after' methods");
		$testcase.run_after_methods();
	}
	
	NOTE("Done with tests. Running 'afterall' methods");
	$testcase.run_afterall_methods;
}

method test_counter(*@value)		{ self._ATTR_CONST('test_counter', @value); }	
method test_methods()			{ self._ATTR_SETBY('test_methods', 'fetch_test_methods'); }	
method test_prefix(*@value)		{ self._ATTR_DEFAULT('test_prefix', @value, 'test_'); }	
