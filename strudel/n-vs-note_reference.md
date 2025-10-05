# `n()` vs `note()` reference

Coming from tidalcycles, this is something that has taken me too long to wrap my head around ...

To be fair, it was relatively tricky to wrap my head around in tidalcycles too ...

There are three main sources for pitched sounds that I use:
 - inbuilt synth
 - sample set with full set of pitched samples (eg 88 pitched piano samples)
 - single sample tuned to C

This reference is designed to explain how to use these different sources correctly, with a reminder on how to use `note()` correctly

## melody with inbuilt synth
 - always use `n()` and `scale()` together
 - different synth tones available in `s()`

```
$: n("0 2 4 1 3 5")
  .scale("A3:minor")
  .s("square:7")
```

## melody with pitched sample set
 - always use `n()` and `scale()` together
 - use `cut()` or `clip()` to control length
```
samples('https://samples.grbt.com.au/strudel.json')
$: n("0 2 4 1 3 5")
  .scale("A3:minor")
  .s("hello")
  .cut(1)
```

## melody with pitched single sample
 - use `cut()` or `clip()` to control length
 - `C2` is original sample pitch reference
```
samples('https://samples.grbt.com.au/strudel.json')
$: n("0 2 4 1 3 5")
  .scale("A2:minor")
  .s("flbass:14")
  .cut(1)
```

## `note()` is for using note names, or midi pitches 
 - don't use `scale()`, it doesn't make sense here
```
$: note("<[57 60 64 59 62 65] [a3 c4 e4 b3 d4 f4]> ")
  .s("square:7")
```
