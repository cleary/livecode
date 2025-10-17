# `n()` vs `note()` reference

Coming from tidalcycles, this is something that has taken me too long to wrap my head around ...

To be fair, it was relatively tricky to wrap my head around in tidalcycles too ...

`n(i)` for unpitched sounds is very simple. If a folder named `foosamples` has 4 samples in it, then `i` references the ith sample in the folder. 

However, when working with pitched samples `n()` usage gets a little more nuanced. 

There are three main sources for pitched sounds that I use:
 - inbuilt synth
 - sample set with full set of pitched samples (eg 88 pitched piano samples) 
 - single sample tuned to C

This reference is designed to explain how to use these different sources correctly, with a reminder on how to use `note()` correctly

## `n()` is for numerical scale degrees, in conjunction with `scale()`
 - ref: https://strudel.cc/understand/voicings/#n

### melody with inbuilt synth
 - always use `n()` and `scale()` together
 - different synth tones available in `s()`

```
$: n("0 2 4 1 3 5")
  .scale("A3:minor")
  .s("square:7")
```

### melody with pitched sample set
 - always use `n()` and `scale()` together
 - use `cut()` or `clip()` to control length
```
samples('https://samples.grbt.com.au/strudel.json')
$: n("0 2 4 1 3 5")
  .scale("A3:minor")
  .s("hello")
  .cut(1)
```

### melody with pitched single sample
 - use `cut()` or `clip()` to control length
 - `C2` is original sample pitch reference
```
samples('https://samples.grbt.com.au/strudel.json')
$: n("0 2 4 1 3 5")
  .scale("A2:minor")
  .s("flbass:14")
  .cut(1)
```

### manual chords with inbuilt synth

```
$: n("<[1,3,5] [4,6,8] [0,2,4] [5,7,9]>")
  .scale("A3:minor")
  .s("square")
```

### using `n()` to pick individual notes from `chord()`
 - for `chord()` info, see below

```
$: n("<[0 4 5] [2 6 4] [0 2 4] [2 4 0]>*8")
  .chord("<Bm7b5 Em Am F>").voicing()
  .s("square")
```

For chords defined by name, see the section below on `chord()`

## `note()` is for using note names, or midi pitches 
 - don't use `scale()`, it doesn't make sense here
 - ref: https://strudel.cc/learn/notes/#notes

### melody with inbuilt synth

```
$: note("<[57 60 64 59 62 65] [a3 c4 e4 b3 d4 f4]> ")
  .s("square")
```

### melody with pitched sample set
```
samples('https://samples.grbt.com.au/strudel.json')
$: note("<[57 60 64 59 62 65] [a3 c4 e4 b3 d4 f4]> ")
  .s("hello")
  .clip(1)
```

### melody with pitched single sample
```
samples('https://samples.grbt.com.au/strudel.json')
$: note("<[57 60 64 59 62 65] [a3 c4 e4 b3 d4 f4]> ")
  .s("flbass:14")
  .cut(1)
```

## `chord()` is a different kettle of fish

- ref: https://strudel.cc/understand/voicings/#chord-symbols

### chords defined by name
 - note you cannot use lower case

```
$: chord("<Bm7b5 Em Am F>").voicing()
  .s("square")
```

### default dictionary of chord names
```
2 5 6 7 9 11 13 69 add9
o h sus ^ - ^7 -7 7sus
h7 o7 ^9 ^13 ^7#11 ^9#11
^7#5 -6 -69 -^7 -^9 -9
-add9 -11 -7b5 h9 -b6 -#5
7b9 7#9 7#11 7b5 7#5 9#11
9b5 9#5 7b13 7#9#5 7#9b5
7#9#11 7b9#11 7b9b5 7b9#5
7b9#9 7b9b13 7alt 13#11
13b9 13#9 7b9sus 7susadd3
9sus 13sus 7b13sus
aug M m M7 m7 M9 M13
M7#11 M9#11 M7#5 m6 m69
m^7 -M7 m^9 -M9 m9 madd9
m11 m7b5 mb6 m#5 mM7 mM9
```

### `chord()` and individual notes blended, with `arp()`
- doesn't work the way I remember in tidal, need to work out what I used to do though

```
$: chord("<Bm7b5 Em Am F>").voicing()
  .s("square")
  .sometimesBy(0.5, x=>x.off(0, y=>y.arp("[0 4 5] [2 6 4] [0 2 4] [2 4 0]").transpose(24)))
```
