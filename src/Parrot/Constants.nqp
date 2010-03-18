# Copyright (C) 2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Parrot;

INIT {
	macro_const(
		:DATATYPE_UNDEF(			0 ),
		:DATATYPE_INTVAL(			-100 ),
		:DATATYPE_FLOATVAL(		-99 ),
		:DATATYPE_STRING(			-98 ),
		:DATATYPE_PMC(			-97 ),
		:DATATYPE_BIGINT(			-96 ),
		:DATATYPE_DPOINTER(		-95 ),
		:DATATYPE_CHAR(			-94 ),
		:DATATYPE_SHORT(			-93 ),
		:DATATYPE_INT(				-92 ),
		:DATATYPE_LONG(			-91 ),
		:DATATYPE_LONGLONG(		-90 ),
		:DATATYPE_UCHAR(			-89 ),
		:DATATYPE_USHORT(			-88 ),
		:DATATYPE_UINT(			-87 ),
		:DATATYPE_ULONG(			-86 ),
		:DATATYPE_ULONGLONG(		-85 ),
		:DATATYPE_FLOAT(			-84 ),
		:DATATYPE_DOUBLE(			-83 ),
		:DATATYPE_LONGDOUBLE(		-82 ),
		:DATATYPE_BIT(				-81 ),
		:DATATYPE_INT1(			-81 ),
		:DATATYPE_INT4(			-80 ),
		:DATATYPE_INT8(			-79 ),
		:DATATYPE_INT16(			-78 ),
		:DATATYPE_INT32(			-77 ),
		:DATATYPE_INT64(			-76 ),
		:DATATYPE_UINT8(			-75 ),
		:DATATYPE_UINT16(			-74 ),
		:DATATYPE_UINT32(			-73 ),
		:DATATYPE_UINT64(			-72 ),
		:DATATYPE_PTR(			-71 ),
		:DATATYPE_CSTR(			-70 ),
		:DATATYPE_STRUCT_PTR(		-69 ),
		:DATATYPE_STRUCT(			-68 ),
		:DATATYPE_FUNC_PTR(		-67 ),
		:DATATYPE_SIZED(			-66 ),
	);
	
	macro_const(
		:PMCTYPE_default(			0 ),
		:PMCTYPE_Null(				1 ),
		:PMCTYPE_Env(				2 ),
		:PMCTYPE_Key(				3 ),
		:PMCTYPE_UnManagedStruct(	4 ),
		:PMCTYPE_ManagedStruct(		5 ),
		:PMCTYPE_Exception(			6 ),
		:PMCTYPE_ParrotLibrary(		7 ),
		:PMCTYPE_ParrotInterpreter(		8 ),
		:PMCTYPE_ParrotThread(		9 ),
		:PMCTYPE_LexPad(			10 ),
		:PMCTYPE_Pointer(			11 ),
		:PMCTYPE_Sub(				12 ),
		:PMCTYPE_Coroutine(			13 ),
		:PMCTYPE_Eval(				14 ),
		:PMCTYPE_EventHandler(		15 ),
		:PMCTYPE_Continuation(		16 ),
		:PMCTYPE_RetContinuation(		17 ),
		:PMCTYPE_ExceptionHandler(	18 ),
		:PMCTYPE_NCI(				19 ),
		:PMCTYPE_BigInt(			20 ),
		:PMCTYPE_BigNum(			21 ),
		:PMCTYPE_Complex(			22 ),
		:PMCTYPE_FixedIntegerArray(	23 ),
		:PMCTYPE_ResizableIntegerArray(	24 ),
		:PMCTYPE_Iterator(			25 ),
		:PMCTYPE_ArrayIterator(		26 ),
		:PMCTYPE_HashIterator(		27 ),
		:PMCTYPE_OrderedHashIterator(	28 ),
		:PMCTYPE_StringIterator(		29 ),
		:PMCTYPE_FixedStringArray(		30 ),
		:PMCTYPE_ResizableStringArray(	31 ),
		:PMCTYPE_Hash(				32 ),
		:PMCTYPE_AddrRegistry(		33 ),
		:PMCTYPE_LexInfo(			34 ),
		:PMCTYPE_NameSpace(		35 ),
		:PMCTYPE_OrderedHash(		36 ),
		:PMCTYPE_OS(				37 ),
		:PMCTYPE_File(				38 ),
		:PMCTYPE_OpLib(			39 ),
		:PMCTYPE_Opcode(			40 ),
		:PMCTYPE_CallContext(		41 ),
		:PMCTYPE_Capture(			42 ),
		:PMCTYPE_Class(				43 ),
		:PMCTYPE_PMCProxy(			44 ),
		:PMCTYPE_CPointer(			45 ),
		:PMCTYPE_Exporter(			46 ),
		:PMCTYPE_FixedBooleanArray(	47 ),
		:PMCTYPE_ResizableBooleanArray(	48 ),
		:PMCTYPE_FixedFloatArray(		49 ),
		:PMCTYPE_ResizableFloatArray(	50 ),
		:PMCTYPE_FixedPMCArray(		51 ),
		:PMCTYPE_ResizablePMCArray(	52 ),
		:PMCTYPE_MultiSub(			53 ),
		:PMCTYPE_Handle(			54 ),
		:PMCTYPE_FileHandle(			55 ),
		:PMCTYPE_Socket(			56 ),
		:PMCTYPE_StringHandle(		57 ),
		:PMCTYPE_HashIteratorKey(		58 ),
		:PMCTYPE_ImageIO(			59 ),
		:PMCTYPE_ImageIOSize(		60 ),
		:PMCTYPE_Object(			61 ),
		:PMCTYPE_Packfile(			62 ),
		:PMCTYPE_PackfileAnnotation(	63 ),
		:PMCTYPE_PackfileFixupEntry(	64 ),
		:PMCTYPE_PackfileSegment(		65 ),
		:PMCTYPE_PackfileAnnotations(	66 ),
		:PMCTYPE_PackfileConstantTable(	67 ),
		:PMCTYPE_PackfileDirectory(		68 ),
		:PMCTYPE_PackfileFixupTable(	69 ),
		:PMCTYPE_PackfileRawSegment(	70 ),
		:PMCTYPE_ParrotRunningThread(	71 ),
		:PMCTYPE_Role(				72 ),
		:PMCTYPE_scalar(			73 ),
		:PMCTYPE_Float(				74 ),
		:PMCTYPE_Integer(			75 ),
		:PMCTYPE_Boolean(			76 ),
		:PMCTYPE_String(			77 ),
		:PMCTYPE_CodeString(			78 ),
		:PMCTYPE_Scheduler(			79 ),
		:PMCTYPE_SchedulerMessage(	80 ),
		:PMCTYPE_Sockaddr(			81 ),
		:PMCTYPE_Task(				82 ),
		:PMCTYPE_Timer(			83 ),
		:PMCTYPE_Undef(			84 ),
		:PMCTYPE_core_max(			85 ),
	);
}

