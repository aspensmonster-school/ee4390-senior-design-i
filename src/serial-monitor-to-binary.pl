#!/usr/bin/perl

# file: serial-monitor-to-binary.pl
# Purpose: Convert serial monitor from arduino into a binary file of 32 bit 
# unsigned ints.

use warnings;
no warnings "portable";
use strict;

use File::Slurp;

my $inputFile = read_file('rng-output');

open(my $outputFile, '>:raw', 'rand-stream.bin') or die "Can't open: $!";

#get rid of the newlines
$inputFile =~ s/\n//g;

my @array = ();
push @array, $1 while ($inputFile =~ /(.{1,32})/msxog);

foreach my $elem(@array) {
    print $outputFile pack('L',$elem);
}

close($outputFile);
