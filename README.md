Senior Design Introduction
==========================

For my senior design project, I chose to design, implement, and verify a 
hardware random number generator (RNG). Recent revelations, such as the fact
that the NSA backdoored the Dual\_EC\_DRBG pseudo-random number generator, have
made it clear that the NSA will continue its "[exercises] in finesse" to
covertly compromise cryptosystems and the standards behind them indefinitely.
While this particular PRNG was not commonly used --and indeed there were
suspicions at the time of its NIST approval that it had been backdoored-- it
remains to be seen just how pervasive the NSA's reach into the chip design and
fabrication process is. So long as average American citizens and human beings
the world over are regarded as adversaries --or even, in the case of iPhone
users, "zombies" that are willingly paying to be monitored by "big brother"
(Steve Jobs), as one released power point slide regarding cell phone
surveillance revealed-- it is of the utmost importance that a fully open and
imminently verifiable hardware random number generator be developed, for RNGs
act as the lynchpin that holds much of modern cryptography together.

To this end, I am utilizing the GPLv3+ license for all software and generated
netlists or models involved in this project, and will attempt to use Free
software for as much of the development as is feasible. Tools such as ngspice 
and gnucap, as well as gspiceui, gtkwave, and gschem, are all freely licensed
and I have previous exposure to them as well. I am in the process of evaluating
open hardware licenses to see which best aligns with my requirements that the
hardware be fully verifiable, freely modifiable, freely reproducable, and
freely distributable. The ideal license will behave in similar spirit to the
GPLv3 license for software. Any possible patents arising from this work shall
be held under similar license spirit.

For now, I do not intend to commercialize this effort, for there is substantial
suspicion that commercial offerings are being actively (and sadly, legally)
compromised. Establishing an appropriate business structure with which to
monetize the project leaves the project frustratingly vulnerable to national
security letters and other various apparatus of the United States federal
government. For now, the project is best protected against such willful
sabotage by taking advantage of my first amendment rights as a citizen of the
United States and, more broadly, my rights to free speech as a citizen of
humanity under article 19 of the UDHR. Citizens are not immune from NSL
sabotage --and I am certainly not immune from incomptence that could compromise
the project either-- but I can most certainly promise that, as a genuine person
--and not merely a legal fiction such as a corporation-- I will fight any such
attempts with all of the tools and resources available to me in the face of
opposition, including threats of unjust imprisonment.

Senior Design Team
==================

As of now, I am the sole team member and founder of this project, yet to be 
given a formal name. I intend to seek Dr. Stapleton's sponsorship of the 
project. I am not opposed to bringing on team members from the class; but 
as of Wednesday September 11 2013, little interest has been raised in the 
project after an introduction to its goals and roadmap was given during 
lecture. 

Repository Layout
=================

This repository will serve as the central source of my work. I intend to split 
much of it into the following heirarchy:

* /src - will hold source code for interfacing between the hardware and the USB 
serial port, as well as any other daemons or verifyer code written.
* /doc - will hold documentation specific to the software held in /src, as 
well as the general principles of random number generation and verification 
as discovered in /research.
* /research - will hold a bibliography of sources found and investigated 
throughout the project. Research journal will be held here.
* /hw - will hold schematics, netlists, models, and any other information 
pertaining to the hardware aspects of the project.
* /tests - will hold testing suites. In particular, it is looking like 
dieharder is an excellent RNG stress-tester, and I intend to develop a perl 
scripted test suite that interfaces between the software, the outputted 
bitstream, and any other ready-made testing suites such as dieharder.

Project Roadmap
===============

##Main Goals:

1.) *[continuous]* Research. Research. And Research Some More. Understand
common sources of randomness: heat noise, avalanche noise, clock jitter.
Understand common pitfalls: biasing, correlation, drift-over-time. Understand
and replicate previous designs to verify conclusions given by said research.
Understand the mathematical foundations of randomness and the various
statistical analyses that go into detecting and verifying it.

2.) *[completed by end of september]* Establish verification pipeline early.
Ensure that it can take any given input bitstream, process it, and output
randomness characteristics. Implement Perl testing script if necessary to
manage this pipeline. Ensure that verification is mathematically sound.

3.) *[completed by end of september]* Have software for reading bitstream of
USB input ready and functional.  High likelihood that Linux kernel already has
everything necessary from the host end. Make sure it works. Mainly, make sure
we can get bitstream off hardware and ultimately into /dev/random or a
customized /dev/customRandom entropy pool.

4.) *[ideally started in september, at latest by beginning of october. Continue
until project deadline]* Prototype numerous iterations of the block diagram,
specifically with three noise sources: heat noise, avalanche noise, and clock
jitter. Collect statistical data about their randomness characteristics and
plot it. Iterate quickly to discover sources of problems, and be prepared to
leave designs active for weeks if not months on end if initial results look
promising (initial research indicates that current drift over time has the
capability to skew a once-random bitstream into a non-random state). Compare
properties of our custom entropy pool to standard entropy pools.

##Stretch Goals:

5.) *[continuous]* Investigate popular software PRNGs and ubiquitous hardware
RNGs for possible backdoors. 

6.) *[continuous]* Demonstrate the importance of proper random number
generation by crafting viable attacks of cryptosystems with compromised sources
of randomness.

Project Block Diagram
=====================

Subject to change.

Noise source -> Amplifier -> ADC -> Microprocessor (Bias/Correlation correction) -> Serial IC output -> host machine -> Verification Suite -> Entropy Pool
