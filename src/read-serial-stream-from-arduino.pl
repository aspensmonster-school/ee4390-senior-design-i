#!/usr/bin/env perl

use warnings;
use strict;

use Device::SerialPort::Arduino

my $arduino = Device::SerialPort::Arduino->new(

  port => '/dev/ttyUSB0',
  baudrate => 9600,
  databits => 8,
  parity => none,

);

my $count = 0;

while (1) {

  print $Arduino->receive();
  $count++;
  if ( $count == 32 ) {

    $count = 0;

  }

}
