// STRUDEL NUDELS
// snippets for strudel

// breaks - jader
setcps(165/60/4)
samples('github:tidalcycles/dirt-samples')

$: s("breaks165")
.splice(8, "<[2 1 1 4] [6 2 3 5] [2 1 1 4] [4 4 2 3]>*2")
.gain(1.2).ribbon("0 .25", 2).almostNever(ply("2"))
