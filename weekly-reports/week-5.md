Tuesday February 18 2014 1450:

The comparator was definitely wired wrong. Now that it is correctly wired --
well, I think it is-- I am getting more bits! They even appear random at 
first glance, though there is still a bunch of '.' characters that I suspect 
are thanks to the delay on the arduino code. Going to see how things go if I 
remove that delay.

UPDATE: Tuesday February 18 2014 1548:

I'm getting more bits, but even with the delay removed on the arduino code, I 
still get mostly dots, and a bunch of '?' characters as well. This IS 
consistent with my scope readings, which still aren't reading a smooth 
waveform on the output of the comparator (though it certainly looks better 
than it did).

Two possibilities:

1.) The comparator is loading the output of the op amp amplifier. Can try 
using another buffer between stages.
2.) The reference voltage is rippling a bit, possibly throwing off the 
comparator readings.
3.) I've got the wrong voltage on the output of the comparator.

I'm suspecting number 3. Going to investigate.
