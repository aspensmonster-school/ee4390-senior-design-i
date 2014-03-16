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
