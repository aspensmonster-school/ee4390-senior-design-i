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

