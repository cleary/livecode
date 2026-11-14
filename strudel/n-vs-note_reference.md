# `n()` vs `note()` reference

There are four main sources for pitched sounds that I use:
 1. inbuilt synth
 2. sample set with full set of pitched samples (eg 88 pitched piano samples) 
 3. single sample tuned to C
 4. sample set with a range of different timbres all tuned to C (eg [flbass](https://github.com/cleary/samples-flbass))

This reference is designed to explain how I use these different sources with the `n()` and `note()` functions

Source Documentation:
 - https://strudel.cc/understand/voicings/#n
 - https://strudel.cc/learn/notes/#notes

## 1. Inbuilt Synth
 - when combined with `scale()`, `n()` and `note()` are interchangeable
 - when there is no reference pitch (eg with `scale()` or `chord()`) `note()` requires midi pitches, or note names
 - for most built-in synths, the lowest bare `note()` value that is usable requires `.add("12|24")`

### melody with inbuilt synth

 - recommend always using with `scale()` to set reference pitch

```
$: n("0 2 4 1 3 5")
  .scale("A3:minor")
  .s("sine")
```
synonymous to:
```
$: note("0 2 4 1 3 5")
  .scale("A3:minor")
  .s("sine")
```

Bare `note()` usage (lowest usable for `"sine"`):
```
$: note("0 2 4 1 3 5".add(24))
  .s("sine")
```

```
$: note("<[57 60 64 59 62 65] [a3 c4 e4 b3 d4 f4]> ")
  .s("sine")
```

### manual chord construction with inbuilt synth

```
$: n("<[1,3,5] [4,6,8] [0,2,4] [5,7,9]>")
  .scale("A3:minor")
  .s("sine")
```

## 2. sample set with full set of pitched samples (eg 88 pitched piano samples) 

### melody with pitched sample set
 - Use `scale()` to set reference pitch, makes `n()` and `note()` interchangeable
 - use `cut()` or `clip()` to control length

```
samples('https://samples.grbt.com.au/strudel.json')
$: n("0 2 4 1 3 5")
  .scale("A3:minor")
  .s("hello")
  .cut(1)
```

Bare `note()` usage with **pitched sample set**:
```
samples('https://samples.grbt.com.au/strudel.json')
$: note("<[57 60 64 59 62 65] [a3 c4 e4 b3 d4 f4]> ")
  .s("hello")
  .clip(1)
```

## 3. single sample tuned to C

### melody with pitched single sample
 - use `scale()` to set reference pitch, makes `n()` and `note()` interchangeable
 - use `cut()` or `clip()` to control length
 - `C2` is original sample pitch reference for `"flbass"`
```
samples('https://samples.grbt.com.au/strudel.json')
$: note("0 2 4 1 3 5")
  .scale("A2:minor")
  .s("flbass:14")
  .cut(1)
```

### Bare `note()` usage
```
samples('https://samples.grbt.com.au/strudel.json')
$: note("<[57 60 64 59 62 65] [a3 c4 e4 b3 d4 f4]> ")
  .s("flbass:14")
  .cut(1)
```


## 4. sample set with a range of different timbres all tuned to C

### melody using multiple sample indexes at the same pitch (different timbres)
 - use `cut()` or `clip()` to control length
 - `C2` is original sample pitch reference
 - notice the `n()` is contained **within** the `s()` function
 - `n()` and `note()` are interchangeable for the melody component
 - `n()` and `note()` are **NOT** interchangeable for the sample index component
 - recommend using `note()` for melody, and `n()` for sample index for clarity

```
samples('https://samples.grbt.com.au/strudel.json')
$: note("0 2 4 1 3 5")
  .scale("A2:minor")
  .s("flbass".n("0 1 15 3 4 14")) // n() is contained **within** the s() function
  .cut(1)
```

# `chord()` Appendix

 - ref: https://strudel.cc/understand/voicings/#chord-symbols
 - you cannot use lower case for names
 - `chord()` application is the same across sound sources
 - use `clip()` to control sample length
 - do not use `cut()` with `chord()` or you will only hear one note (and no chord)

## default dictionary of chord names
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

## manual chords with inbuilt synth

```
$: n("<[1,3,5] [4,6,8] [0,2,4] [5,7,9]>")
  .scale("A3:minor")
  .s("sine")
```

### using `n()` to pick individual notes from `chord()`
 - for `chord()` info, see below

```
$: n("<[0 4 5] [2 6 4] [0 2 4] [2 4 0]>*8")
  .chord("<Bm7b5 Em Am F>").voicing()
  .s("sine")
```

...almost equivalent to `arp()` usage
```
$: chord("<Bm7b5 Em Am F>").voicing()
  .arp("<[0 4 5] [2 6 4] [0 2 4] [2 4 0]>*8")
  .s("sine")
```

### `chord()` and individual notes blended, with `arp()`
- requires `off()` or `arp()` is applied in place of the original pattern which I want to preserve

```
$: chord("<Bm7b5 Em Am F>").voicing()
  .s("sine")
  .off(0, y=>y.arp("[0 4 5] [2 6 4] [0 2 4] [2 4 0]")
    .transpose(24)
    .mask("<0 1 1 0 0 1 0 1 1 >*16"))
```

# Appendix: The confusion explained (maybe ... somewhat)

Coming from tidalcycles, this is something that has taken me too long to wrap my head around ...

To be fair, it was relatively tricky to wrap my head around in tidalcycles too ... but this is extra!

Consider:

`n(i)` for unpitched sounds - if a folder named `foosamples` has 4 samples in it, then `i` references the ith sample in the folder. 
```
$: n("1 2 3 4").s("jazz")
```

If you want to pitch the sounds in this bank, use `note()`
```
note("1 2 3 4 5 6 7 8").s("jazz")
```

But we are no longer referencing different indexes now.
Add the indexes back:
```
note("1 2 3 4 5 6 7 8")
.n("1 2 3 4").s("jazz")
```

We have no pitch reference, so add `scale()`
```
note("1 2 3 4 5 6 7 8").scale("A3:minor")
.n("1 2 3 4").s("jazz")
```

...now we have a reference pitch, `note()` and `n()` are interchangeable(!!)
```
n("1 2 3 4 5 6 7 8").scale("A3:minor")
.n("1 2 3 4").s("jazz")
```
