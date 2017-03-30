#!/usr/bin/perl -W
use strict;
use warnings;
use Switch;

# Put this file at "/opt/scripts/display-status/file.pl"
# for use with "prod-autoserv".

sub getData {
        system('/opt/scripts/display-status/getter.sh');
}

# 0. have "getter" get stuff, before this script runs
# 1. Get variables ready
# 2. Read everything in
# 3. Make sure there's no %02 or %03
# 4. Put it all in array @data
# 5. Go line-by-line and grab statuses
# 6. As going line by line and grabbing, store in hash
# 7. Print stuff (parsed!) back out as necessary.
# 8. Web pages will read written-out stuff as JavaScript


# places that unit-specific code is kept:
# 1. initializing variables (hashes)
# 2. switch/case under "line by line" subroutine
# 3. "print" lines at the end
#       (twice per line, and two lines per projector!)
# 4.


# vars and such:
our @data;
our %bridge_mainLeft;
our %bridge_mainRight;
our %bridge_mainCenter;
our %bridge_foldbackCenter;
our %chapel_mainSide;
our %chapel_mainCenter;
our %chapel_foldbackSide;
our %gym_mainSide;
our %well_mainCenter;
our %rm101A_mainCenter;
our %rm101C_mainCenter;
our %rm102_mainCenter;
our %rm104_mainCenter;
our %rm128_mainCenter;
our %rm212_mainCenter;
our %rm214_mainCenter;
our %rm216_mainCenter;
our %rmRR1_mainCenter;
our %rmXX_mainCenter;


sub doFileRead() {
                open (my $fh, "<", "/opt/data/projstatus/dumpstatus.txt")
                                or die "Failed to open file $!\n";

                while (my $x = <$fh>) {
                                # cut off the trailing newline
                                chomp $x;
                                # the following four lines are redundant,
                                # since they should be caught by the "getter"
                                # script when it outputs the big file.
                                $x =~ s/%02//g;
                                $x =~ s/%03//g;
                                $x =~ s/%0D//g;
                                $x =~ s/%0A//g;
                                # append line $x to array @data
                                push @data, $x;
                }
}


