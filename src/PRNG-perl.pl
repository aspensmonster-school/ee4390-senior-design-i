#!/usr/bin/perl

# file: PRNG-perl.pl
# uses Perl's rand() function to generate a 32-bit unsigned integer and
# output it to a raw binary file that can then be read by dieharder.

use warnings;
no warnings "portable";
use strict;

my $rand;

open(my $outputFile, '>:raw', 'perl-rand.bin') or die "Can't open: $!";

for (my $i = 0 ; $i < 1000000 ; $i++)
{
  $rand = int(rand(0x100000000));
  print $outputFile pack('L', $rand);
  
}

close($outputFile);
