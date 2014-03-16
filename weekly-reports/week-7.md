Whoops. Had this week in the wrong file.

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

UPDATE: Monday March 03 2014 1209:

Well, I'm still getting about the same results statistically, and they 
aren't where they need to be, regardless of debiasing. Whatever remaining 
noise on the comparator output needs to be hunted down and eliminated. I 
propose two possible solutions:

* The output is digital. Perhaps we need to separate digital and analog 
grounds. I can use the ground on the arduino board for this purpose, I suppose.
* I need a capacitor between the amplifying op-amp and the comparator. I'm 
actually leaning towards this being the culprit at the moment, though the 
separated analog and igital grounds is --from what I've read-- good design 
practice in any case.

UPDATE: Tuesday March 04 2014 2012:

At this point, I'm not seeing the noise on the output of the comparator that 
I used to see. I haven't changed anything though, so this is really 
irritating me! Regardless, I'm experimenting with different decorrelators.
