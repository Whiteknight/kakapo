# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Mimus;

# *@tuple should be $method, @pos, %named, in order.
sub log_call($self, *@tuple) {
	my @log := pir::getattribute__PPS($self, '@!MIMUS_CALLS');
	
	if pir::isnull(@log) {
		@log := pir::new__PS('ResizablePMCArray');
		pir::setattribute__vPSP($self, '@!MIMUS_CALLS', @log);
	}
	
	@log.push(@tuple);
}

sub get_log($mock) {
	pir::getattribute__PPS($mock, '@!MIMUS_CALLS');
}

class Mimus::SuiGeneris;

has @!MIMUS_CALLS;
