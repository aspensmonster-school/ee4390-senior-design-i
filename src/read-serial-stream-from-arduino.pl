#!/usr/bin/env perl

use warnings;
use strict;

use Device::SerialPort;

my $arduino = Device::SerialPort->new(

  port => '/dev/ttyUSB0',
  baudrate => 9600,
  databits => 8,
  parity => 'none',

);

while (1) {

  print $arduino->receive();
  #This will probably spit out lots of binary junk into my terminal.

}
