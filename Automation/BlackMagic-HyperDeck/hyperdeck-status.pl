#!/usr/bin/perl -w

use strict;

use Net::Telnet;

our $ip_addr_1 = '10.40.31.120';
our $ip_addr_2 = '10.40.31.121';
our $nl = "\n";

our $relay_on_1 = 'relay_1_on.py';
our $relay_on_2 = 'relay_2_on.py';

our $relay_off_1 = 'relay_1_off.py';
our $relay_off_2 = 'relay_2_off.py';

sub statuser {
        my $ip_addr = shift;
	my $relay_on = shift;
	my $relay_off = shift;
	#my $pick_slot = shift;
        #print "This run:\n";
        print "IP Address: $ip_addr\n";
        #print "$pick_slot\n";
        my @output;
        my $telnet = new Net::Telnet (Timeout=>10, Errmode=>'return', Port=>9993);
        $telnet->open($ip_addr);
        $telnet->print('transport info');
        @output = $telnet->waitfor('/status.*/'); # looks for "status" followed by the rest of the line
        my $string = $output[1]; # for some reason this is how the array is split up from the telnet input, IDK why
	my @stati = split (' ', $string); # splits the "status" line up on the space
	my $value = $stati[1]; # we only care about what's *after* the space on the "status" line
	print $value.$nl; # show us what we care about
	if ( $value eq "record" ) {
		print "we are recording".$nl;
		print "relay on: $relay_on:".$nl;
		system("python /home/production/python/$relay_on");
	} else {
		print "we areN'T recording".$nl;
		print "relay off: $relay_off:".$nl;
		system("python /home/production/python/$relay_off");
		}
}

sub run_statuses {
        statuser ($ip_addr_1, $relay_on_1, $relay_off_1);
	sleep 2;
        statuser ($ip_addr_2, $relay_on_2, $relay_off_2);
}

run_statuses;
