#!/usr/bin/perl -w

use strict;

use Net::Telnet;

our $ip_addr_1 = '10.40.31.120';
our $ip_addr_2 = '10.40.31.121';
our $pick_slot_1 = 'slot select: slot id: 1';
our $pick_slot_2 = 'slot select: slot id: 2';

sub formatter {
        my $ip_addr = shift;
        my $pick_slot = shift;
        print "This run:\n";
        print "IP Address: $ip_addr\n";
        print "$pick_slot\n";
        my @output;
        my $telnet = new Net::Telnet (Timeout=>10, Errmode=>'return', Port=>9993);
        $telnet->open($ip_addr);
        #$telnet->login("username", "password");
        $telnet->print($pick_slot);
        @output = $telnet->waitfor('/200 ok/');
        #print @output;
        $telnet->print('format: prepare: exFAT');
        @output = $telnet->waitfor('/\n[a-z]{6}\n/');
        #print @output;
        my $string = $output[-1];
        chop($string);
        $string = reverse($string);
        chop($string);
        my $specialcode = reverse($string);
        my $specialcodestring = 'format: confirm: '.$specialcode;
        $telnet->print($specialcodestring);
        @output = $telnet->waitfor('/200 ok/');
        #print @output;
        #print 'done.';
        print "\n\n";
}

sub run_formats {
        formatter ($ip_addr_1, $pick_slot_1);
        sleep 20;
        formatter ($ip_addr_2, $pick_slot_1);
        sleep 20;
        formatter ($ip_addr_1, $pick_slot_2);
        sleep 20;
        formatter ($ip_addr_2, $pick_slot_2);
}

run_formats;
