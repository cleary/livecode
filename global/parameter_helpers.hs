let 
    timbre = pF "timbre"
    color = pF "color"
    model = pI "model"
    mode = pI "mode"
    tidesshape = pF "tidesshape"
    tidessmooth = pF "tidessmooth"
    slope = pF "slope"
    shift = pF "shift"
    engine = pI "engine"
    harm = pF "harm"
    morph = pF "morph"
    level = pF "level"
    lpgdecay = pF "lpgdecay"
    lpgcolour = pF "lpgcolour"
    lpg d c = lpgdecay d # lpgcolour c
-- mutable effects
    cloudspitch = pF "cloudspitch"
    cloudspos = pF "cloudspos"
    cloudssize = pF "cloudssize"
    cloudsdens = pF "cloudsdens"
    cloudstex = pF "cloudstex"
    cloudswet = pF "cloudswet"
    cloudsgain = pF "cloudsgain"
    cloudsspread = pF "cloudsspread"
    cloudsrvb = pF "cloudsrvb"
    cloudsfb = pF "cloudsfb"
    cloudsfreeze = pF "cloudsfreeze"
    cloudsmode = pF "cloudsmode"
    cloudslofi = pF "cloudslofi"
    clouds p s d t = cloudsgain 1 # cloudspos p # cloudssize s # cloudsdens d # cloudstex t
    cloudsblend w s f r = cloudsgain 1 # cloudswet w # cloudsspread s # cloudsfb f # cloudsrvb r
    elementspitch = pF "elementspitch"
    elementsstrength = pF "elementsstrength"
    elementscontour = pF "elementscontour"
    elementsbowlevel = pF "elementsbowlevel"
    elementsblowlevel = pF "elementsblowlevel"
    elementsstrikelevel = pF "elementsstrikelevel"
    elementsflow = pF "elementsflow"
    elementsmallet = pF "elementsmallet"
    elementsbowtimb = pF "elementsbowtimb"
    elementsblowtimb = pF "elementsblowtimb"
    elementsstriketimb = pF "elementsstriketimb"
    elementsgeom = pF "elementsgeom"
    elementsbright = pF "elementsbright"
    elementsdamp = pF "elementsdamp"
    elementspos = pF "elementspos"
    elementsspace = pF "elementsspace"
    elementsmodel = pI "elementsmodel"
    elementseasteregg = pI "elementseasteregg"
    mu = pF "mu"
    ringsfreq = pF "ringsfreq"
    ringsstruct = pF "ringsstruct"
    ringsbright = pF "ringsbright"
    ringsdamp = pF "ringsdamp"
    ringspos = pF "ringspos"
    ringsmodel = pF "ringsmodel"
    ringspoly = pI "ringspoly"
    ringsinternal = pI "ringsinternal"
    ringseasteregg = pI "ringseasteregg"
    rings f s b d p = ringsfreq f # ringsstruct s # ringsbright b # ringsdamp d # ringspos p
    ripplescf = pF "ripplescf"
    ripplesreson = pF "ripplesreson"
    ripplesdrive = pF "ripplesdrive"
    ripples c r d = ripplescf c # ripplesreson r # ripplesdrive d
    verbgain = pF "verbgain"
    verbwet = pF "verbwet"
    verbtime = pF "verbtime"
    verbdamp = pF "verbdamp"
    verbhp = pF "verbhp"
    verbfreeze = pI "verbfreeze"
    verbdiff = pF "verbdiff"
    verb w t d h = verbgain 1 # verbwet w # verbtime t # verbdamp d # verbhp h
