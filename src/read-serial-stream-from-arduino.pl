#!/usr/bin/env perl

use warnings;
use strict;

use Device::SerialPort;
use Data::Dumper;
use Bytes::Random::Secure;

# Set up the arduino.
my $arduino = Device::SerialPort->new("/dev/ttyACM0") || 
die "Can't open serial port.\n";

$arduino->baudrate(115200);
$arduino->databits(8);
$arduino->parity('none');
$arduino->stopbits(1);

# Set up the CSPRNG
my $random = Bytes::Random::Secure->new(
 Bits => 64,
 NonBlocking => 0,
); #Seed with 8 bytes, use /dev/random (or other blocking)

# Set up the destination file where the raw binary is stored.
my $name = "output";
open(my $outputFile, '>', $name) or die "Can't open: $!";

#if you don't do this then the contents get held in a buffer until the file 
#closes. As you can see, the file never closes! Shame on me...
$outputFile->autoflush(1);

#apparently aquiring /dev/tty.whatever reboots the arduino. should wait 
#"a few seconds" for it to be ready.

print "Waiting for arduino to be ready.\n";

sleep(3);

#Start capturing bytes.
while (1) {

  my $byte;
  $byte = $arduino->read(1);

  if ( defined($byte) && length($byte) ) {

    #XOR with byte from CSPRNG
    my $csprng_byte = $random->bytes(1);
    
    $byte = $byte ^ $csprng_byte;

    print "Value: " , $byte, "\n";

#    print Dumper($byte);

    #store the binary in a file. 'a' is just a generic, "string" datatype.
    print $outputFile pack('a',$byte);

  }

}
