# Pick and Arrange for section definition

## Pick example

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
