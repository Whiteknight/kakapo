#! /usr/bin/env parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Program
	is UnitTest::Testcase ;

UnitTest::Testcase::TEST_MAIN();

our method set_up() {
	# Set global-variable state to post-INIT{} condition.
	pir::set_hll_global__vPSP( Key.new( <Program> ), '$_Instance', my $undef);
}

class Test::Exit is Program {
	method main(*@args) {
		foo();
		exit(1);
	}

	sub foo() {
		exit(4);
	}
}

our method test_exit() {
	verify_that( 'Calling global exit() immediately ends program' );

	my $pgm := Test::Exit.new;
	my $status := $pgm.run;

	fail_unless($status == 4, 'Exit 4 should have passed through');
}

class Test::StartQueue is Program {
has $!a;
has $!b;
has $!c;

	sub set_a($pgm) {	$pgm.a($pgm.b + 1); }
	sub set_b($pgm) {	$pgm.b(3); }
	sub set_c($pgm) {	$pgm.c($pgm.a + 5); }
}

our method test_start_queue() {
	verify_that( 'Program calls the entries in the at_start queue correctly' );

	my $pgm := Test::StartQueue.new;

	$pgm.at_start(Test::StartQueue::set_c, 'c', :requires('a'));
	$pgm.at_start(Test::StartQueue::set_a, 'a', :requires('b'));
	$pgm.at_start(Test::StartQueue::set_b, 'b');

	$pgm.do_start;

	assert_equal( $pgm.a, 4,
		'a should be set to 4');
	assert_equal( $pgm.b, 3,
		'b should be set to 3');
	assert_equal( $pgm.c, 9,
		'c should be set to 9');
}

our method test_exit_queue() {
	verify_that( 'Program calls the entries in the at_exit queue correctly' );

	my $pgm := Test::StartQueue.new;

	$pgm.at_exit(Test::StartQueue::set_c, 'c', :requires('a'));
	$pgm.at_exit(Test::StartQueue::set_a, 'a', :requires('b'));
	$pgm.at_exit(Test::StartQueue::set_b, 'b');

	$pgm.do_start;

	assert_equal( $pgm.a + $pgm.b + $pgm.c, 0,
		'Nothing done at do_start');

	$pgm.do_exit;

	assert_equal( $pgm.a, 4,
		'a should be set to 4');
	assert_equal( $pgm.b, 3,
		'b should be set to 3');
	assert_equal( $pgm.c, 9,
		'c should be set to 9');
}

our method test_from_parrot() {
	my $pgm := Program.new;

	assert_equal( $pgm.program_name, '',
		'New program should have no name' );

	$pgm.from_parrot;

	assert_not_equal( $pgm.program_name, '',
		'Taking values from parrot interp should provide a program name' );

	assert_not_equal( $pgm.executable_name, '',
		'Taking values from parrot interp should provide an executable name' );
}


class Test::Global::AtFuncs is Program {
	sub foo() { 1; }
}

our method test_global_at_exit() {
	my $pgm := Test::Global::AtFuncs.new;

	assert_throws_nothing('Registered program should have no problems with at_exit global',
	{
		Program::instance($pgm);
		at_exit(Test::Global::AtFuncs::foo);
	});
}

our method test_global_at_exit_fails() {
	my $pgm := Test::Global::AtFuncs.new;

	assert_throws(Control::Error, 'at_exit should throw exception if no program registered',
	{
		at_exit(Test::Global::AtFuncs::foo);
	});
}

our method test_global_at_start() {
	my $pgm := Test::Global::AtFuncs.new;

	assert_throws_nothing('Registered program should have no problems with at_start global',
	{
		Program::instance($pgm);
		at_start(Test::Global::AtFuncs::foo);
	});
}

our method test_global_at_start_fails() {
	my $pgm := Test::Global::AtFuncs.new;

	assert_throws(Control::Error, 'at_start should throw exception if no program registered',
	{
		at_start(Test::Global::AtFuncs::foo);
	});
}

class Dummy::SetMain is Program {
	sub foo() { exit(27); }
}

our method test_main_uses_set_main() {
	my $pgm := Dummy::SetMain.new;

	assert_not_defined( $pgm.get_main,
		'Program should have no &main set by default.' );
	assert_throws( Control::Error, 'Program should die with no main set.',
		{ $pgm.run; });

	$pgm.set_main( Dummy::SetMain::foo );
	assert_same( Dummy::SetMain::foo, $pgm.get_main,
		'get/set_main should be accessors' );

	my $result := $pgm.run;

	assert_equal( 27, $result,
		'After set_main, Program::main should call sub' );
}

class Dummy::RunSetsArgs is Program {
	method main() {
		@*ARGS[2];
	}
}

our method run_sets_args() {
	my $dummy := Dummy::RunSetsArgs.new;

	my $result := $dummy.run: argv => <a b c>;

	assert_equal( 'b', $result,
		'Result should be "b" if run is setting @*ARGS');
}

class Dummy::ProgramSwapsStreams is Program {
	method main() {
		say("12345");
	}
}

our method test_run_swaps_streams() {
	my $string_out := Parrot::new('StringHandle');
	$string_out.open('any value', 'w');

	my $pgm := Dummy::ProgramSwapsStreams.new;
	$pgm.stdout( $string_out );

	my $save_stdout := pir::getstdout__P();

	$pgm.run;

	assert_same( pir::getstdout__P(), $save_stdout,
		'Program should restore stdout');

	$string_out.open('really, anything', 'r');

	assert_equal( $string_out.readall.index('34'), 2, #"12345\n",
		'Program should write to stdout as given');
}

#~ class Test::Dynamic is Program {
	#~ method main(@args) {
		#~ my %results;

		#~ for @args {
			#~ %results{~ $_} := pir::find_dynamic_lex__PS(~ $_);
		#~ }

		#~ exit(%results);
	#~ }

	#~ method do_exit() {
		#~ self.exit_value;
	#~ }
#~ }

#~ method test_dynamic_vars() {
	#~ verify_that( 'The various $*DYNAMIC_VARS get set when running' );

	#~ my $fetch := Test::Dynamic.new;

	#~ my @args := <
		#~ thisProgram
		#~ $*PROGRAM_NAME
		#~ @*ARGS
		#~ %*ENV
		#~ $*EXECUTABLE_NAME
		#~ $*PID
		#~ $?PERL
		#~ $?VM
		#~ %*VM
	#~ >;
	#~ my %value := $fetch.run(@args);

	#~ fail_unless( %value<$*PROGRAM_NAME> eq @args.shift,
		#~ 'Program name should be this script.');
	#~ fail_unless( %value<@*ARGS>.join(' ') eq @args.join(' '),
		#~ 'Program @*ARGS should be the list, minus program name.');
	#~ #fail_unless( %value<%*ENV><PATH> ne '', 'Path must be in env' );
	#~ #fail_unless( %value<$*EXECUTABLE_NAME> ne '', 'Executable name must be set' );
	#~ #fail_unless( %value<$*PID> ne '', 'Process id must be set' );
	#~ fail_unless( %value<$?PERL> eq 'nqp-rx', 'Perl should be nqp' );
	#~ fail_unless( %value<$?VM> eq 'parrot', 'VM should be parrot' );
	#~ fail_unless( %value<%*VM><lib_paths> == 5, '%*VM<lib_paths> should have 5 entries' );
#~ }
