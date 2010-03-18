#! /usr/bin/env parrot-nqp
# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

INIT {
	# Load the Kakapo library
	pir::load_language('parrot');
	my $env := pir::new__PS('Env');
	my $root_dir := $env<HARNESS_ROOT_DIR> || '.';
	pir::load_bytecode($root_dir ~ '/library/kakapo_full.pbc');
}

class Test::Parrot::Datatype
	is UnitTest::Testcase ;

INIT {
	use(	'UnitTest::Testcase' );
	use(	'UnitTest::Assertions' );
}

# Run the MAIN for this class.
Opcode::get_root_global(pir::get_namespace__P().get_name).MAIN;

method test_datatypes() {
	assert_equal( 0,	Parrot::DATATYPE_UNDEF, 'Expect UNDEF to have value 0' );
	assert_equal( -100,	Parrot::DATATYPE_INTVAL, 'Expect INTVAL to have value -100' );
	assert_equal( -99,	Parrot::DATATYPE_FLOATVAL, 'Expect FLOATVAL to have value -99' );
	assert_equal( -98,	Parrot::DATATYPE_STRING, 'Expect STRING to have value -98' );
	assert_equal( -97,	Parrot::DATATYPE_PMC, 'Expect PMC to have value -97' );
	assert_equal( -96,	Parrot::DATATYPE_BIGINT, 'Expect BIGINT to have value -96' );
	assert_equal( -95,	Parrot::DATATYPE_DPOINTER, 'Expect DPOINTER to have value -95' );
	assert_equal( -94,	Parrot::DATATYPE_CHAR, 'Expect CHAR to have value -94' );
	assert_equal( -93,	Parrot::DATATYPE_SHORT, 'Expect SHORT to have value -93' );
	assert_equal( -92,	Parrot::DATATYPE_INT, 'Expect INT to have value -92' );
	assert_equal( -91,	Parrot::DATATYPE_LONG, 'Expect LONG to have value -91' );
	assert_equal( -90,	Parrot::DATATYPE_LONGLONG, 'Expect LONGLONG to have value -90' );
	assert_equal( -89,	Parrot::DATATYPE_UCHAR, 'Expect UCHAR to have value -89' );
	assert_equal( -88,	Parrot::DATATYPE_USHORT, 'Expect USHORT to have value -88' );
	assert_equal( -87,	Parrot::DATATYPE_UINT, 'Expect UINT to have value -87' );
	assert_equal( -86,	Parrot::DATATYPE_ULONG, 'Expect ULONG to have value -86' );
	assert_equal( -85,	Parrot::DATATYPE_ULONGLONG, 'Expect ULONGLONG to have value -85' );
	assert_equal( -84,	Parrot::DATATYPE_FLOAT, 'Expect FLOAT to have value -84' );
	assert_equal( -83,	Parrot::DATATYPE_DOUBLE, 'Expect DOUBLE to have value -83' );
	assert_equal( -82,	Parrot::DATATYPE_LONGDOUBLE, 'Expect LONGDOUBLE to have value -82' );
	assert_equal( -81,	Parrot::DATATYPE_BIT, 'Expect BIT to have value -81' );
	assert_equal( -81,	Parrot::DATATYPE_INT1, 'Expect INT1 to have value -81' );
	assert_equal( -80,	Parrot::DATATYPE_INT4, 'Expect INT4 to have value -80' );
	assert_equal( -79,	Parrot::DATATYPE_INT8, 'Expect INT8 to have value -79' );
	assert_equal( -78,	Parrot::DATATYPE_INT16, 'Expect INT16 to have value -78' );
	assert_equal( -77,	Parrot::DATATYPE_INT32, 'Expect INT32 to have value -77' );
	assert_equal( -76,	Parrot::DATATYPE_INT64, 'Expect INT64 to have value -76' );
	assert_equal( -75,	Parrot::DATATYPE_UINT8, 'Expect UINT8 to have value -75' );
	assert_equal( -74,	Parrot::DATATYPE_UINT16, 'Expect UINT16 to have value -74' );
	assert_equal( -73,	Parrot::DATATYPE_UINT32, 'Expect UINT32 to have value -73' );
	assert_equal( -72,	Parrot::DATATYPE_UINT64, 'Expect UINT64 to have value -72' );
	assert_equal( -71,	Parrot::DATATYPE_PTR, 'Expect PTR to have value -71' );
	assert_equal( -70,	Parrot::DATATYPE_CSTR, 'Expect CSTR to have value -70' );
	assert_equal( -69,	Parrot::DATATYPE_STRUCT_PTR, 'Expect STRUCT_PTR to have value -69' );
	assert_equal( -68,	Parrot::DATATYPE_STRUCT, 'Expect STRUCT to have value -68' );
	assert_equal( -67,	Parrot::DATATYPE_FUNC_PTR, 'Expect FUNC_PTR to have value -67' );
	assert_equal( -66,	Parrot::DATATYPE_SIZED, 'Expect SIZED to have value -66' );
}

