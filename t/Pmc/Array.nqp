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

class Test::Program
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );	
}

MAIN();

sub MAIN() {	
	my $proto := Opcode::get_root_global(pir::get_namespace__P().get_name);
	$proto.suite.run;
}

method test_elements() {
	my @a1 := Array::new();
	
	fail_unless( @a1.elements == 0,
		'New = empty = 0 elements');
		
	@a1.push(1);
	fail_unless( @a1.elements == 1,
		'One element test');
		
	@a1.elements(0);
	my $x := @a1.shift;
	fail_unless( pir::isnull($x),
		'0 elements should fail to shift');
}

method test_new() {
	my @a1 := Array::new();
	
	fail_unless( @a1.isa('ResizablePMCArray'),
		'Array::new should return RPA');
		
	@a1 := ResizablePMCArray.new();
	fail_unless( @a1.isa('ResizablePMCArray'),
		'RPA.new should return RPA');
		
	@a1 := ResizableStringArray.new();
	fail_unless( @a1.isa('ResizableStringArray'),
		'RSA.new should return RSA');
		
	@a1 := Array::new(1, 2, 3, 4);
	fail_unless( @a1.elements == 4,
		'New should create an array from its args');
}

#~ method test_new() {
	
	#~ self.note("Testing Array::new() factory");
	
	#~ my @array := Array::new();	
	#~ self.assert_that('New array', @array, is(instance_of('ResizablePMCArray')));
	#~ self.assert_that('The elements count', @array.elements, is(0));
	
	#~ @array := Array::new(1, 2, 3);
	#~ self.assert_that('New array', @array, is(instance_of('ResizablePMCArray')));
	#~ self.assert_that('The elements count', @array.elements, is(3));
#~ }

method test_reverse() {
	my @a1 := <A B C D E F>;
	
	my $s := @a1.reverse.join;
	fail_unless( $s eq 'FEDCBA',
		'Reverse even array should be fedcba');
	
	@a1 := <L M N O P Q R>;
	$s := @a1.reverse.join;
	fail_unless( $s eq 'RQPONML',
		'Reverse odd array should be rqponml');
	
	@a1 := <X Y>;
	$s := @a1.reverse.join;
	fail_unless( $s eq 'YX',
		'Reverse short even should by yx');
	
	@a1 := <N N>;
	@a1.pop;
	$s := @a1.reverse.join;
	fail_unless( $s eq 'N',
		'Reverse singleton array should be n');
	
	@a1 := <z z>;
	@a1.pop;
	@a1.pop;
	$s := @a1.reverse.join;
	fail_unless( $s eq '',
		'Reverse empty array is empty');
}

method test_slice() {
	my @a1 := (1, 2, 3, 4, 5);
	
	my $s := @a1.slice(:to(2)).join;
	fail_unless( $s eq '12',
		'Slice up to [2] should be 12' );
	
	$s := @a1.slice(:from(1)).join;
	fail_unless( $s eq '2345',
		'Slice from [1] should be 2345');
	
	$s := @a1.slice(:from(-3), :to(-1)).join;
	fail_unless( $s eq '34',
		'Slice from [-3 .. -1] should be 34');
}

method test_splice() {
	my @a1 := (1, 2, 3, 4, 5);
	my @a2 := <A B C D E>;
	
	my $s := @a1.clone.splice(@a2.clone, :replacing(5)).join;
	fail_unless( $s eq 'ABCDE', 
		'Unset origin, replacing all should be ABCDE');

	$s := @a1.clone.splice(@a2.clone, :from(5)).join;
	fail_unless( $s eq '12345ABCDE', 
		'Splice at end appends');
	
	$s := @a1.clone.splice(@a2.clone, :from(4), :replacing(1)).join;
	fail_unless( $s eq '1234ABCDE',
		'Replacing 1 at end');
	
	$s := @a1.clone.splice(@a2.clone, :replacing(2)).join;
	fail_unless( $s eq 'ABCDE345',
		'Replacing first 2 elements');
}

method test_unsort() {
	my @array := Array::new('a', 'b', 'c', 'd');
	my @yaarr := @array.clone.unsort;

	fail_unless(@yaarr.elements == @array.elements,
		'Should have the same # elements');

	my $same := 0;
	
	my $index := 0;
	while $index < @array.elements {
		$same++
			if @array[$index] eq @yaarr[$index];
		$index++;
	}
	
	fail_if($same == 4,
		'Result should not be the same array (unlikely, not impossible!)');
		
}
