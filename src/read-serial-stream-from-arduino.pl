#!/usr/bin/env perl

use warnings;
use strict;

use Device::SerialPort;

# Set up the arduino.
my $arduino = Device::SerialPort->new(

  port => '/dev/ttyUSB0',
  baudrate => 9600,
  databits => 8,
  parity => 'none',

);

#set up the destination file where the raw binary is stored.
open(my $outputFile, '>:raw', 'arduino_output.bin') or die "Can't open: $!";

#Start capturing bytes.
while (1) {

  #This will probably spit out lots of binary junk into my terminal.
  my $byte = $arduino->receive;
  print $byte;

  #store the binary in a file. 'C' is the code for unsigned char.
  print $outputFile pack('C', $byte);

}
