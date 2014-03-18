SPRING BREAK WEEK (From Mon Mar 10 to Tue Mar 18)
=================================================

UPDATE Sat 15 2014 2105:

Ok. So I've totally been working on this. Haha. Not. 

Well, I've certainly been THINKING about it. And it's looking like, in a 
worst case scenario, I should be able to XOR my processed bitstream with that 
of a CSPRNG --Cryptographically Secure Pseudo-Random Number Generator-- to 
suss out any remaining bias. Thankfully, there's a decent Perl module in 
place for this already:

http://blogs.perl.org/users/david_oswald/2013/02/bytesrandomsecure----a-no-fuss-csprng.html

I'm going to let my bitstream run, and modify the perl script a bit to 
incorporate this.

UPDATE Sun 16 2014 1844:

After performing a bitwise XOR of each raw byte from the generator with a 
byte from a CSPRNG, the tests are performing substantially better (with the 
exception of the chi^2 test, which is to be expected, since I have the 
de-biasing code disabled on the arduino for now).

Particularly, the Monte-Carlo calculations of pi are showing MUCH better 
approximations than previously. Percent error has dropped from 10s of percent, 
to tenths of a percent.

UPDATE Tue Mar 18 2014 1200:

Consider the project working. All that's left is to put the bitstream into a 
/dev/ device. Shouldn't be too difficult with PERL. Ought to get a head-start 
on the presentation documents too.
