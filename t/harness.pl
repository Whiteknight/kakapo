#! /usr/bin/env perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use File::Spec;
use Getopt::Long qw(:config pass_through);

use TAP::Harness;

GetOptions(
	'comments'		=> \my $show_comments,
	'failures'		=> \my $show_failures,
	'jobs'			=> \my $jobs,
	'verbosity=i'		=> \my $verbosity,
);

my ($slash, $sh_ext);

if ($^O eq 'MSWin32') {
	$slash = '\\';
	$sh_ext = '.cmd';
} else {
	$slash = '/';
	$sh_ext = '.sh';
}

my $root_dir = $ENV{'HARNESS_ROOT_DIR'} || "$FindBin::Bin/..";
$ENV{'HARNESS_ROOT_DIR'} = $root_dir;

my $harness_nqp = $root_dir . '/t/harness-nqp.sh';
$harness_nqp =~ s#/#$slash#g unless $slash eq '/';
die "Cannot find harness-nqp script. Did you set HARNESS_ROOT_DIR?" unless -x $harness_nqp;

my @files;

# Turn args into files, expanding @list-files
for (@ARGV) {
	if (/@(.+)/) {
		open(LIST, '<', $_)
			or die "Could not open test-list file: $!";
			
		while (<LIST>) {
			next if /^\s*$/ || /^\s*#/;
			chomp;

			s/^\s*(.*\S)\s*$/$1/;
			s#/#$slash#g unless $slash eq '/';
			
			if (-r $_) {
				push @files, $_;
			}
			else {
				warn "Missing test file: $_\n";
			}
		}
		
		close(LIST)
			or die "Failed to close test-list file: $!";
	}
	else {
		push @files, $_;
	}
}

# Turn directories into expanded trees.
my @test_files = map { all_in($_) } sort @files;

# adapted to return only sub-files ending in '.nqp'
my $ext = 'nqp';

sub all_in {
	my $start = shift;
	
	if (! -r $start) {
		warn "Bad test: $start - $!";
		return ();
	}
	
	return $start unless -d $start;

	my @skip = ( File::Spec->updir, File::Spec->curdir, qw( .svn CVS .git ) );
	my %skip = map {($_,1)} @skip;

	my @hits = ();

	if ( opendir( my $dh, $start ) ) {
		my @dir_files = sort readdir $dh;
		closedir $dh or die $!;
		
		for my $file ( @dir_files ) {
			next if $skip{$file};
			my $currfile = File::Spec->catfile( $start, $file );
			
			if ( -d $currfile ) {
				push( @hits, all_in( $currfile ) );
			}
			else {
				push( @hits, $currfile ) 
					if $currfile =~ /\.nqp$/;
			}
		}
	}
	else {
		warn "$start: $!\n";
	}

	return @hits;
}

my %args = (
	comments	=> $show_comments,
	exec		=> [ $harness_nqp ],
	failures	=> $show_failures,
	jobs		=> $jobs,
	verbosity	=> $verbosity,
);

my $harness  = TAP::Harness->new( \%args )->runtests(@test_files);

