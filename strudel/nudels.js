// STRUDEL NUDELS
// snippets for strudel

// breaks - jader
setcps(165/60/4)
samples('github:tidalcycles/dirt-samples')

$: s("breaks165")
.splice(8, "<[2 1 1 4] [6 2 3 5] [2 1 1 4] [4 4 2 3]>*2")
.gain(1.2).ribbon("0 .25", 2).almostNever(ply("2"))

// lead synth tones 
// sawtooth w/some breakup
  .s("sawtooth")
  .fm("<0 1 2 8 32>*8")
  .fmh("<1 2>")
  .fmattack(0.05)
  .fmdecay(0.5)
  .fmsustain(0.1)
  .fmenv("<exp lin>")
  .prelease(-0.05)
  .penv(2)
  .pcurve("exp")

// bass synth tones
// mid-heavy with some breakup 
  .s("square")
  .transpose(-24)
  .lpf(800)
  .fm("<0 1 2 8 32>*8") //control breakup here
  .fmh("<1 2>")
  .fmattack(0.05)
  .fmdecay(0.5)
  .fmsustain(0.1)
  .fmenv("<exp lin>")
  .prelease(-0.05)
  .penv(2)
  .pcurve("exp")
