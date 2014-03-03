Thursday 20 February 2014 1239

I'm beginning to suspect that the noise on the output of the comparator 
isn't actually too big a concern. I'm going to try debiasing the output 
bitstream to see how random it is afterwards.

Monday 24 February 2014 1700

PROGRESS! It turns out that I was misreading the output of my hexdumper. The 
data is actually MUCH more random than I anticipated at first! It still 
isn't perfect, but I suspect that this has more to do with biasing than 
noise at this point. Still keeping an eye on the noise issue on the 
comparator, but I've rewritten the arduino code to do some debiasing in 
hardware. I'll let it collect tonight and examine the results in the morning.

Also: I kept some of the output from before all of my noise fixes --sans the 
comparator noise issue of course-- and utilized another piece of software 
(ent) to analyze it. Of course it had poor results. However, the output 
I more recently have --after the noise fixes-- has MUCH better results than 
the original (and incredibly noisy) bitstream. Still not perfect, but things 
are finally starting to look good. I should be able to start work on the 
custom entropy pool kernel module now, and tackle any residual signal 
integrity issues as they come up. 

I also want to solder a more-permanent version of the design, now that much 
of the signal integrity issues have been squared away. That's still on the 
backburner though.

UPDATE: Sunday March 02 2014 2339:

After introducing the debiasing routine onto the arduino, it certainly seems
(at least at first glance) that the entropy has increased and any remaining
visual hints of non-randomness are gone. Sadly, the debiasing routine seems to 
eat up quite a bit of processing time --or perhaps there's just a bunch of 
correlation/biasing in my RNG. In either case, the throughput has dropped to 
about 100 bytes every 3 to 5 seconds. If this output stream proves to be 
better though in terms of randomness and entropy, I'll take it over a faster 
but flawed implementation.

UPDATE: Sunday March 02 2014 2350:

Uhhh... Wat? So I forgot to turn the power supply on for the circuit. YET IT 
WAS GETTING BITS? Lolwut? Ok... that's weird... I might look into that later. 
Probably just picking up 60 Hz hum. In any case, now that the power is on, 
the throughput is picking back up. It's looking like a little bit over a 
kilobyte a second. Still slower than before the HW debiasing, but still faster 
than when the circuit wasn't powered :P NOW I will let this run overnight.
