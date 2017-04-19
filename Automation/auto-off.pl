#!/usr/bin/perl -W

# location:
# /opt/scripts/display-automation/run_auto-off.sh

use strict;
use warnings;

our @data;

sub doFileRead {
		open (my $fh, "<", "/var/www/html/javascript/auto-off.js")
				or die "Failed to open file $!\n";

		while (my $x = <$fh>) {
				# cut off the trailing newline
				chomp $x;
				if ($x =~ m/enabled/) { system('/opt/scripts/display-automation/run_auto-off.sh'); }
				if ($x =~ m/disabled/) { system('/opt/scripts/display-automation/no_auto-off.sh'); }
		}
}
doFileRead;
