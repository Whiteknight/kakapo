=file t/Array.nqp

Test the Array component of the Kakapo library.

=cut

module Kakapo::Test::Array;

Q:PIR { load_bytecode 'library/kakapo.pbc' };

_ONLOAD();

#Kakapo::Test::Array.run_all_tests;
Kakapo::Test::Array.run_tests('test_bsearch');

sub _ONLOAD() {
	if our $onload_done { return 0; }
	$onload_done := 1;
	
	Parrot::IMPORT('Dumper', q<ASSERT DUMP DUMP_ NOTE>);
	Parrot::IMPORT('Matcher::Factory');
	
	my $class_name := 'Kakapo::Test::Array';
	
	NOTE("Creating class ", $class_name);
	Class::SUBCLASS($class_name,
		'Testcase',
	);	
}

method test_bsearch() {
	
	self.note("Testing Array::bsearch() function");
	
	my @dense := (3, 4, 5, 6, 7, 8, 9);
	
	self.assert_that('Bsearching 3', Array::bsearch(@dense, 3), returns(0));
	self.assert_that('Bsearching 4', Array::bsearch(@dense, 4), returns(1));
	self.assert_that('Bsearching 5', Array::bsearch(@dense, 5), returns(2));
	self.assert_that('Bsearching 6', Array::bsearch(@dense, 6), returns(3));
	self.assert_that('Bsearching 7', Array::bsearch(@dense, 7), returns(4));
	self.assert_that('Bsearching 8', Array::bsearch(@dense, 8), returns(5));
	self.assert_that('Bsearching 9', Array::bsearch(@dense, 9), returns(6));
	
	my @sparse := (11, 13, 15, 17, 19, 21, 23, 25);
	self.assert_that('Bsearching 10', Array::bsearch(@sparse, 10), returns(-1));
	self.assert_that('Bsearching 12', Array::bsearch(@sparse, 12), returns(-2));
	self.assert_that('Bsearching 14', Array::bsearch(@sparse, 14), returns(-3));
	self.assert_that('Bsearching 16', Array::bsearch(@sparse, 16), returns(-4));
	self.assert_that('Bsearching 18', Array::bsearch(@sparse, 18), returns(-5));
	self.assert_that('Bsearching 20', Array::bsearch(@sparse, 20), returns(-6));
	self.assert_that('Bsearching 22', Array::bsearch(@sparse, 22), returns(-7));
	self.assert_that('Bsearching 24', Array::bsearch(@sparse, 24), returns(-8));
	self.assert_that('Bsearching 26', Array::bsearch(@sparse, 26), returns(-9));
}

