# Copyright (C) 2009-2010, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Nqp;

sub compile_file($name) {
	my $compiler := pir::compreg__PS('NQP-rx');

	my $code := File::slurp($name);
	$code := $compiler.compile: $code;
}