sub lineByLine() {
        my $x;
        foreach $x (@data) {
                if ($x =~ m/bridge_mainLeft/) { %bridge_mainLeft = parseLine($x); }
                if ($x =~ m/bridge_mainRight/) { %bridge_mainRight = parseLine($x); }
                if ($x =~ m/bridge_mainCenter/) { %bridge_mainCenter = parseLine($x); }
                if ($x =~ m/bridge_foldbackCenter/) { %bridge_foldbackCenter = parseLine($x); }
                if ($x =~ m/chapel_mainSide/) { %chapel_mainSide = parseLine($x); }
                if ($x =~ m/chapel_mainCenter/) { %chapel_mainCenter = parseLine($x); }
                if ($x =~ m/chapel_foldbackSide/) { %chapel_foldbackSide = parseLine($x); }
                if ($x =~ m/gym_mainSide/) { %gym_mainSide = parseLine($x); }
                if ($x =~ m/well_mainCenter/) { %well_mainCenter = parseLine($x); }
                if ($x =~ m/rm101A_mainCenter/) { %rm101A_mainCenter = parseLine($x); }
                if ($x =~ m/rm101C_mainCenter/) { %rm101C_mainCenter = parseLine($x); }
                if ($x =~ m/rm102_mainCenter/) { %rm102_mainCenter = parseLine($x); }
                if ($x =~ m/rm104_mainCenter/) { %rm104_mainCenter = parseLine($x); }
                if ($x =~ m/rm128_mainCenter/) { %rm128_mainCenter = parseLine($x); }
                if ($x =~ m/rm212_mainCenter/) { %rm212_mainCenter = parseLine($x); }
                if ($x =~ m/rm214_mainCenter/) { %rm214_mainCenter = parseLine($x); }
                if ($x =~ m/rm216_mainCenter/) { %rm216_mainCenter = parseLine($x); }
                if ($x =~ m/rmRR1_mainCenter/) { %rmRR1_mainCenter = parseLine($x); }
        }
}
#TODO: try something like
#while ($item =~ m/(00|80|40|20|10|28|02|24|04|21|81|88)
#$status=$statusHashname{$1}
sub parseLine {
        # declare some vars
        my %hashName;
        our ($power,$hoursAll,$hours1,$hours2,$hours3,$hours4);
        # $data is whatever was passed to us
        my $data = shift;
        # split out the line from Extron box
        my ($proj,$item,$type,$value) = split /,/, $data;
        # truncates whitespace from end of $value
        $value =~ s/\s+$//;
        # determine what item (power, lamp hours, etc) we're
        # looking at, and act upon it.
        if ($item =~ m/power/) {
                if ($type =~ m/panasonicPJLink/) {
                        if ($value =~ m/000/) {
                                $power = 'off';
                        }
                        else {
                                if ($value =~ m/001/) {
                                        $power = 'on';
                                }
                                else {
                                        $power = 'no match for power';
                                        #errorWrapper($power);
                                }
                        }
                }
                else {
                        if ($type =~ m/sanyoPLC/) {
                                if ($value =~ m/00/) {
                                        $power = 'on';
                                }
                                else {
                                        if ($value =~ m/80/) {
                                                $power = 'off';
                                        }
                                        else {
                                                if (($value =~ m/40/) || ($value =~ m/20/)) {
                                                        $power = 'in-between';
                                                }
                                                else {
                                                        $power = 'some sort of error has occured';
                                                        #errorWrapper($power);
                                                }
                                        }
                                }
                        }
                        else {
                                if ($type =~ m/lgTV/) {
                                        if ($value =~ m/a\s01\sOK/) {
                                                $power = 'on';
                                        }
                                        else {
                                                if ($value =~ m/a\s00\sOK/) {
                                                        $power = 'off';
                                                }
                                                else {
                                                        if ($value =~ m/^$/) {
                                                                $power = 'no response';
                                                        }
                                                        else {
                                                                $power = 'oops';
                                                        }
                                                }
                                        }
                                }
                        }
                }
        }
        else {
                if ($item =~ m/lampHoursAll/) {
                        ($hours1,$hours2,$hours3,$hours4) = split / /, $value;
                }
                else {
                        my $error = 'This does not seem to be lamp hours or power.';
                        #errorWrapper($error);
                }
        }



        %hashName = (
                proj => $proj,
                type => $type,
                power => $power,
        #       hoursAll => $hoursAll,
                hours1 => $hours1,
                hours2 => $hours2,
                hours3 => $hours3,
                hours4 => $hours4,
        );


#       print %hashName;
#       print "\n";
#       print $hashName{'power'};
#       print "\n\n\n";
        # return our temporary hash,
        # just for the fun of it:
        return %hashName;
}
sub errorWrapper {
        my $message = shift;
        print "\n\n\n\n\n";
        print '**********';
        print $message;
        print '**********';
        print "\n\n\n\n\n";
}
sub printStuff {
        my $projvar = shift;
        #my $projvar = $_[0];
        if (defined $projvar ) { 
                if ($projvar ne '') {
                        if ($projvar ne 'x') {
                                print "\'".$projvar."\'";
                        }
                        else {
                                print "\'".'GEEK_ERR_eq_x'."\'";
                        }
                }
                else {
                        print "\'".'GEEK_ERR_empty_string'."\'";
                }
        }
        else {
                print "\'".'GEEK_ERR_undefined_value'."\'";
        }
        print ';'."\n";
        #if (defined $projvar ) { print $projvar; } else { print 'GEEK_ERR'; }
}

