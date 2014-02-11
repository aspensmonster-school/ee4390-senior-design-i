Sat. 08 Feb. 2014: 
 
Going to fiddle around with just a comparator to make sure I'm not making
some really stupid mistake in understanding how it works. Possible other
problem: What is the input impedance on a digital port of the Arudino Uno?
Perhaps the signal is just sticking on the output of the comparator rather
than hopping over to the arduino digitial IO port. Hmm... I'll keep that in
mind. 
 
In other news... 
 
I got one of these: 
 
http://micro-nova.com/mercury 
 
I might try to use it when I parallelize the RNG implementation. Would also 
give me more experience with HDLs and HVLs (and of course FPGAs). 

UPDATE: Sun. 09 Feb. 2014:

Finally got around to setting up the scope.

Dafuq? I'm getting nothing but 60 Hz hum out of the op-amp! Noise is still 
good.

UPDATE: Sun. 09 Feb. 2014 2226:

Ok. Stupid me. Thought I had the probe grounded. Didn't. But still, I'm 
getting absolutely no signal past the R5 resistor (12K) that links the two 
op-amps. Put the multimeter on it and got practically no current AT ALL, even 
in the microampere range. It's almost like the node that particular node is 
dead.

ALSO: The signal isn't getting amplified! Talk about frustrating. I think 
a component might be totally dead. Going to rebuild the whole thing with new 
parts. Frustrating!

Scratch that. Going to try just swapping out the TL082 and see if that 
clears things up going into the comparator.

Nope. Shit. Time for a rebuild. Note to self: I think this aptly demonstrates 
the utility of having a testing protocol.

UPDATE: Mon. 10 Feb. 2014 1717:

I didn't want to tear everything down, so I started tracing back even 
further. It looks like the unity and gain op amps are fine. I traced back the 
source of the hum to the virtual ground op amp. Still trying to figure out 
how to get rid of this. 

DING DING DING DING DING! The problem was with the capacitors. I don't know 
if one of them got unseated or was shorting with another component, but after 
reseating each of them I got back to where I was before.

UPDATE: Mon. 10 Feb. 2014 2017:

Who the fuck am I kidding. Apparently, the noise just comes and goes as it 
pleases. However, it does seem to distinguish itself most prominently over 
the decoupling cap between the unity buffer and the amplifier. On one end 
of the cap lead, the signal looks great. On the other, I either get what 
looks like a 60 Hz square wave or a triangle wave.

Looking into these problems more, and given their seemingly random nature, I 
think what I'm running into is a ground loop. Which is another thing that one 
of the judges from TI mentioned during the presentation last semester. Of 
course, I didn't know what that meant, so it kinda went in one ear and out the 
other. Other possibilities from research are noise coupling due to long 
leads on components and the power supply lines (which are about 4 feet long 
coming out of the bench PSU).

See the following:

http://www.electro-tech-online.com/threads/ground-loop-horrible-feedback.101498/

http://web.mit.edu/~jhawk/tmp/p/EST016_Ground_Loops_handout.pdf

UPDATE: Mon. 10 Feb. 2014 2042:

I suspect my signals are still there, but are getting drowned out by 60 Hz hum 
from... somewhere. The signal degradation seems to get worse with each 
decoupling capacitor in the signal path.

I still don't know why I had it working temporarily. I thought swapping caps 
was the answer, but I still get the noise now! Ugh. Frustrating. Going to 
try giving each IC a bypass cap to sort things out.

UPDATE: Mon. 10 Feb. 2014 2105:

FFFFFFFUUUUUUUUUUUU. When I was mucking around with the caps, I accidentally 
misplaced one of the pins. The bypass cap on the virtual ground wasn't on 
ground, it was on the virtual ground line itself. I think I can say 
with confidence now that the noise problem has been identified and eliminated.

Now, onto getting a functional binary bitstream.
