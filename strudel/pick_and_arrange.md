# Pick and Arrange for section definition

## Pick example

### Separated

ref: [strudel.cc](https://strudel.cc/#Ly8gR2V0IHVwLCBzdGFuZCB1cCBiYXNzbGluZSAoQSBwYXJ0KSAtIEFzdG9uIEJhcnJldHQKCnNhbXBsZXMoJ2dpdGh1YjpjbGVhcnkvc2FtcGxlcy1mbGJhc3MnKQoKJDogYWxsKHN3aW5nQnkoMS82LCA0KSkKCgpjb25zdCBBbm90ZSA9IGA8WyB%2BIDQgLiAyIC4gfiAxIC4gMiAxIF0gCiAgICAgICAgICAgICAgICBbIDAgXSBbIDQgLTMgXyAtMSBdIFswXT5gCgpjb25zdCBBc3RyICA9IGA8WzAgMSAuIDEgLiAwIDEgLiAxIDFdCiAgICAgICAgICAgICBbMSAuIDAgLiA8MCAgWzEgMV0%2BIC4gMCAxXQogICAgICAgICAgICAgW1sxIH5dIDEgXyAxXQogICAgICAgICAgICAgWzEgIC4gMCAuIDAgLiAwXT5gCgpjb25zdCBCbm90ZSA9IGA8IFsgMiAzIDQgLiA8OSBbLTEgMF0%2BIF0KICAgICAgICAgICAgICAgICBbIH4gLiB%2BIC4gfiAuIH4gNl0KICAgICAgICAgICAgICA%2BYAoKY29uc3QgQnN0ciA9IGA8IFsgMUAzIDFAMyAxQDIgLiA8MSBbMSEyXT4gXQogICAgICAgICAgICAgICAgWyAwQDcgMSBdCiAgICAgICAgICAgICAgPmAKCmJhc3M6IG4oIjwwITggMSE4PiIucGljayhbQW5vdGUsIEJub3RlXSkpCiAgICAgLnNjYWxlKCJDMjptaW5vciIpCiAgICAucygiZmxiYXNzIikKICAgICAgLnN0cnVjdCgiPDAhOCAxITg%2BIi5waWNrKFtBc3RyLCBCc3RyXSkpCiAgICAuY3BzKDE1NS82MC80KQogICAgLmNsaXAoMSkKCiQ6IHMoImJkIHNkLCBoaCo0ICIpCgokOiBuKCIwLDIsNCIpLnMoImdtX2VsZWN0cmljX2d1aXRhcl9tdXRlZCIpCiAgLnNjYWxlKCJDNDptaW5vciIpCiAgLnN0cnVjdCgiWzAgMSoyXSoyIikKICAuZGlzdCgxLjQpLnBvc3RnYWluKDAuNSkKICAuY2xpcCgwLjgpCg%3D%3D)

```
// Get up, stand up bassline (A part) - Aston Barrett

samples('github:cleary/samples-flbass')

$: all(swingBy(1/6, 4))


const Anote = `<[ ~ 4 . 2 . ~ 1 . 2 1 ] 
                [ 0 ] [ 4 -3 _ -1 ] [0]>`

const Astr  = `<[0 1 . 1 . 0 1 . 1 1]
             [1 . 0 . <0  [1 1]> . 0 1]
             [[1 ~] 1 _ 1]
             [1  . 0 . 0 . 0]>`

const Bnote = `< [ 2 3 4 . <9 [-1 0]> ]
                 [ ~ . ~ . ~ . ~ 6]
              >`

const Bstr = `< [ 1@3 1@3 1@2 . <1 [1!2]> ]
                [ 0@7 1 ]
              >`

bass: n("<0!8 1!8>".pick([Anote, Bnote]))
     .scale("C2:minor")
    .s("flbass")
      .struct("<0!8 1!8>".pick([Astr, Bstr]))
    .cps(155/60/4)
    .clip(1)
```

### Compacted

ref: [strudel.cc](https://strudel.cc/#Ly8gR2V0IHVwLCBzdGFuZCB1cCBiYXNzbGluZSAoQSBwYXJ0KSAtIEFzdG9uIEJhcnJldHQKCnNhbXBsZXMoJ2dpdGh1YjpjbGVhcnkvc2FtcGxlcy1mbGJhc3MnKQoKJDogYWxsKHN3aW5nQnkoMS82LCA0KSkKCmJhc3M6ICI8QSE4IEIhOD4iLnBpY2soewoKICBBOiBuKCBgPFsgfiA0IC4gMiAuIH4gMSAuIDIgMSBdIAogICAgICAgICAgWyAwIF0gWyA0IC0zIF8gLTEgXSBbMF0gICAgPmAgKQogICAgLnN0cnVjdChgPFswIDEgLiAxIC4gMCAxIC4gMSAxXQogICAgICAgICAgWzEgLiAwIC4gPDAgIFsxIDFdPiAuIDAgMV0KICAgICAgICAgIFtbMSB%2BXSAxIF8gMV0KICAgICAgICAgIFsxICAuIDAgLiAwIC4gMF0gID5gKSwKICAKICBCOiBuKCBgPCBbIDIgMyA0IC4gPDkgWy0xIDBdPiBdCiAgICAgICAgICAgWyB%2BIC4gfiAuIH4gLiB%2BIDZdID5gKQogICAgLnN0cnVjdChgPCBbIDFAMyAxQDMgMUAyIC4gPDEgWzEhMl0%2BIF0KICAgICAgICAgICBbIDBANyAxIF0gPmApICAgICAgCiAgfSkKICAuc2NhbGUoIkMyOm1pbm9yIikKICAucygiZmxiYXNzIikKICAuY3BzKDE1NS82MC80KQogIC5jbGlwKDEpCgokOiBzKCJiZCBzZCwgaGgqNCAiKQoKJDogbigiMCwyLDQiKS5zKCJnbV9lbGVjdHJpY19ndWl0YXJfbXV0ZWQiKQogIC5zY2FsZSgiQzQ6bWlub3IiKQogIC5zdHJ1Y3QoIlswIDEqMl0qMiIpCiAgLmRpc3QoMS40KS5wb3N0Z2FpbigwLjUpCiAgLmNsaXAoMC44KQo%3D)

```
// Get up, stand up bassline (A/B parts) - Aston Barrett

samples('github:cleary/samples-flbass')

$: all(swingBy(1/6, 4))
bass: "<A!8 B!8>".pick({

  A: n( `<[ ~ 4 . 2 . ~ 1 . 2 1 ] 
          [ 0 ] [ 4 -3 _ -1 ] [0]    >` )
    .struct(`<[0 1 . 1 . 0 1 . 1 1]
          [1 . 0 . <0  [1 1]> . 0 1]
          [[1 ~] 1 _ 1]
          [1  . 0 . 0 . 0]  >`),
  
  B: n( `< [ 2 3 4 . <9 [-1 0]> ]
           [ ~ . ~ . ~ . ~ 6] >`)
    .struct(`< [ 1@3 1@3 1@2 . <1 [1!2]> ]
           [ 0@7 1 ] >`)      
  })
  .scale("C2:minor")
  .s("flbass")
  .cps(155/60/4)
  .clip(1)
```

## Arrange example

TBD