method test_pmctypes() {
	assert_equal( 0,	Parrot::PMCTYPE_default, 'Expect default to have value 0' );
	assert_equal( 1,	Parrot::PMCTYPE_Null, 'Expect Null to have value 1' );
	assert_equal( 2,	Parrot::PMCTYPE_Env, 'Expect Env to have value 2' );
	assert_equal( 3,	Parrot::PMCTYPE_Key, 'Expect Key to have value 3' );
	assert_equal( 4,	Parrot::PMCTYPE_UnManagedStruct, 'Expect UnManagedStruct to have value 4' );
	assert_equal( 5,	Parrot::PMCTYPE_ManagedStruct, 'Expect ManagedStruct to have value 5' );
	assert_equal( 6,	Parrot::PMCTYPE_Exception, 'Expect Exception to have value 6' );
	assert_equal( 7,	Parrot::PMCTYPE_ParrotLibrary, 'Expect ParrotLibrary to have value 7' );
	assert_equal( 8,	Parrot::PMCTYPE_ParrotInterpreter, 'Expect ParrotInterpreter to have value 8' );
	assert_equal( 9,	Parrot::PMCTYPE_ParrotThread, 'Expect ParrotThread to have value 9' );
	assert_equal( 10,	Parrot::PMCTYPE_LexPad, 'Expect LexPad to have value 10' );
	assert_equal( 11,	Parrot::PMCTYPE_Pointer, 'Expect Pointer to have value 11' );
	assert_equal( 12,	Parrot::PMCTYPE_Sub, 'Expect Sub to have value 12' );
	assert_equal( 13,	Parrot::PMCTYPE_Coroutine, 'Expect Coroutine to have value 13' );
	assert_equal( 14,	Parrot::PMCTYPE_Eval, 'Expect Eval to have value 14' );
	assert_equal( 15,	Parrot::PMCTYPE_EventHandler, 'Expect EventHandler to have value 15' );
	assert_equal( 16,	Parrot::PMCTYPE_Continuation, 'Expect Continuation to have value 16' );
	assert_equal( 17,	Parrot::PMCTYPE_RetContinuation, 'Expect RetContinuation to have value 17' );
	assert_equal( 18,	Parrot::PMCTYPE_ExceptionHandler, 'Expect ExceptionHandler to have value 18' );
	assert_equal( 19,	Parrot::PMCTYPE_NCI, 'Expect NCI to have value 19' );
	assert_equal( 20,	Parrot::PMCTYPE_BigInt, 'Expect BigInt to have value 20' );
	assert_equal( 21,	Parrot::PMCTYPE_BigNum, 'Expect BigNum to have value 21' );
	assert_equal( 22,	Parrot::PMCTYPE_Complex, 'Expect Complex to have value 22' );
	assert_equal( 23,	Parrot::PMCTYPE_FixedIntegerArray, 'Expect FixedIntegerArray to have value 23' );
	assert_equal( 24,	Parrot::PMCTYPE_ResizableIntegerArray, 'Expect ResizableIntegerArray to have value 24' );
	assert_equal( 25,	Parrot::PMCTYPE_Iterator, 'Expect Iterator to have value 25' );
	assert_equal( 26,	Parrot::PMCTYPE_ArrayIterator, 'Expect ArrayIterator to have value 26' );
	assert_equal( 27,	Parrot::PMCTYPE_HashIterator, 'Expect HashIterator to have value 27' );
	assert_equal( 28,	Parrot::PMCTYPE_OrderedHashIterator, 'Expect OrderedHashIterator to have value 28' );
	assert_equal( 29,	Parrot::PMCTYPE_StringIterator, 'Expect StringIterator to have value 29' );
	assert_equal( 30,	Parrot::PMCTYPE_FixedStringArray, 'Expect FixedStringArray to have value 30' );
	assert_equal( 31,	Parrot::PMCTYPE_ResizableStringArray, 'Expect ResizableStringArray to have value 31' );
	assert_equal( 32,	Parrot::PMCTYPE_Hash, 'Expect Hash to have value 32' );
	assert_equal( 33,	Parrot::PMCTYPE_AddrRegistry, 'Expect AddrRegistry to have value 33' );
	assert_equal( 34,	Parrot::PMCTYPE_LexInfo, 'Expect LexInfo to have value 34' );
	assert_equal( 35,	Parrot::PMCTYPE_NameSpace, 'Expect NameSpace to have value 35' );
	assert_equal( 36,	Parrot::PMCTYPE_OrderedHash, 'Expect OrderedHash to have value 36' );
	assert_equal( 37,	Parrot::PMCTYPE_OS, 'Expect OS to have value 37' );
	assert_equal( 38,	Parrot::PMCTYPE_File, 'Expect File to have value 38' );
	assert_equal( 39,	Parrot::PMCTYPE_OpLib, 'Expect OpLib to have value 39' );
	assert_equal( 40,	Parrot::PMCTYPE_Opcode, 'Expect Opcode to have value 40' );
	assert_equal( 41,	Parrot::PMCTYPE_CallContext, 'Expect CallContext to have value 41' );
	assert_equal( 42,	Parrot::PMCTYPE_Capture, 'Expect Capture to have value 42' );
	assert_equal( 43,	Parrot::PMCTYPE_Class, 'Expect Class to have value 43' );
	assert_equal( 44,	Parrot::PMCTYPE_PMCProxy, 'Expect PMCProxy to have value 44' );
	assert_equal( 45,	Parrot::PMCTYPE_CPointer, 'Expect CPointer to have value 45' );
	assert_equal( 46,	Parrot::PMCTYPE_Exporter, 'Expect Exporter to have value 46' );
	assert_equal( 47,	Parrot::PMCTYPE_FixedBooleanArray, 'Expect FixedBooleanArray to have value 47' );
	assert_equal( 48,	Parrot::PMCTYPE_ResizableBooleanArray, 'Expect ResizableBooleanArray to have value 48' );
	assert_equal( 49,	Parrot::PMCTYPE_FixedFloatArray, 'Expect FixedFloatArray to have value 49' );
	assert_equal( 50,	Parrot::PMCTYPE_ResizableFloatArray, 'Expect ResizableFloatArray to have value 50' );
	assert_equal( 51,	Parrot::PMCTYPE_FixedPMCArray, 'Expect FixedPMCArray to have value 51' );
	assert_equal( 52,	Parrot::PMCTYPE_ResizablePMCArray, 'Expect ResizablePMCArray to have value 52' );
	assert_equal( 53,	Parrot::PMCTYPE_MultiSub, 'Expect MultiSub to have value 53' );
	assert_equal( 54,	Parrot::PMCTYPE_Handle, 'Expect Handle to have value 54' );
	assert_equal( 55,	Parrot::PMCTYPE_FileHandle, 'Expect FileHandle to have value 55' );
	assert_equal( 56,	Parrot::PMCTYPE_Socket, 'Expect Socket to have value 56' );
	assert_equal( 57,	Parrot::PMCTYPE_StringHandle, 'Expect StringHandle to have value 57' );
	assert_equal( 58,	Parrot::PMCTYPE_HashIteratorKey, 'Expect HashIteratorKey to have value 58' );
	assert_equal( 59,	Parrot::PMCTYPE_ImageIO, 'Expect ImageIO to have value 59' );
	assert_equal( 60,	Parrot::PMCTYPE_ImageIOSize, 'Expect ImageIOSize to have value 60' );
	assert_equal( 61,	Parrot::PMCTYPE_Object, 'Expect Object to have value 61' );
	assert_equal( 62,	Parrot::PMCTYPE_Packfile, 'Expect Packfile to have value 62' );
	assert_equal( 63,	Parrot::PMCTYPE_PackfileAnnotation, 'Expect PackfileAnnotation to have value 63' );
	assert_equal( 64,	Parrot::PMCTYPE_PackfileFixupEntry, 'Expect PackfileFixupEntry to have value 64' );
	assert_equal( 65,	Parrot::PMCTYPE_PackfileSegment, 'Expect PackfileSegment to have value 65' );
	assert_equal( 66,	Parrot::PMCTYPE_PackfileAnnotations, 'Expect PackfileAnnotations to have value 66' );
	assert_equal( 67,	Parrot::PMCTYPE_PackfileConstantTable, 'Expect PackfileConstantTable to have value 67' );
	assert_equal( 68,	Parrot::PMCTYPE_PackfileDirectory, 'Expect PackfileDirectory to have value 68' );
	assert_equal( 69,	Parrot::PMCTYPE_PackfileFixupTable, 'Expect PackfileFixupTable to have value 69' );
	assert_equal( 70,	Parrot::PMCTYPE_PackfileRawSegment, 'Expect PackfileRawSegment to have value 70' );
	assert_equal( 71,	Parrot::PMCTYPE_ParrotRunningThread, 'Expect ParrotRunningThread to have value 71' );
	assert_equal( 72,	Parrot::PMCTYPE_Role, 'Expect Role to have value 72' );
	assert_equal( 73,	Parrot::PMCTYPE_scalar, 'Expect scalar to have value 73' );
	assert_equal( 74,	Parrot::PMCTYPE_Float, 'Expect Float to have value 74' );
	assert_equal( 75,	Parrot::PMCTYPE_Integer, 'Expect Integer to have value 75' );
	assert_equal( 76,	Parrot::PMCTYPE_Boolean, 'Expect Boolean to have value 76' );
	assert_equal( 77,	Parrot::PMCTYPE_String, 'Expect String to have value 77' );
	assert_equal( 78,	Parrot::PMCTYPE_CodeString, 'Expect CodeString to have value 78' );
	assert_equal( 79,	Parrot::PMCTYPE_Scheduler, 'Expect Scheduler to have value 79' );
	assert_equal( 80,	Parrot::PMCTYPE_SchedulerMessage, 'Expect SchedulerMessage to have value 80' );
	assert_equal( 81,	Parrot::PMCTYPE_Sockaddr, 'Expect Sockaddr to have value 81' );
	assert_equal( 82,	Parrot::PMCTYPE_Task, 'Expect Task to have value 82' );
	assert_equal( 83,	Parrot::PMCTYPE_Timer, 'Expect Timer to have value 83' );
	assert_equal( 84,	Parrot::PMCTYPE_Undef, 'Expect Undef to have value 84' );
	assert_equal( 85,	Parrot::PMCTYPE_core_max, 'Expect core_max to have value 85' );
}