-- https://github.com/cleary/livecode/
-- tidal_function_helpers.tidal

-- load modules required for rolled

:m +  Data.List Data.Maybe Sound.Tidal.Utils

let 
    rolled = withEvents aux
             where aux es = concatMap (steppityIn) (groupBy (\a b -> whole a == whole b) $ sortOn whole es)
                   steppityIn xs = mapMaybe (\(n, x) -> shiftIt n (length xs) x) $ enumerate xs
                   shiftIt n d (Event c (Just (Arc s e)) a' v) = do 
                             a'' <- subArc (Arc newS e) a'
                             return (Event c (Just $ Arc newS e) a'' v)
                          where newS = s + (dur * fromIntegral n)
                                dur = (e - s) / (4*fromIntegral d)
    move34 p = foldEvery [3,4] (0.25 <~) $ p -- every 3rd and 4th cycles shift beat by 1/4 cycle 
    move78 p = foldEvery [7,8] (0.25 <~) $ p -- every 7th and 8th cycles shift beat by 1/4 cycle
    quieten = mapM_ (\i -> xfade i silence) [1 .. 16] -- fade all channels to silence over 16 cycles
    quietenIn t = mapM_ (\i -> xfadeIn i t silence) [1 .. 16] -- fade all channels to silence over t cycles
    accBy x = accelerate (2 **| (x |/ 12) - 1) -- accelerate by x semitones
    -- rolled chords (arpeggiated long notes in a chord)
    -- eg d1 $ rolled $ n "c4'min" # s "superpiano" # sustain 4


-- text representation of patterns
-- drawLine $ "x y" -- also drawLineSz , unsure of extra functionality provided though

-- estuary view functions 
--   1. open a new browser tab at https://estuary.mcmaster.ca
--   2. go to solo mode
--   3. enter into the terminal: 
--
-- !presetview default (return to the default view)
-- !localview audiomap (list all samples)
-- !localview [] (show visuals only)