-- superfm
-- basic functions notation
-- modulators
    mod11 = pF "mod11"
    mod12 = pF "mod12"
    mod13 = pF "mod13"
    mod14 = pF "mod14"
    mod15 = pF "mod15"
    mod16 = pF "mod16"
    mod21 = pF "mod21"
    mod22 = pF "mod22"
    mod23 = pF "mod23"
    mod24 = pF "mod24"
    mod25 = pF "mod25"
    mod26 = pF "mod26"
    mod31 = pF "mod31"
    mod32 = pF "mod32"
    mod33 = pF "mod33"
    mod34 = pF "mod34"
    mod35 = pF "mod35"
    mod36 = pF "mod36"
    mod41 = pF "mod41"
    mod42 = pF "mod42"
    mod43 = pF "mod43"
    mod44 = pF "mod44"
    mod45 = pF "mod45"
    mod46 = pF "mod46"
    mod51 = pF "mod51"
    mod52 = pF "mod52"
    mod53 = pF "mod53"
    mod54 = pF "mod54"
    mod55 = pF "mod55"
    mod56 = pF "mod56"
    mod61 = pF "mod61"
    mod62 = pF "mod62"
    mod63 = pF "mod63"
    mod64 = pF "mod64"
    mod65 = pF "mod65"
    mod66 = pF "mod66"
    -- operator envelope generator levels
    eglevel11 = pF "eglevel11"
    eglevel12 = pF "eglevel12"
    eglevel13 = pF "eglevel13"
    eglevel14 = pF "eglevel14"
    eglevel21 = pF "eglevel21"
    eglevel22 = pF "eglevel22"
    eglevel23 = pF "eglevel23"
    eglevel24 = pF "eglevel24"
    eglevel31 = pF "eglevel31"
    eglevel32 = pF "eglevel32"
    eglevel33 = pF "eglevel33"
    eglevel34 = pF "eglevel34"
    eglevel41 = pF "eglevel41"
    eglevel42 = pF "eglevel42"
    eglevel43 = pF "eglevel43"
    eglevel44 = pF "eglevel44"
    eglevel51 = pF "eglevel51"
    eglevel52 = pF "eglevel52"
    eglevel53 = pF "eglevel53"
    eglevel54 = pF "eglevel54"
    eglevel61 = pF "eglevel61"
    eglevel62 = pF "eglevel62"
    eglevel63 = pF "eglevel63"
    eglevel64 = pF "eglevel64" 
    -- operator envelope generator rates
    egrate11 = pF "egrate11"
    egrate12 = pF "egrate12"
    egrate13 = pF "egrate13"
    egrate14 = pF "egrate14"
    egrate21 = pF "egrate21"
    egrate22 = pF "egrate22"
    egrate23 = pF "egrate23"
    egrate24 = pF "egrate24"
    egrate31 = pF "egrate31"
    egrate32 = pF "egrate32"
    egrate33 = pF "egrate33"
    egrate34 = pF "egrate34"
    egrate41 = pF "egrate41"
    egrate42 = pF "egrate42"
    egrate43 = pF "egrate43"
    egrate44 = pF "egrate44"
    egrate51 = pF "egrate51"
    egrate52 = pF "egrate52"
    egrate53 = pF "egrate53"
    egrate54 = pF "egrate54"
    egrate61 = pF "egrate61"
    egrate62 = pF "egrate62"
    egrate63 = pF "egrate63"
    egrate64 = pF "egrate64"
    -- operator output levels
    amp1 = pF "amp1"
    amp2 = pF "amp2"
    amp3 = pF "amp3"
    amp4 = pF "amp4"
    amp5 = pF "amp5"
    amp6 = pF "amp6"
    -- operator frequency ratios
    ratio1 = pF "ratio1"
    ratio2 = pF "ratio2"
    ratio3 = pF "ratio3"
    ratio4 = pF "ratio4"
    ratio5 = pF "ratio5"
    ratio6 = pF "ratio6"
    -- operator frequency detuners
    detune1 = pF "detune1"
    detune2 = pF "detune2"
    detune3 = pF "detune3"
    detune4 = pF "detune4"
    detune5 = pF "detune5"
    detune6 = pF "detune6"
    -- other
    feedback = pF "feedback"
    lfofreq = pF "lfofreq"
    lfodepth = pF "lfodepth"

-- superfm alternate notation, see https://club.tidalcycles.org/t/superfm/1761/8
    -- (1 <= op <= 6)
--let fmamp :: Int -> Pattern Double -> ControlPattern
--    fmamp op = pF ("amp" ++ show op)
--    -- sets the ratio for operator 'op'.
--    -- the frequency is note * ratio + detune Hz
--    -- (1 <= op <= 6)
--    fmratio :: Int -> Pattern Double -> ControlPattern
--    fmratio op = pF ("ratio" ++ show op)
--    -- set the detune for operator 'op'
--    fmdetune :: Int -> Pattern Double -> ControlPattern
--    fmdetune op = pF ("detune" ++ show op)
--    -- set the modulation of oerator opa by operator opb
--    -- if opa == opb, then the modulation amount is multiplied by the
--    -- 'feedback' parameter
--    fmmod :: Int -> Int -> Pattern Double -> ControlPattern
--    fmmod opa opb = pF ("mod" ++ show opa ++ show opb)
--    -- feedback
--    fmfeedback :: Pattern Double -> ControlPattern
--    fmfeedback = pF "feedback"
--    -- Envelope definition: each operator has an envelop with 4 steps
--    fmeglevel :: Int -> Int -> Pattern Double -> ControlPattern
--    fmeglevel op step = pF ("eglevel" ++ show op ++ show step)
--    -- Envelope definition: sets the rate at which the envelope moves
--    -- between steps.  Low numbers are slow, high numbers are fast.
--    fmegrate :: Int -> Int -> Pattern Double -> ControlPattern
--    fmegrate op step = pF ("egrate" ++ show op ++ show step)
    
d1 $ s "bd:0"    
