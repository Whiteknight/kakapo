# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Exception::BadBufferSize is Exception::Wrapper {
	method type()	{ 0; }
}

class Exception::MissingEncodingName is Exception::Wrapper {
	method type()	{ 1; }
}

class Exception::InvalidStringRepresentation is Exception::Wrapper {
	method type()	{ 2; }
}

class Exception::IcuError is Exception::Wrapper {
	method type()	{ 3; }
}

class Exception::Unimplemented is Exception::Wrapper {
	method type()	{ 4; }
}

class Exception::NullRegAccess is Exception::Wrapper {
	method type()	{ 5; }
}

class Exception::NoRegFrames is Exception::Wrapper {
	method type()	{ 6; }
}

class Exception::SubstrOutOfString is Exception::Wrapper {
	method type()	{ 7; }
}

class Exception::OrdOutOfString is Exception::Wrapper {
	method type()	{ 8; }
}

class Exception::MalformedUtf8 is Exception::Wrapper {
	method type()	{ 9; }
}

class Exception::MalformedUtf16 is Exception::Wrapper {
	method type()	{ 10; }
}

class Exception::MalformedUtf32 is Exception::Wrapper {
	method type()	{ 11; }
}

class Exception::InvalidCharacter is Exception::Wrapper {
	method type()	{ 12; }
}

class Exception::InvalidChartype is Exception::Wrapper {
	method type()	{ 13; }
}

class Exception::InvalidEncoding is Exception::Wrapper {
	method type()	{ 14; }
}

class Exception::InvalidCharclass is Exception::Wrapper {
	method type()	{ 15; }
}

class Exception::NegRepeat is Exception::Wrapper {
	method type()	{ 16; }
}

class Exception::NegSubstr is Exception::Wrapper {
	method type()	{ 17; }
}

class Exception::NegSleep is Exception::Wrapper {
	method type()	{ 18; }
}

class Exception::NegChop is Exception::Wrapper {
	method type()	{ 19; }
}

class Exception::InvalidOperation is Exception::Wrapper {
	method type()	{ 20; }
}

class Exception::ArgOpNotHandled is Exception::Wrapper {
	method type()	{ 21; }
}

class Exception::KeyNotFound is Exception::Wrapper {
	method type()	{ 22; }
}

class Exception::JitUnavailable is Exception::Wrapper {
	method type()	{ 23; }
}

class Exception::ExecUnavailable is Exception::Wrapper {
	method type()	{ 24; }
}

class Exception::InterpError is Exception::Wrapper {
	method type()	{ 25; }
}

class Exception::PrederefLoadError is Exception::Wrapper {
	method type()	{ 26; }
}

class Exception::ParrotUsageError is Exception::Wrapper {
	method type()	{ 27; }
}

class Exception::PioError is Exception::Wrapper {
	method type()	{ 28; }
}

class Exception::ParrotPointerError is Exception::Wrapper {
	method type()	{ 29; }
}

class Exception::DivByZero is Exception::Wrapper {
	method type()	{ 30; }
}

class Exception::PioNotImplemented is Exception::Wrapper {
	method type()	{ 31; }
}

class Exception::AllocationError is Exception::Wrapper {
	method type()	{ 32; }
}

class Exception::InternalPanic is Exception::Wrapper {
	method type()	{ 33; }
}

class Exception::OutOfBounds is Exception::Wrapper {
	method type()	{ 34; }
}

class Exception::JitError is Exception::Wrapper {
	method type()	{ 35; }
}

class Exception::ExecError is Exception::Wrapper {
	method type()	{ 36; }
}

class Exception::IllInherit is Exception::Wrapper {
	method type()	{ 37; }
}

class Exception::NoPrevCs is Exception::Wrapper {
	method type()	{ 38; }
}

class Exception::NoClass is Exception::Wrapper {
	method type()	{ 39; }
}

class Exception::LexNotFound is Exception::Wrapper {
	method type()	{ 40; }
}

class Exception::PadNotFound is Exception::Wrapper {
	method type()	{ 41; }
}

class Exception::AttribNotFound is Exception::Wrapper {
	method type()	{ 42; }
}

class Exception::GlobalNotFound is Exception::Wrapper {
	method type()	{ 43; }
}

class Exception::ExternalError is Exception::Wrapper {
	method type()	{ 44; }
}

class Exception::MethodNotFound is Exception::Wrapper {
	method type()	{ 45; }
}

class Exception::VtableNotFound is Exception::Wrapper {
	method type()	{ 46; }
}

class Exception::WriteToConstclass is Exception::Wrapper {
	method type()	{ 47; }
}

class Exception::Nospawn is Exception::Wrapper {
	method type()	{ 48; }
}

class Exception::InternalNotImplemented is Exception::Wrapper {
	method type()	{ 49; }
}

class Exception::ErrOverflow is Exception::Wrapper {
	method type()	{ 50; }
}

class Exception::LossyConversion is Exception::Wrapper {
	method type()	{ 51; }
}

class Exception::RoleCompositionMethodConflict is Exception::Wrapper {
	method type()	{ 52; }
}

class Exception::UnexpectedNull is Exception::Wrapper {
	method type()	{ 53; }
}

class Exception::LibraryError is Exception::Wrapper {
	method type()	{ 54; }
}

class Exception::LibraryNotLoaded is Exception::Wrapper {
	method type()	{ 55; }
}

class Exception::SyntaxError is Exception::Wrapper {
	method type()	{ 56; }
}

class Exception::MalformedPackfile is Exception::Wrapper {
	method type()	{ 57; }
}

class Control::Return is Exception::Wrapper {
	method type()	{ 58; }
}

class Control::Ok is Exception::Wrapper {
	method type()	{ 59; }
}

class Control::Break is Exception::Wrapper {
	method type()	{ 60; }
}

class Control::Continue is Exception::Wrapper {
	method type()	{ 61; }
}

class Control::Error is Exception::Wrapper {
	method type()	{ 62; }
}

class Control::Take is Exception::Wrapper {
	method type()	{ 63; }
}

class Control::Leave is Exception::Wrapper {
	method type()	{ 64; }
}

class Control::LoopNext is Exception::Wrapper {
	method type()	{ 65; }
}

class Control::LoopLast is Exception::Wrapper {
	method type()	{ 66; }
}

class Control::LoopRedo is Exception::Wrapper {
	method type()	{ 67; }
}

