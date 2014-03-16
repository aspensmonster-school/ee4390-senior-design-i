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
