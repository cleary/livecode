## JSoLang reuse vars example

eval in a low number panel

```
##JSoLang simple-text-replacement

// an example JSoLang that takes provided text
// and applies some number of rules to replace text
// with alternate text. Basic idea: repeatedly try
// to match specific rules that return something
// different than the text they match, and whenever
// that fails simply match and return the next character

main = x:allRules* { return "##tidal\n" + x.join("") }
allRules = chords / anyCharacter
anyCharacter = .

// specific replacement rules, the i makes the find operation
// case insensitive
chords = "chords"i { return "<[~@1.5 af'maj9@1 g4'dom7@1.5 ] c4'min9 c'min9>" }
```

use chords in another panel

```
##simple-text-replacement 

note "chords"
# s "sprvibe"
```
