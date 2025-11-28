// Aria Glossing: https://discord.com/channels/779427371270275082/1441524774726795355/1443440336784588902
const glide = register(
  'glide',
  (time, pat) => {
    let curr = [],
      prev = [],
      lastT = null;
    const query = (state) => {
      const trig = !!state.controls._cps; // an actual trigger as opposed to lookahead
      const haps = pat.query(state);
      const output = [];
      haps.map((hap) => {
        const { value, whole } = hap;
        const t = Number(whole.begin);
        if (trig && (lastT == null || lastT !== t)) {
          prev = curr;
          curr = [];
          lastT = t;
        }
        const glideHaps = time.query(state.setSpan(hap.wholeOrPart()));
        glideHaps.map((glideHap) => {
          const part = hap.part.intersection(glideHap.part);
          if (!part) return;
          const context = hap.combineContext(glideHap);
          const glideT = glideHap.value;
          const freqF = getFrequencyFromValue(value, value.s === 'sbd' ? 29 : 36); // target
          const freqI = prev.length
            ? prev.reduce((closest, v) => {
                const phase = glideT > 0 ? Math.min((t - v.t) / glideT, 1) : 1;
                const cand = v.freqI + phase * (v.freqF - v.freqI);
                if (closest == null) return cand;
                return Math.abs(cand - freqF) < Math.abs(closest - freqF) ? cand : closest;
              }, null)
            : freqF;
          if (trig) {
            curr.push({ freqI, freqF, t });
          }
          let newVal = value;
          if (Math.abs(freqF - freqI) > 1e-6) {
            newVal = {
              ...value,
              panchor: 0,
              psustain: 0,
              pattack: 0,
              pdecay: glideT,
              penv: -12 * Math.log2(freqF / freqI),
            };
          }
          output.push(new Hap(whole, part, newVal, context));
        });
      });
      return output;
    };
    return new Pattern(query);
  },
  false,
);

/* example
s("square").seg(8).n(irand(12)).scale("F1:minor").lpf(40).lpenv(6).lpd(0.3)
  .lpq(2)
  .glide("<0.3 0 0.05>")
*/