method test_concat() {
	
	self.note("Testing Array::concat() function");

	my @test := Array::concat();
	self.assert_that('No args concat', @test, is(instance_of('ResizablePMCArray')));
	self.assert_that('No args concat', @test, has(elements(0)));
	
	my @empty := Array::empty();
	my @t2 := Array::concat(@empty);
	self.assert_that('1 Empty concat', @t2, is(instance_of('ResizablePMCArray')));
	self.assert_that('1 Empty concat', @t2, has(elements(@empty.elements)));
	
	my @a := (1, 2);

	my @t3 := Array::concat(@a);
	self.assert_that('1 full concat', @t3, is(instance_of('ResizablePMCArray')));
	self.assert_that('1 full concat', @t3, has(elements(@a.elements)));
	self.assert_that('original array', @a, has(elements(2)));
	
	my @t4 := Array::concat(@empty, @a);
	self.assert_that('empty + full concat', @t4, is(instance_of('ResizablePMCArray')));
	self.assert_that('empty + full concat', @t4, has(elements(@empty.elements + @a.elements)));
	
	my @t5 := Array::concat(@a, @empty);
	self.assert_that('full + empty concat', @t5, is(instance_of('ResizablePMCArray')));
	self.assert_that('full + empty concat', @t5, has(elements(@a.elements + @empty.elements)));
	
	my @b := ('a', 'b');

	my @t5 := Array::concat(@a, @b);
	self.assert_that('a + b concat', @t5, is(instance_of('ResizablePMCArray')));
	self.assert_that('a + b concat', @t5, has(elements(@a.elements + @b.elements)));
	
	my @t6 := Array::concat(@b, @a);
	self.assert_that('b + a concat', @t6, is(instance_of('ResizablePMCArray')));
	self.assert_that('b + a concat', @t6, has(elements(@a.elements + @b.elements)));
	
	my @t7 := Array::concat(@a, @a);
	self.assert_that('a + a concat', @t7, is(instance_of('ResizablePMCArray')));
	self.assert_that('a + a concat', @t7, has(elements(@a.elements + @a.elements)));

	my $undef;
	my @c := ('', 0, $undef, No::such::symbol);
	my $desc := 'a+b+c concat';
	
	my @t7 := Array::concat(@a, @b, @c);
	self.assert_that($desc, @t7, is(instance_of('ResizablePMCArray')));
	self.assert_that($desc, @t7, has(elements(@a.elements + @b.elements + @c.elements)));

	self.assert_that($desc ~ ' element[0]', @t7[0], is(1));
	self.assert_that($desc ~ ' element[1]', @t7[1], is(2));
	self.assert_that($desc ~ ' element[2]', @t7[2], is('a'));
	self.assert_that($desc ~ ' element[3]', @t7[3], is('b'));
	self.assert_that($desc ~ ' element[4]', @t7[4], is(''));
	self.assert_that($desc ~ ' element[5]', @t7[5], is(0));
	self.assert_that($desc ~ ' element[6]', @t7[6], is(not(defined())));
	
	# This last test has to be not-defined, because NQP 'fixes' nulls in expression temps, 
	# so I can't pass in a single-value null and have it stay null.
	self.assert_that($desc ~ ' element[7]', @t7[7], is(not(defined())));
}

method test_contains() {
	self.note("**NOT** testing Array::contains - it gets called from RPA and RSA, and tested by them");
}

method test_elements() {
	
	self.note("Testing Array::elements function");
	
	my @array := Array::empty();
	self.assert_that('New array', @array, is(instance_of('ResizablePMCArray')));
	self.assert_that('The elements count', @array.elements, is(0));
	self.assert_that('The Array::elements count', Array::elements(@array), is(0));
	
	Array::elements(@array, 4);
	self.assert_that('The elements count', @array.elements, is(4));
	self.assert_that('The Array::elements count', Array::elements(@array), is(4));
}
	
method test_empty() {
	
	self.note("Testing Array::empty() factory");
	
	my @array := Array::empty();
	self.assert_that('New array', @array, is(instance_of('ResizablePMCArray')));
	self.assert_that('The elements count', @array.elements, is(0));
	
	@array := Array::empty(1, 2, 3);
	self.assert_that('New array', @array, is(instance_of('ResizablePMCArray')));
	self.assert_that('The elements count', @array.elements, is(0));
	
}

method test_new() {
	
	self.note("Testing Array::new() factory");
	
	my @array := Array::new();	
	self.assert_that('New array', @array, is(instance_of('ResizablePMCArray')));
	self.assert_that('The elements count', @array.elements, is(0));
	
	@array := Array::new(1, 2, 3);
	self.assert_that('New array', @array, is(instance_of('ResizablePMCArray')));
	self.assert_that('The elements count', @array.elements, is(3));
}

method test_reverse() {
	
	self.note("Testing Array::reverse() function");
	
	my @forwards := Array::new(1, 2, 3, 4, 5);
	my @backwards := Array::new(5, 4, 3, 2, 1);
	
	self.assert_that('Forwards array, reversed', Array::reverse(@forwards), equals(@backwards));
}

method test_unique() {
	
	self.note("Testing Array::unique");

	my @array := Array::new('foo', 'bar');
	my @uniq := Array::unique(@array);
	self.assert_that('Unique array', @uniq, equals(@array));
	
	@array.push('foo');
	@uniq := Array::unique(@array);
	self.assert_that('Unique array', @uniq, not(equals(@array)));
}