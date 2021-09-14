# estuary view functions 

  1. open a new browser tab at https://estuary.mcmaster.ca
  2. go to solo mode
  3. enter into the terminal: 

```
!reslist "https://samples.grbt.com.au/resources.json"
!listviews (see what views are available)
!presetview n (choose one from above output)
!publishview def (set current view as default for all users?)
!presetview def (return to the default view)
!dumpview (see what current view code looks like)
!localview audiomap (list all samples)
!localview [] (show visuals only)
!showtempo (query tempo)
!setcps x.y (set cps)
```

# Minitidal effects available

 - hcutoff
 - cutoff
 - pan
 - gain
 - bandf
 - bandq
 - vowel
 - delay
 - delaytime
 - delayfeedback

After activating unsafe mode:
 - crush
 - coarse
 - shape


# Add your own samples

From  CORS compliant web server:

https://github.com/dktr0/estuary/wiki#adding-sound-files-to-estuarywebdirt-on-the-fly-early-august-2021

# JSoLang reuse vars example

## What is it?

A way to define a new livecoding meta-language on the fly (live) in estuary(!)

It uses peg.js as a parser (peg.js provide an online parser for debugging too)

See [here](https://github.com/dktr0/estuary/tree/dev/JSoLangs) for more examples 

## How to

This example is like a replacement for `let` in tidal - define reusable code referenced via variables

eval in a low number panel

```
##JSoLang vars

// note variable name defs here
main = x:allRules* { return "##tidal\n" + x.join("") }
allRules = chords / kickpat / anyCharacter
anyCharacter = .

// specific replacement rules, the i makes the find operation
// case insensitive
chords = "chords"i { return "<[c4'm9'8@1.5 af'maj9@1 g4'dom7@1.5 ] c4'm9'16 c'm9'12>" }
kickpat = "kickpat"i { return "<[10000[01]0[01]] [1 1 1 0]>" }

```

use the `chords` and `kickpat` patterns in another panel

```
##vars

struct "kickpat"
$ note (arp "<[up down thumbup] down down>" "chords")
# s "sid"
```

# CineCer0

Use a github url as a video source:

```
https://github.com/.../file.mp4?raw=true
```
