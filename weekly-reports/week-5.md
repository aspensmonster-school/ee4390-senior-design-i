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

Three possibilities:

1.) The comparator is loading the output of the op amp amplifier. Can try 
using another buffer between stages.

2.) The reference voltage is rippling a bit, possibly throwing off the 
comparator readings.

3.) I've got the wrong voltage on the output of the comparator.

I'm suspecting number 3. Going to investigate.

UPDATE: Tuesday February 18 2014 1837:

Yep. I had the output voltage wrong. I didn't realize you could have a 
different Vcc and Vs --Vs being the voltage on the output pin-- on the 
comparator. After doing that, I've got a nice, clean 5V and 0V line. And the 
data is now starting to look somewhat random. Still getting what (seems) to be 
some pattern though. Going to let it collect for tonight and see what 
dieharder says about the sequence in the morning.

UPDATE: Tuesday February 18 2014 1842:

Nevermind. Found source of problem. Still got 60 Hz hum on the comparator. 
Going to try throwing a decoupling cap on the Vcc-Gnd pins.

UPDATE: Tuesday February 18 2014 2000:

I've tried adding shunt resistors in a bid to reduce the input impedance on 
the comparator. I read that uber-high input impedance isn't always a good 
thing, since it is more susceptable to noise. However, this didn't help; if 
anything, the performance actually seemed to worsen slightly. It's probably 
just my imagination though. It's not noticable enough to really stand out.

I also read that this is apparently a rather common problem --output of a 
comparator "bouncing" like this-- and that the solution is hysteresis. I'm 
going to look into adding hysteresis and see if that solves the problem.