sub printer {

        # "cs" = "comma space"
        my $cs = ', ';
        my $h1 = 'hours1';
        my $h2 = 'hours2';
        my $h3 = 'hours2';
        my $h4 = 'hours2';

        print 'function readVars() {';
        print "\n";

        # print stuff out to JavaScript

        print 'bridge_mainLeft_power = ';
        printStuff($bridge_mainLeft{'power'});
        print 'bridge_mainLeft_hours = ';
        printStuff(
                $bridge_mainLeft{$h1}
                .$cs.
                $bridge_mainLeft{$h2}
#               .$cs.
#               $bridge_mainLeft{$h3}
#               .$cs.
#               $bridge_mainLeft{$h4}
        );

        print 'bridge_mainRight_power = ';
        printStuff($bridge_mainRight{'power'});
        print 'bridge_mainRight_hours = ';
        printStuff(
                $bridge_mainRight{$h1}
                .$cs.
                $bridge_mainRight{$h2}
#               .$cs.
#               $bridge_mainRight{$h3}
#               .$cs.
#               $bridge_mainRight{$h4}
        );

        print 'bridge_mainCenter_power = ';
        printStuff($bridge_mainCenter{'power'});
        print 'bridge_mainCenter_hours = ';
        printStuff(
                $bridge_mainCenter{$h1}
                .$cs.
                $bridge_mainCenter{$h2}
                .$cs.
                $bridge_mainCenter{$h3}
                .$cs.
                $bridge_mainCenter{$h4}
        );

        print 'bridge_foldbackCenter_power = ';
        printStuff($bridge_foldbackCenter{'power'});
        print 'bridge_foldbackCenter_hours = ';
        printStuff(
                $bridge_foldbackCenter{$h1}
                .$cs.
                $bridge_foldbackCenter{$h2}
#               .$cs.
#               $bridge_foldbackCenter{$h3}
#               .$cs.
#               $bridge_foldbackCenter{$h4}
        );

        print 'chapel_mainSide_power = ';
        printStuff($chapel_mainSide{'power'});
        print 'chapel_mainSide_hours = ';
        printStuff(
                $chapel_mainSide{$h1}
                .$cs.
                $chapel_mainSide{$h2}
#               .$cs.
#               $chapel_mainSide{$h3}
#               .$cs.
#               $chapel_mainSide{$h4}
        );

        print 'chapel_mainCenter_power = ';
        printStuff($chapel_mainCenter{'power'});
        print 'chapel_mainCenter_hours = ';
        printStuff(
                $chapel_mainCenter{$h1}
                .$cs.
                $chapel_mainCenter{$h2}
#               .$cs.
#               $chapel_mainCenter{$h3}
#               .$cs.
#               $chapel_mainCenter{$h4}
        );

        print 'chapel_foldbackSide_power = ';
        printStuff($chapel_foldbackSide{'power'});
        print 'chapel_foldbackSide_hours = ';
        printStuff(
                $chapel_foldbackSide{$h1}
#               .$cs.
#               $chapel_foldbackSide{$h2}
#               .$cs.
#               $chapel_foldbackSide{$h3}
#               .$cs.
#               $chapel_foldbackSide{$h4}
        );

        print 'gym_mainSide_power = ';
        printStuff($gym_mainSide{'power'});
        print 'gym_mainSide_hours = ';
        printStuff(
                $gym_mainSide{$h1}
                .$cs.
                $gym_mainSide{$h2}
#               .$cs.
#               $gym_mainSide{$h3}
#               .$cs.
#               $gym_mainSide{$h4}
        );

        print 'well_mainCenter_power = ';
        printStuff($well_mainCenter{'power'});
        print 'well_mainCenter_hours = ';
        printStuff(
                $well_mainCenter{$h1}
#               .$cs.
#               $well_mainCenter{$h2}
#               .$cs.
#               $well_mainCenter{$h3}
#               .$cs.
#               $well_mainCenter{$h4}
        );

        print 'rm101A_mainCenter_power = ';
        printStuff($rm101A_mainCenter{'power'});
        print 'rm101A_mainCenter_hours = ';
        printStuff(
                $rm101A_mainCenter{$h1}
#               .$cs.
#               $rm101A_mainCenter{$h2}
#               .$cs.
#               $rm101A_mainCenter{$h3}
#               .$cs.
#               $rm101A_mainCenter{$h4}
        );

        print 'rm101C_mainCenter_power = ';
        printStuff($rm101C_mainCenter{'power'});
        print 'rm101C_mainCenter_hours = ';
        printStuff(
                $rm101C_mainCenter{$h1}
#               .$cs.
#               $rm101C_mainCenter{$h2}
#               .$cs.
#               $rm101C_mainCenter{$h3}
#               .$cs.
#               $rm101C_mainCenter{$h4}
        );

        print 'rm102_mainCenter_power = ';
        printStuff($rm102_mainCenter{'power'});
        print 'rm102_mainCenter_hours = ';
        printStuff(
                $rm102_mainCenter{$h1}
#               .$cs.
#               $rm102_mainCenter{$h2}
#               .$cs.
#               $rm102_mainCenter{$h3}
#               .$cs.
#               $rm102_mainCenter{$h4}
        );

        print 'rm104_mainCenter_power = ';
        printStuff($rm104_mainCenter{'power'});
        print 'rm104_mainCenter_hours = ';
        printStuff(
                $rm104_mainCenter{$h1}
#               .$cs.
#               $rm104_mainCenter{$h2}
#               .$cs.
#               $rm104_mainCenter{$h3}
#               .$cs.
#               $rm104_mainCenter{$h4}
        );

        print 'rm128_mainCenter_power = ';
        printStuff($rm128_mainCenter{'power'});
        print 'rm128_mainCenter_hours = ';
        printStuff(
                $rm128_mainCenter{$h1}
#               .$cs.
#               $rm128_mainCenter{$h2}
#               .$cs.
#               $rm128_mainCenter{$h3}
#               .$cs.
#               $rm128_mainCenter{$h4}
        );

        print 'rm212_mainCenter_power = ';
        printStuff($rm212_mainCenter{'power'});
        print 'rm212_mainCenter_hours = ';
        printStuff(
                $rm212_mainCenter{$h1}
#               .$cs.
#               $rm212_mainCenter{$h2}
#               .$cs.
#               $rm212_mainCenter{$h3}
#               .$cs.
#               $rm212_mainCenter{$h4}
        );

        print 'rm214_mainCenter_power = ';
        printStuff($rm214_mainCenter{'power'});
        print 'rm214_mainCenter_hours = ';
        printStuff(
                $rm214_mainCenter{$h1}
#               .$cs.
#               $rm214_mainCenter{$h2}
#               .$cs.
#               $rm214_mainCenter{$h3}
#               .$cs.
#               $rm214_mainCenter{$h4}
        );

        print 'rm216_mainCenter_power = ';
        printStuff($rm216_mainCenter{'power'});
        print 'rm216_mainCenter_hours = ';
        printStuff(
                $rm216_mainCenter{$h1}
#               .$cs.
#               $rm216_mainCenter{$h2}
#               .$cs.
#               $rm216_mainCenter{$h3}
#               .$cs.
#               $rm216_mainCenter{$h4}
        );

        print 'rmRR1_mainCenter_power = ';
        printStuff($rmRR1_mainCenter{'power'});
        print 'rmRR1_mainCenter_hours = ';
        printStuff(
                $rmRR1_mainCenter{$h1}
#               .$cs.
#               $rmRR1_mainCenter{$h2}
#               .$cs.
#               $rmRR1_mainCenter{$h3}
#               .$cs.
#               $rmRR1_mainCenter{$h4}
        );

#       print 'rmXX_mainCenter_power = ';
#       printStuff($rmXX_mainCenter{'power'});
#       print 'rmXX_mainCenter_hours = ';
#       printStuff(
#               $rmXX_mainCenter{$h1}
#               .$cs.
#               $rmXX_mainCenter{$h2}
#               .$cs.
#               $rmXX_mainCenter{$h3}
#               .$cs.
#               $rmXX_mainCenter{$h4}
#       );


        print '}';
        print "\n";

}

#print 'var bridge_mainLeft_hours = '.$bridge_mainLeft{"hours"}."\n";
#print 'var bridge_mainRight_hours = '.$bridge_mainRight{"hours"}."\n";
#print 'var bridge_mainCenter_hours = '.$bridge_mainCenter{"hours"}."\n";
#print 'var bridge_foldbackCenter_hours = '.$bridge_foldbackCenter{"hours"}."\n";
#print 'var chapel_mainSide_hours = '.$chapel_mainSide{"hours"}."\n";
#print 'var chapel_mainCenter_hours = '.$chapel_mainCenter{"hours"}."\n";
#print 'var chapel_foldbackSide_hours = '.$chapel_foldbackSide{"hours"}."\n";



sub doEverythingInScript {
        getData;
        #&getHashesReady;
        #&getArraysReady;
        doFileRead;
        #&printFileStuff;
        lineByLine;
        printer;
}
doEverythingInScript;
