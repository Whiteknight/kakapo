# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module NameSpace;
# Provides missing methods to NameSpace PMC.

# FIXME: I'd like to add a 'new' that maps to make_namespace.

method contains($name) {
	! pir::isnull__IP(self.find_var($name))
	|| !pir::isnull__IP(self.find_namespace($name));
}

method string_name(:$hll) {
	my @parts := self.get_name;	
	@parts.shift unless $hll;
	@parts.join('::');
}