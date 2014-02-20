#!/usr/bin/env perl

#This script should eventually debias the bitstream.

use warnings;
use strict;

my $in = "output.after-comparator-fix";
my $out = "output-debias";

open(my $outputFile, '>', $out) or die "Can't open: $!";
open(my $inputFile, '<', $in) or die "Can't open: $!";

binmode($inputFile);
binmode($outputFile);

my $file; { local $/ ; $file = <$inputFile>;}
my $binary = unpack('B*',$file);

#if you don't do this then the contents get held in a buffer until the file 
#closes. As you can see, the file never closes! Shame on me...

print vec($binary,0,8);
##print $outputFile pack('B*',$binary);
