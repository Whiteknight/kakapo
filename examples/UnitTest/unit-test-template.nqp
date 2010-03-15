#! /usr/bin/env parrot-nqp
# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.


# 1. This bit is boilerplate. It loads the kakapo lib, honoring the HARNESS environment
# settings.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}


# 2. Pick your own class name, here. I like to use Test::<my real class name> because it's predictable.
# (Which is good when you're writing code to load a bunch of files in and then list the classes you 
# think they defined...)

class Test::My::Class
	is UnitTest::Testcase ;

# 3. Attributes of the testcase. This one is usually enough - and sometimes it's too many.

has	$!sut;		# System under test

# 4. Get a bunch of useful names imported into the namespace. (Like the "assert_xxx" subs)
# You may also want to import 'Cuckoo' (for mocking) and 'Matcher::Factory' (for matchers).

INIT {
	use(	UnitTest::Testcase );	
	use(	UnitTest::Assertions );	
}

# 5. Reflect to determine the current class name, the use that to get the proto-object and call MAIN.
# This is boilerplate, but at least now you know what it does. (FYI: MAIN is defined in Standalone.nqp)

Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

# 6. Uncomment this if you're having problems with a test case. It will print the name of the testcase
# *before* it runs, so you know what's failing/dying/hanging.

# method run_test() {
#	say("Running test: ", self.name);
#	super();
# }

# 7. Do any set-up you need. This method is called before every test method, so you can start with 
# new data.

method set_up() {
	$!sut := My::Class.new;
}

# 8. Write some (more) test methods. This one is pretty basic - it just validates that your class' new method 
# actually creates and returns an object. It's good to start with a success. :)

method test_new() {
	assert_instance_of( $!sut, My::Class,
		'.new should return object of correct class');
}
