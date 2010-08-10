# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Pmc::String;
# Provides basic String functions, and adds some methods to the String PMC.

our sub _pre_initload() {
	my $from_nsp := pir::get_namespace__p();
	$from_nsp.export_methods_to: <String>;
	
	my $pmc_nsp := Parrot::get_hll_namespace( <String> );
	#~ $from_nsp.export_to: $pmc_nsp, < >;
	Parrot::macro_const( $pmc_nsp.make_namespace('CharacterClass'),
		:NONE(			0),
		:ANY(			65535),

		:UPPERCASE(		1),
		:LOWERCASE(		2),
		:ALPHABETIC(		4),
		:NUMERIC(			8),
		:HEXADECIMAL(		16),
		:WHITESPACE(		32),
		:PRINTING(			64),
		:GRAPHICAL(		128),
		:BLANK(			256),
		:CONTROL(			512),
		:PUNCTUATION(		1024),
		:ALPHANUMERIC(		2048),
		:NEWLINE(			4096),
		:WORD(			8192),
	);

}

our method character_offset_of(:$offset = 0, :$line = line_number_of(self, :offset($offset)) - 1) {

	our %Line_number_info;
	
	unless %Line_number_info{self} {
		_init_line_number_info(self);
	}

	my $line_offset := %Line_number_info{self}[$line];
	my $result := $offset - $line_offset;
	
	return $result;
}

our method display_width() {
# Compute the display width of the C<self>, assuming that tabs
# are 8 characters wide, and all other chars are 1 character wide. Thus, a 
# sequence like tab-space-space-tab will have a width of 16, since the two spaces
# do not equate to a full tab stop.
# Returns the computed width of C<self>.

	my $width := 0;
	
	if self {
		my $i := 0;
		my $len := self.length;
		
		while $i < $len {
			if self.char_at($i) eq "\t" {
				$width := $width + 8 - ($width % 8);
			}
			else {
				$width++;
			}
			
			$i++;
		}
	}

	return $width;
}

our method lc() {
	pir::downcase__SS(self);
}

our method find_cclass($cclass, :$offset = 0, :$count = self.length - $offset, *%opts) {
# Returns the index of the first character in C<self> at or after C<:offset()> that
# is a member of the character class C<$class_name>. If C<:count()> is 
# specified, scanning ends after the C<:count()> characters have been scanned. 
# By default, C<:offset(0)> and C<:count(length(self))> are used.

# If no matching characters are found, returns the last index plus one.

	my $result := pir::find_cclass__iisii($cclass, self, $offset, $count);
}

our method find_not_cclass($cclass, :$offset = 0, :$count = self.length - $offset) {
# Behaves like L<#find_cclass> except that the search is for the first
# character B<not> a member of C<$class_name>. Useful for skipping
# leading whitespace, etc.

	my $result := pir::find_not_cclass__iisii($cclass, self, $offset, $count);
}

our method index($lookfor, :$offset = 0) {
	my $result := pir::index__issi( self, $lookfor, $offset );
}

our method is_cclass($cclass, :$offset = 0) {
	my $result := pir::is_cclass__iisi($cclass, self, $offset);
}

our method length(:$offset = 0) {

	my $result := pir::length__is(self);

	if $offset > $result {
		$offset := $result;
	}
	
	$result := $result - $offset;	
}

my sub _init_line_number_info($string) {
	my @lines := [ -1 ];
	my $len := $string.length;
	my $i := -1;
	
	while $i < $len {
		$i := String::find_cclass('NEWLINE', $string, :offset($i + 1));
		@lines.push($i);
	}
	
	our %Line_number_info;
	
	%Line_number_info{$string} := @lines;
	#NOTE("String parsed into ", +@lines, " lines");
	#DUMP(@lines);
}

sub line_number_of($string, *%opts) {
	DUMP(:string($string), :options(%opts));

	unless $string {
		NOTE("String is empty or undef. Returning 1");
		return 1;
	}

	our %Line_number_info;
	
	unless %Line_number_info{$string} {
		_init_line_number_info($string);
	}
	
	my $offset := 0 + %opts<offset>;
	
	NOTE("Bsearching for line number of ", $offset, " in string");
	
	my $line := Array::bsearch(%Line_number_info{$string}, $offset, :cmp('<=>'));
	
	if $line < 0 {
		# Likely case - token is between the newlines.
		$line := (-$line) - 1;
	}

	#$line ++;
	NOTE("Returning line number (1-based): ", $line);
	return $line;
}

sub ltrim_indent($str, $indent) {
	my $limit := find_not_cclass('WHITESPACE', $str);
	
	my $i := 0;
	my $prefix := 0;
	
	while $i < $limit && $prefix < $indent {
		if char_at($str, $i) eq "\t" {
			$prefix := $prefix + 8 - $prefix % 8;
		}
		else {
			$prefix++;
		}
	}
	
	substr($str, $i);
}

our method repeat($times) {
	my $result := Q:PIR {
		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$times'
		$I0 = $P0
		$S1 = repeat $S0, $I0
		%r = box $S1
	};
	
	$result;
}

our method split($delim? = '') {
	pir::split__PSS($delim, self);
}

our method substr($start, $limit? = self.length) {
	my $length	:= self.length;
	
	die( "Invalid start offset ($start) for .substr" )
		if $start > $length || $start + $length < 0;
		
	$start := $start + $length
		if $start < 0;
	$length := $length - $start;

	if $limit > $length {
		$limit := $length;
	}
	elsif $limit < 0 {
		$limit := $limit + $length;
	}

	die( "Invalid length limit ($limit) for .substr" )
		if $limit > $length || $limit < 0;
		
	pir::substr__SSII(self, $start, $limit);
}

our method trim() {
	my $result	:= '';
	my $left	:= find_not_cclass('WHITESPACE', self);
	#NOTE("$left : ", $left);
	
	my $len	:= length(self);
	#NOTE("$len  : ", $len);
	
	if $left < $len {
		my $right := $len - 1;
		
		while is_cclass('WHITESPACE', self, :offset($right)) {
			$right--;
		}
		
		#NOTE("$right: ", $right);
		
		# NB: +1 below to re-include non-ws that broke while.
		$result := substr(self, $left, $right - $left + 1);
	}
	
	#NOTE("result: ", $result);
	return $result;
}

our method uc() {
	pir::upcase__ss(self);
}
