-- https://github.com/cleary/livecode/
-- tidal_function_helpers.tidal

-- load modules required for rolled
-- this should be in next release after 1.7.10

:m +  Data.List Data.Maybe Sound.Tidal.Utils

:{
rolledWith :: ([Event a] -> [EventF (ArcF Time) b]) -> Pattern a -> Pattern b
rolledWith f = withEvents aux
         where aux es = concatMap (steppityIn) (groupBy (\a b -> whole a == whole b) $ sortOn whole (f es))
               steppityIn xs = mapMaybe (\(n, x) -> shiftIt n (length xs) x) $ enumerate xs
               shiftIt n d (Event c (Just (Arc s e)) a' v) = do 
                         a'' <- subArc (Arc newS e) a'
                         return (Event c (Just $ Arc newS e) a'' v)
                      where newS = s + (dur * fromIntegral n)
                            dur = (e - s) / (4*fromIntegral d)

rolled :: Pattern b -> Pattern b
rolled = rolledWith id

rolled' :: Pattern b -> Pattern b
rolled' = rolledWith reverse
:}

:{
let 
    --rolled = withEvents aux
    --         where aux es = concatMap (steppityIn) (groupBy (\a b -> whole a == whole b) $ sortOn whole es)
    --               steppityIn xs = mapMaybe (\(n, x) -> shiftIt n (length xs) x) $ enumerate xs
    --               shiftIt n d (Event c (Just (Arc s e)) a' v) = do 
    --                         a'' <- subArc (Arc newS e) a'
    --                         return (Event c (Just $ Arc newS e) a'' v)
    --                      where newS = s + (dur * fromIntegral n)
    --                            dur = (e - s) / (4*fromIntegral d)
    move34 p = foldEvery [3,4] (0.25 <~) $ p -- every 3rd and 4th cycles shift beat by 1/4 cycle 
    move78 p = foldEvery [7,8] (0.25 <~) $ p -- every 7th and 8th cycles shift beat by 1/4 cycle
    -- quieten = mapM_ (\i -> xfade i silence) [1 .. 16] -- fade all channels to silence over 16 cycles
    -- quietenIn t = mapM_ (\i -> xfadeIn i t silence) [1 .. 16] -- fade all channels to silence over t cycles
    accBy x = accelerate (2 **| (x |/ 12) - 1) -- accelerate by x semitones
    -- kindohm, ref: https://blog.tidalcycles.org/kindohm-interview/
    rip a b p = within (0.25, 0.75) (slow 2 . rev . stut 8 a b) p
    -- lwlsn, ref: https://youtu.be/t2KeNblKSFM?t=261
    modFunc p = 
                every 2 ((#crush 0.5) . rip 0.125 0.25) $
                every 5 (jux rev) $
                every 6 (# speed "0.5 -1 -1 0.75") $ p
    -- momentary mute via midi, use as `$ mmute "104"` where 104 is the midi button ref
    -- push the button to mute, release to unmute
    -- mmute c = while ((/= 0) <$> cF 0 c) (const silence)

    -- by pulu - clamp number pattern to given range, scale the output
    crop :: Pattern Double -> Pattern Double -> Pattern Double -> Pattern Double
    crop l r x = (max l (min r x) - l) / (r - l)
    -- d1 $ let
    --   kn = cF 0 "kn1"
    --   in id
    --   $ n "<<0!2 -2> <1 ~> <4 7 5 8>>*16"
    --   # s "supervibe"
    --   # release 0.05
    --   -- 1st half of knob opens filter:
    --   # lpf (rangex 400 12000 $ crop 0 0.5 kn)
    --   -- 2nd half adds reverb:
    --   # room (range 0 0.15 $ crop 0.5 1 kn)
:}

-- text representation of patterns
-- drawLine $ "x y" -- also drawLineSz , unsure of extra functionality provided though