module Parrot::Unix::Stat ;

INIT {
	Parrot::macro_const(
		:S_IFMT(		0o0170000 ),
		:S_IFSOCK(	0o0140000 ),
		:S_IFLNK(		0o0120000 ),
		:S_IFREG(		0o0100000 ),
		:S_IFBLK(		0o0060000 ),
		:S_IFDIR(		0o0040000 ),
		:S_IFCHR(		0o0020000 ),
		:S_IFIFO(		0o0010000 ),
		:S_ISUID(		0o0004000 ),
		:S_ISGID(		0o0002000 ),
		:S_ISVTX(		0o0001000 ),
		
		:S_IRWXU(		0o0700 ),
		:S_IRUSR(		0o0400 ),
		:S_IWUSR(		0o0200 ),
		:S_IXUSR(		0o0100 ),

		:S_IRWXG(		0o0070 ),
		:S_IRGRP(		0o0040 ),
		:S_IWGRP(		0o0020 ),
		:S_IXGRP(		0o0010 ),

		:S_IRWXO(		0o00070 ),
		:S_IROTH(		0o0004 ),
		:S_IWOTH(	0o0002 ),
		:S_IXOTH(		0o0001 ),
	);

	export( <
		S_ISBLK
		S_ISCHR
		S_ISDIR
		S_ISFIFO
		S_ISLNK
		S_ISREG
		S_ISSOCK >);
}

# NB:  Have to use qualified names for these constants because otherwise NQP looks in root nsp.
sub S_ISBLK($mode)	{ pir::band__III($mode, Parrot::Unix::Stat::S_IFMT) == Parrot::Unix::Stat::S_IFBLK; }
sub S_ISCHR($mode)	{ pir::band__III($mode, Parrot::Unix::Stat::S_IFMT) == Parrot::Unix::Stat::S_IFCHR; }
sub S_ISDIR($mode)	{ pir::band__III($mode, Parrot::Unix::Stat::S_IFMT) == Parrot::Unix::Stat::S_IFDIR; }
sub S_ISFIFO($mode)	{ pir::band__III($mode, Parrot::Unix::Stat::S_IFMT) == Parrot::Unix::Stat::S_IFFIFO; }
sub S_ISLNK($mode)	{ pir::band__III($mode, Parrot::Unix::Stat::S_IFMT) == Parrot::Unix::Stat::S_IFLNK; }
sub S_ISREG($mode)	{ pir::band__III($mode, Parrot::Unix::Stat::S_IFMT) == Parrot::Unix::Stat::S_IFREG; }
sub S_ISSOCK($mode)	{ pir::band__III($mode, Parrot::Unix::Stat::S_IFMT) == Parrot::Unix::Stat::S_IFSOCK; }
