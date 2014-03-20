UPDATE Thu Mar 20 2014 1543:

Streams of Consciousness
========================

Some general thoughts:

  * I really didn't want to rely on a CSPRNG to remove extra bias. However, it
    seems that most "hardware" RNGs still do this anyway. According to several
sources, hardware-based noise sources are almost inherently biased and need the
extra mixing. I don't really like that answer, but I at least know I'm not
alone in the findings. The main reason I don't like it is because my original 
intent was to sidestep the deterministic nature of CSPRNGs. Now, I've seeded 
the particular CSPRNG from a known-hardware-random source (/dev/random) in my 
design. But still, the idea was for my design to stand independently. And in 
that sense, it absolutely does not.
  * The Vazanna hardware RNG, which I used as the basis for my own RNG, has
    findings that I was entirely unable to replicate. The only difference at
the hardware level up to this point between the two designs is my use of a full
comparator for the ADC portion, rather than Vazanna's use of a diff-amp to
digitize the signal. Even after debiasing/deskewing, my bitstreams were not
passing, whereas the Vazanna bitstreams supposedly were. I'd like to think that
the use of a full comparator shouldn't make a difference, but there is clearly
a difference somewhere if I am to assume that Vazanna's work is valid.
  * I'd like to reproduce the Vanzanna RNG exactly at some point, though that
    probably won't happen for this course.

Some specific thoughts:

  * Right now, there is no hardware debiasing going on. The debiasing routines
    significantly slow down the generator. Without XORing the bitstream with a
CSPRNG, the bitstream is no good, with OR without the Von Neumann debiasing.
That was the final straw that got me frustrated and made me decide to give the
XOR routine a try to try and salvage the design.  However, WITH the CSPRNG, it
seems that the debiasing is entirely unnecessary.  The throughput of the
bitstream is still slow --I'm using a blocking randomness source from the
kernel to seed the CSPRNG, /dev/random, that pulls in (supposedly) truly random
noise from hardware events on the host machine. However, seeing as the
bitstream passes all the tests, I'm leaving off the Von Neumann debiasing for
now.
  * I've often thought about utilizing a notch filter to reject the signal at
    60 Hz, to absolutely ensure that the bitstream doesn't get autocorrelated
or otherwise biased off of the mains hum  that I was unable to eliminate after
getting rid of all the ground loops I thought I could identify.  However, doing
this would require reinstating the Von Neumann debiasing routines to make sure
we can the regular sequences of many zeros that would result. The net result is
that the RNG would still be slow, but might be able to cast off the need for
XORing with a CSPRNG.
  * Wikipedia seems to indicate that some high-speed hardware RNGs utilize
    feedback to help with biasing, but gives no real indication of just what
kind of feedback. I don't see how any analog feedback could be happening
without blowing up the signal. However, Linear Feedback Shift Registers (LFSR)
are common in cryptographic modules. I suspect this might be what Wikipedia was
getting at.

Finally, I still have yet to paralellize this implementation. I'd like to 
do so, but this would also require additional decorrelating of the individual 
bitstreams, which could easily open up its own can of worms that I probably 
don't have enough time left in the semester to deal with.

Block Diagrams
==============

The block-diagram/pipeline as it stands:


    Transistor in breakdown, generating avalanche noise
    | 
    |->Buffer between noise source and amplifier.
       |
       |->Amplifier to get 1Vpp
          |
          |->Comparator to output 5V-level logic.
             |
             |->Arduino samples the digital output. Passes bytes to host.
                |
                |->(*****) Perl module listens on serial port for a bytes. 
                   XORs each byte with a byte from the CSPRNG.
                   |
                   |->Writes final raw byte to file. (Should eventually write 
                      to /dev/customRandom)
    
    HW noise, typically jitter from HW interrupts.
    |
    |->Linux kernel fills the noise into /dev/random
       |
       |->/dev/random seeds the CSPRNG. -> (*****)


Rabbit Holes
============

I also have what I consider a list of rabbit holes that I fell down. These are 
things that I tried to eliminate the 60Hz hum that seem to have had no 
effect.

  * Bypass caps between the Vcc and GND pins of the ICs.
  * Buffer between amplifier output and comparator.
  * Twisting the leads from the PS to the breadboard.
  * Adding additional caps onto the power supply rails.
  * Adding decoupling cap between amplifier output and comparator.  (IMPORTANT:
    I don't have this cap on the design right now when, by all rights, it
really ought to be there. It's still working though. Huh.)
  * Placing bypass cap in parallel with resistive load from which the digital
    signal is read by the arduino.

Final Tweaks to Consider
========================

  * Might want to experiment with adding or removing some of the caps that were
    placed on the board during the rabbit hole trips.
  * I significantly upped the amplification to get the 1Vpp to look "better."
    Previously, the signal would only have a few "spikes" that hit the peaks.
And this seemed to result in heavily biased bitstreams. However, after the amp
boost, the signal was basically "drowned" in the 1V range. This might conceal
certain problems, it might not be a problem at all. But in the process of
monkeying around, I upped the amplification and haven't put it back to the
original amplification. I might want to look at this if I have time.
  * Might want to bring the design in and run it through the spectrum analyzer
    so that I have a better answer for the bandwidth of the noise source than,
"well, my sampling is only in the low kilohertz; surely I'm not already
oversampling, right?"
  * As of now, the digital ground is still shared with the analog ground. This
    doesn't appear to have any adverse effects, but I should still investigate
putting the digital ground to the arduino's ground.
