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
    * 

Noise Sources:

  * Reverse breakdown of PN junction
    * BJTs
    * Diodes
  * Thermal

The above is a work in progress and will form the basis for my 4-minute
presentation for senior design day.

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
this project has taught me anything, it's that it's NEVER that simple.

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
