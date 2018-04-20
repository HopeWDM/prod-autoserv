#!/usr/bin/perl -w

use strict;

use Net::Telnet;

sub doStuff {
        my @output;
        my $telnet = new Net::Telnet (Timeout=>3, Errmode=>'die', Port=>9993);
        $telnet->open('1.2.3.4');
        #$telnet->login("username", "password");
        $telnet->print('slot select: slot id: 1');
        @output = $telnet->waitfor('/200 ok/');
        print @output;
        $telnet->print('format: prepare: exFAT');
        @output = $telnet->waitfor('/\n[a-z]{6}\n/');
        print @output;
        my $string = $output[-1];
        chop($string);
        $string = reverse($string);
        chop($string);
        my $specialcode = reverse($string);
        my $specialcodestring = 'format: confirm: '.$specialcode;
        $telnet->print($specialcodestring);
        @output = $telnet->waitfor('/200 ok/');
        print @output;
        print "\n\n";
}

doStuff;
