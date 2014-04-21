Wednesday April 16 2014 to Tuesday April 22 2014
================================================

The low-down on noise is given below.

Characteristics:

  * bias - distribution of ones and zeros. Measured with chi^2 distribution.
    Extremely sensitive to slight deviations of distribution.
  * correlation - serial correlation of sequential outputs. Measured in several
    ways. See Knuth TAOCP Vol. 2 pp. 64-65 for an example that calculates a
serial correlation coefficient (that is ideally zero).
  * power density spectrum - Basically, what the FFT looks like.
    * white noise - uniform power spectrum
    * pink noise, aka flicker noise, aka 1/f noise - power density falls off at
      10 dB/decade (-3dB/octave)
    * Brownian noise, aka brown noise, aka red noise - power density falls off
      at 20 dB/decade (-6dB/octave)

Noise Sources:

  * Reverse breakdown of PN junction
    * BJTs (the physical source of the noise comes from current pulses)
    * Diodes
  * Thermal

For the hardware RNG proposed here, based off of avalanche noise from a BJT,
the noise characteristics are predominantly pink noise at low frequencies and
white noise at higher frequencies. Filtering the pink noise is costly, since
component values --resistors and capacitors as a start for a high-pass filter--
will be pushed to hard-to-find values. Resistors will need to be small, and
capacitors large. 

As well, the arduino that acts as the sampling mechanism does not have a very
large bandwidth to work with, and the presence of the pink noise at lower
frequencies will noticably shift the distribution and correlation of the
bitstream. Consequently, utilizing a CSPRNG to mop up the biases and
correlations is necessary to output a proper bitstream.

**Throughout my investigation, I thought that 60Hz hum was to blame for
my biased bitstream. I did indeed have 60Hz hum at one point, but even after
it disappeared --cause still not definitively known, but I suspect the
beefier caps I put on the inputs to the comparative reference voltage op-amp
were the likely solution-- the biasing remained, and didn't seem to have
subsided substantially. Judging by my recent research on pink noise, I hold
that pink noise is the likely, ACTUAL culprit of the problem.**

Sidenote: The arduino cannot sample very fast, but this is not a problem, as
the noise source's bandwidth absolutely does not exceed 100kHz and is on
the lower end of the tens of kilohertz (TBD: Actual value of the high-end
corner frequency).

*The above is a work in progress and will form the basis for my 4-minute
presentation for senior design day.*

Pink vs White Noise and Filtering Pink Noise Out
================================================

http://www.edn.com/electronics-blogs/the-signal/4408242/1-f-Noise-the-flickering-candle-

You have no idea how much time I could have saved if I had found this earlier.
Sadly, I didn't have the requisite vocabulary and jargon, or understanding to
even know where to BEGIN to look when I first started the project. Previous
experience absolutely DOES count for something :D

http://www.qsl.net/va3iul/Noise/Understanding%20Noise%20Figure.pdf

The figure on page 7 of that PDF looks EXACTLY like my FFTs I took last week!
However, according to the first link, properly filtering out the flicker
noise is a difficult task. I would think that all I'd need to do is throw a 
High-pass filter inbetween the noise source and amplifier stages, but if
this project has taught me anything, it's that it's NEVER that simple. Sure,
the values would be difficult (low resistor values, high cap vlaues), but
I think it's doable.

In any case, I do feel better knowing that my suspicions --that I was running
into some sort of low-frequency interference that biased my RNG-- were right,
and having it confirmed from scope readings is definitely good to have for
the presentation/posterboard/report. I'd like to take a shot at filtering
all this out with hardware, so that I don't need to clean up the stream with
a CSPRNG. Knowing what I know now, I think it's definitely possible.

But for now, I think the presence of this particular noise plot from the
oscilloscope --pink noise in the low frequencies with white in the higher
frequencies-- in combination with my dinky little arduino that can't sample
fast at all MORE than justifies the current state of affairs (of having the
CSPRNG remain in the design.)

http://www.ti.com/lit/ml/sloa082/sloa082.pdf

"...if the current is kept low enough, thermal noise will predominate and the
type of resistor used will not change the noise in the circuit."

"Reducing power consumption in an op amp circuit by scaling up resistors may
reduce the 1/f noise, at the expense of increased thermal noise"

The above two quotes only apply to THERMAL noise it seems, not avalanche noise.

"Flicker noise is also called 1/f noise. Its origin is one of the oldest
unsolved problems in physics. It is pervasive in nature and in many human
endeavors. It is present in all active and many passive devices. It may be
related to imperfections in crystalline structure of semiconductors, as better
processing can reduce it."

"Popcorn and avalanche noise approximate a red/brown characteristic, but they
are more correctly defined as pink noise where the frequency characteristic has
been shifted down as far as possible in frequency."

**Yeah. I've got strong sources to back up my claims and suspicions now.
This should be more than sufficient for questioning during presentations.**
