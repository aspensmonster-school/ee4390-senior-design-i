#!/usr/bin/perl

# file: PRNG-perl.pl
# uses Perl's rand() function to generate a 32-bit unsigned integer and
# output it to a raw binary file that can then be read by dieharder.

use warnings;
no warnings "portable";
use strict;

my $rand;

open(my $outputFile, '>:raw', 'perl-rand.bin') or die "Can't open: $!";


# 1 billion integers will output a file that's about 4 gigs in size. This 
# will take at least a handful of minutes to finish on a modern (multi-core, 
# 2+ GHz, 3+ GB RAM, SATA drives) machine.
for (my $i = 0 ; $i < 1000000000 ; $i++)
{
  $rand = int(rand(0x100000000));
  print $outputFile pack('L', $rand);
  
}



close($outputFile);
