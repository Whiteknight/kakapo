# Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module Undef;
# Provides missing methods to Undef PMC. See also C< Kakapo::Pmc::COMMON >.
method defined()			{ 0 }
method does($role)			{ 0 }
