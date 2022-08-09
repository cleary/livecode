# estuary development server (unreliable, but in case of emergency)

https://intramuros.mcmaster.ca/

# estuary view functions 

  1. open a new browser tab at https://estuary.mcmaster.ca
  2. go to solo mode
  3. enter into the terminal: 

*See what views are available*
```
!listviews
```
*choose a view to display locally (your pc only) from above output*
```
!presetview n
```
*set the current view for all users in the ensemble*
```
!publishview def
```
 *return to the default view on your local display*
```
!presetview def
```
*see what code generated the current view*
```
!dumpview
```
*list all samples*
```
!localview audiomap
```
*show visuals only, on the local display*
```
!localview []
```
*display `iframes` in cells, checkout vdo.ninja*
```
!localview $ grid 2 2 [iFrame "https://en.wikipedia.org/wiki/4hero",code 0 0,code 1 0,iFrame "https://en.wikipedia.org/wiki/4hero"]
```
*horizontal split*
```
!localview $ grid 1 2 [code 0 0, code 0 1]
```

# estuary in-jam functions
*get tempo*
```
!showtempo
```
*set tempo in cycles per second, between 0-1 is a safe range*
```
!setcps x.y
```
*sometimes the beat counter can get too large, and strange artifacts start happening, reset the beat counter:*
```
!resettempo
```
*add some samples from a CORS compliant web server*
```
!reslist "https://samples.grbt.com.au/resources.json"
```
*show what external resources have been loaded*
```
!showresources
```
 *return to initial state of estuary server provided resources*
```
!defaultresources
```
 *remove all resources, incl estuary defaults*
```
!clearresources
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
 - begin
 - end

After activating unsafe mode:
 - crush
 - coarse
 - shape


# Add your own samples

From  CORS compliant web server:

https://github.com/dktr0/estuary/wiki#adding-sound-files-to-estuarywebdirt-on-the-fly-early-august-2021

Some examples:

```
!reslist "https://samples.grbt.com.au/resources.json"
```
```
!reslist "https://carltesta.github.io/resources.json"
```
```
!reslist "https://carltesta.github.io/vcsl_for_estuary/resources.json"
```
```
!reslist "https://dktr0.github.io/cybernetic-samples/sounds/sounds.json"
```
```
!reslist "https://tedthetrumpet.github.io/testpage/nmsamples/resources.json"
```
```
!reslist "https://etsabary.github.io/supercontinent/resources.json"
```
```
!reslist "https://dandrewstewart.github.io/samples/resources.json"
```

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
