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

===========================================

UPDATE: Sun. 09 Feb. 2014:

Finally got around to setting up the scope.

Dafuq? I'm getting nothing but 60 Hz hum out of the op-amp! Noise is still 
good.

===========================================

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

===========================================

UPDATE: Mon. 10 Feb. 2014 1717:

I didn't want to tear everything down, so I started tracing back even 
further. It looks like the unity and gain op amps are fine. I traced back the 
source of the hum to the virtual ground op amp. Still trying to figure out 
how to get rid of this. 

DING DING DING DING DING! The problem was with the capacitors. I don't know 
if one of them got unseated or was shorting with another component, but after 
reseating each of them I got back to where I was before.

===========================================

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

===========================================

UPDATE: Mon. 10 Feb. 2014 2042:

I suspect my signals are still there, but are getting drowned out by 60 Hz hum 
from... somewhere. The signal degradation seems to get worse with each 
decoupling capacitor in the signal path.

I still don't know why I had it working temporarily. I thought swapping caps 
was the answer, but I still get the noise now! Ugh. Frustrating. Going to 
try giving each IC a bypass cap to sort things out.

===========================================

UPDATE: Mon. 10 Feb. 2014 2105:

FFFFFFFUUUUUUUUUUUU. When I was mucking around with the caps, I accidentally 
misplaced one of the pins. The bypass cap on the virtual ground wasn't on 
ground, it was on the virtual ground line itself. I think I can say 
with confidence now that the noise problem has been identified and eliminated.

Now, onto getting a functional binary bitstream.

===========================================

UPDATE: Mon. 10 Feb. 2014 2126:

Ok. That's weird. I can't seem to amplify the signal more than about 3x. 
Interesting.

===========================================

UPDATE: Mon. 10 Feb. 2014 2205:

I think I've been measuring Vpp for the noise spread incorrectly. I always 
measured from the absolute farthest I ever saw the noise go, even though the 
majority of the noise signal was more tightly bounded. For example:

For my noise generator, I have an absolute maximum Vpp of 100mV. However, the 
more tightly bounded distribution was more like a maximum Vpp of 20mV. 

When I upped the gain from 10 to 83 (120k/12k to 1M/12k), I got a MUCH better
signal out of the amp, damn near perfectly 1 Vpp. This would line up with my
observations. When I had 10 for the gain, it looked like I was only going from
100 mVpp to anywhere from 200 to 300 mVpp, 2-3 gain rather than 10. However, if
I instead measured from the more tightly bound distribution of 20 mVpp, I would
get what I was reading for the gain of 10: about 200 mVpp. 

And of course, after amplifying by 83, I get about 20 mVpp * 83 = 1.66 Vpp. I 
don't know why I'm only getting about 1 Vpp rather than 1.66, but perhaps I 
am again measuring something wrong. The majority of the amplified distribution 
falls between 1 Vpp, but the outliers do in fact hit about 1.6 Vpp. 

Perhaps the real dense distribution is even LESS than 20mV. If it were, say, 
12mV, then 12mV * 83 gives 1.079 Vpp, much closer to what I'm observing on the 
scope.

===========================================

UPDATE: Mon. 10 Feb. 2014 2226:

Ok. Now things are starting to look at least a bit better. I'm no longer 
getting just 0x0000FFFF when reading the serial from the arduino. I'm finally 
starting to get some data other than that, I'd say about 2-5 percent comes 
out to an ASCII character other than the '.' character. This is consistent 
with the scope, which shows most of the output being high most of the time. 

It also looks like I'm definitly getting 60 Hz hum on the comparator, though 
thankfully, no longer on the analog portion of the design. So, after an 
entire weekend PLUS Monday, I can finally get around to what I wanted to do 
to start with:

Figure out the comparator.

Though I guess it's good that I got all these other signal integrity issues 
squared away. Learned a lot about analog design and op amps from the 
experience. Well, learned a little. Given all the problems I ran into I'm 
starting to think that Electronics II really ought to be a requirement for all 
Electrical Engineering majors, including those with Computer Engineering 
specialty. Or perhaps not required, but at least give some introduction to 
op amps from a practical standpoint (maybe leave out all the heavy theory 
behind them and how they're design at the transistor level).
