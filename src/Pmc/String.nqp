# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module String;
# Provides basic String functions, and adds some methods to the String PMC.

sub _pre_initload() {
	our %Cclass_id := Hash.new(
		:NONE(			0),
		:ANY(				65535),

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


sub character_offset_of($string, *%opts) {
	DUMP(:string($string), :options(%opts));

	our %Line_number_info;
	
	unless %Line_number_info{$string} {
		_init_line_number_info($string);
	}

	my $offset	:= 0 + %opts<offset>;
	
	unless Hash::exists(%opts, 'line') {
		%opts<line> := line_number_of($string, :offset($offset));
	}
	
	my $line		:= -1 + %opts<line>;
	my $line_offset	:= %Line_number_info{$string}[$line];
	NOTE("Line number offset is: ", $line_offset);
	my $result := $offset - $line_offset;
	return $result;
}

sub display_width($str) {
# Compute the display width of the C<$str>, assuming that tabs
# are 8 characters wide, and all other chars are 1 character wide. Thus, a 
# sequence like tab-space-space-tab will have a width of 16, since the two spaces
# do not equate to a full tab stop.
# Returns the computed width of C<$str>.

	my $width := 0;
	
	if $str {
		my $i := 0;
		my $len := length($str);
		
		while $i < $len {
			if char_at($str, $i) eq "\t" {
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

sub downcase($str) {
	my $result := Q:PIR {
		$P0 = find_lex '$str'
		$S0 = $P0
		$S0 = downcase $S0
		%r = box $S0
	};
	
	return $result;
}

sub find_cclass($class_name, $str, *%opts) {
# Returns the index of the first character in C<$str> at or after C<:offset()> that
# is a member of the character class C<$class_name>. If C<:count()> is 
# specified, scanning ends after the C<:count()> characters have been scanned. 
# By default, C<:offset(0)> and C<:count(length($str))> are used.

# If no matching characters are found, returns the last index plus one.

	my $offset	:= 0 + %opts<offset>;
	my $count	:= %opts<count>;
	
	unless $count {
		$count := length($str) - $offset;
	}
	
	our %Cclass_id;
	my $cclass := 0 + %Cclass_id{$class_name};
	
	#NOTE("class = ", $class_name, "(", $cclass, "), offset = ", $offset, ", count = ", $count, ", str = ", $str);

	my $result := Q:PIR {
		.local int cclass, offset, count
		$P0 = find_lex '$cclass'
		cclass = $P0
		$P0 = find_lex '$offset'
		offset = $P0
		$P0 = find_lex '$count'
		count = $P0
		
		.local string str
		$P0 = find_lex '$str'
		str = $P0
	
		$I0 = find_cclass cclass, str, offset, count
		%r = box $I0
		
	};
	
	#NOTE("Result = ", $result);
	return $result;
}

sub find_not_cclass($class_name, $str, *%opts) {
# Behaves like L<#find_cclass> except that the search is for the first
# character B<not> a member of C<$class_name>. Useful for skipping
# leading whitespace, etc.

	my $offset	:= %opts<offset>;
	
	unless $offset {
		$offset := 0;
	}
	
	my $count	:= %opts<count>;
	
	unless $count {
		$count := length($str) - $offset;
	}
	
	our %Cclass_id;
	my $class := 0 + %Cclass_id{$class_name};

	#NOTE("class = ", $class_name, "(", $class, "), offset = ", $offset, ", count = ", $count, ", str = ", $str);
	
	my $result := Q:PIR {
		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$P0 = find_lex '$count'
		$I4 = $P0
		$I0 = find_not_cclass $I1, $S2, $I3, $I4
		%r = box $I0
	};
	
	#NOTE("Result = ", $result);
	return $result;
}

sub index($haystack, $needle, *%opts) {
	my $offset := 0 + %opts<offset>;
	
	my $result := Q:PIR {
		.local string haystack		
		$P0 = find_lex '$haystack'
		haystack = $P0
		
		.local string needle
		$P0 = find_lex '$needle'
		needle = $P0
		
		.local int offset
		$P0 = find_lex '$offset'
		offset = $P0
		
		$I0 = index haystack, needle, offset
		%r = box $I0
	};
	
	return $result;
}

sub is_cclass($class_name, $str, *%opts) {
	our %Cclass_id;
	my $offset	:= 0 + %opts<offset>;
	my $class	:= 0 + %Cclass_id{$class_name};
	
	#say("class = ", $class_name, "(", $class, "), offset = ", $offset, ", str = ", $str);
	
	my $result := Q:PIR {
		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$I0 = is_cclass $I1, $S2, $I3
		%r = box $I0
	};
	
	#NOTE("Result = ", $result);
	return $result;
}

method length(*%opts) {
	my $offset	:= 0 + %opts<offset>;
	#NOTE("Computing length of string beyond offset ", $offset);
	#DUMP(self);
	
	my $result	:= Q:PIR {
		$P0 = find_lex 'self'
		$S0 = $P0
		$I0 = length $S0
		%r = box $I0
	};

	if $offset > $result {
		$offset := $result;
	}
	
	$result := $result - $offset;
	
	#NOTE("Result = ", $result);
	return $result;
}

sub _init_line_number_info($string) {
	#NOTE("Initializing line-number information of previously-unseen string");
	#DUMP($string);
	
	my @lines := Array::new(-1);
	my $len := String::length($string);
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

=begin
=item isa( $type ) returns Boolean

Returns C< true > if the invocant is a member of the class or PMC type named
by the parameter. Returns C< false > otherwise.

=begin code
	if $object.isa( 'Undef' ) { ... }
=end code
=end

method isa($type) {
	pir::isa(self, $type);
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
	
	return substr($str, $i);
}

method repeat($times) {
	my $result := Q:PIR {
		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$times'
		$I0 = $P0
		$S1 = repeat $S0, $I0
		%r = box $S1
	};
	
	return $result;
}

method split($delim?) {
	pir::split__PSS($delim, self);
}

method substr($start, *@rest) {
	my $len	:= length(self);
	
	if $start < 0 {
		$start := $start + $len;
	}
	
	if $start > $len {
		$start	:= $len;
	}

	$len := $len - $start;
	
	my $limit := $len;
	
	if +@rest {
		$limit := @rest.shift();
		
		if $limit < 0 {
			$limit := $limit + $len;
		}
		
		if $limit > $len {
			$limit := $len;
		}
	}

	my $result := Q:PIR {
		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$start'
		$I0 = $P0
		$P0 = find_lex '$limit'
		$I1 = $P0
		$S1 = substr $S0, $I0, $I1
		%r = box $S1
	};
	
	return $result;
}

method trim() {
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