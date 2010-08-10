#~ # Copyright (C) 2009, Austin Hastings. See accompanying LICENSE file, or 
#~ # http://www.opensource.org/licenses/artistic-license-2.0.php for license.

module File;
#~ # Wrapper for File PMC type, providing a few extra functions. 

#~ sub _get_pmc() {
	#~ unless pir::defined( our $_Pmc ) {
		#~ $_Pmc := pir::new__PS( 'File' );
	#~ }
	
	#~ $_Pmc;
#~ }

#~ sub copy($from, $to) {
	#~ _get_pmc().copy($from, $to);
#~ }

#~ sub exists($path) {
	#~ return _get_pmc().exists($path);
#~ }

#~ sub find_all($path, @search_list) {
	#~ NOTE("Finding all paths matching '", $path, "' in ", +@search_list, " directories");
	#~ my @results := [ ];
	
	#~ if String::char_at($path, 0) eq '/' {
		#~ NOTE("Path is rooted - not using search paths");
		#~ @search_list := [ '' ];
	#~ }
	#~ else {
		#~ $path := '/' ~ $path;
	#~ }
	
	#~ for @search_list {
		#~ my $name := $_ ~ $path;
		#~ NOTE("Trying ", $name);
		
		#~ if exists($name) {
			#~ NOTE("Success! it's a match");
			#~ @results.push($name);
		#~ }
	#~ }
	
	#~ NOTE("Found ", +@results, " results");
	#~ DUMP(@results);
	#~ return @results;
#~ }
			
#~ sub find_first($path, @search_list) {
	#~ return find_all($path, @search_list)[0];
#~ }

#~ sub is_dir($path) {
	#~ return _get_pmc().is_dir($path);
#~ }

#~ sub is_file($path) {
	#~ return _get_pmc().is_file($path);
#~ }

#~ sub is_link($path) {
	#~ return _get_pmc().is_link($path);
#~ }

#~ sub rename($from, $to) {
	#~ _get_pmc().rename($from, $to);
#~ }

sub slurp($path) {
	my $fh := pir::new__PS('FileHandle');
	my $data := $fh.readall($path);
}
