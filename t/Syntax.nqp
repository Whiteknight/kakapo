#! parrot-nqp
# Copyright 2009-2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Syntax
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
}

MAIN();

sub MAIN() {
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

method test_last() {
	my @a := <a b c d e f>;
	my $x;

	for @a {
		$x := ~$_;

		if $_ eq 'c' {
			last();
		}
	}

	fail_unless($x eq 'c', 'Last should leave $x = c');
}

method test_next() {
	my @a := <a b c d e f>;
	my $x := 0;

	for @a {
		if $_ ne 'g' {
			next();
		}

		$x++;
	}

	fail_unless($x == 0, 'Next should keep x from incrementint');
}

method test_redo() {
	my @a := <a b c d e f>;
	my $x := 0;
	my $i := 0;

	for @a {
		$x++;
		$i++;

		if $i < 3 {
			redo();
		}

		$i := 0;
	}

	fail_unless($x == 3 * @a, 'Redo should loop inside for');
}

class C1 {
	method m1() {
		'C1';
	}

        method m3() {
            'C1';
        }
}

class C2 is C1 {
	method m2() {
		'C2';
	}

        method m3() {
            super();
        }
}

class C3 is C2 {
	method m1() {
		'C3';
	}

	method m2() {
		super();
	}

        method m3() {
            super();
        }
}

method test_super() {
	my $obj := C3.new;
	fail_unless($obj.m2 eq 'C2', 'Super should call C2::m2');
        fail_unless($obj.m3 eq 'C1', 'Super should call C1::m3');
}
