-- https://github.com/cleary/livecode/
-- tidal_function_helpers.tidal

-- load modules required for rolled
-- this should be in next release after 1.7.10

:m +  Data.List Data.Maybe Sound.Tidal.Utils

import Data.Char as Char

-- :{
-- rolledWith :: ([Event a] -> [EventF (ArcF Time) b]) -> Pattern a -> Pattern b
-- rolledWith f = withEvents aux
--          where aux es = concatMap (steppityIn) (groupBy (\a b -> whole a == whole b) $ sortOn whole (f es))
--                steppityIn xs = mapMaybe (\(n, x) -> shiftIt n (length xs) x) $ enumerate xs
--                shiftIt n d (Event c (Just (Arc s e)) a' v) = do 
--                          a'' <- subArc (Arc newS e) a'
--                          return (Event c (Just $ Arc newS e) a'' v)
--                       where newS = s + (dur * fromIntegral n)
--                             dur = (e - s) / (4*fromIntegral d)
-- 
-- rolled :: Pattern b -> Pattern b
-- rolled = rolledWith id
-- 
-- rolled' :: Pattern b -> Pattern b
-- rolled' = rolledWith reverse
-- :}

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
    sqz effectcycle pat = squeezeJoin $ ((# effectcycle) . pure) <$> pat
    -- example: d1 $ sqz (djfbus 4 (segment 128 $ rangex 0.1 0.9 tri)) $ note "0 7 -7 5 8 12 0" # s "braids" # sustain 2
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
    -- Code adapted from morse-tidal by https://github.com/paulchannelstrip

    -- Hex to Bool represented as a table.
    mAlphabet :: [ (Char, String ) ]
    mAlphabet =  [ ('0' , "0000" )
                 , ('1' , "0001" )
                 , ('2' , "0010" )
                 , ('3' , "0011" )
                 , ('4' , "0100" )
                 , ('5' , "0101" )
                 , ('6' , "0110" )
                 , ('7' , "0111" )
                 , ('8' , "1000" )
                 , ('9' , "1001" )            
                 , ('a' , "1010" )
                 , ('b' , "1011" )
                 , ('c' , "1100" )
                 , ('d' , "1101" )
                 , ('e' , "1110" )
                 , ('f' , "1111" )
                 ]

    -- `n` is the number of subdivisions per-cycle in the resulting pattern
    -- `s` is the string to be hex-encoded
    hexAt :: Int -> [Char] -> Pattern Bool
    hexAt n s = parseBP_E $ "{" ++ (mconcat $ map mLookup s') ++ "}%" ++ show n
                where mLookup l = maybe "" id (lookup l mAlphabet)
                      s'        = (map Char.toLower s)

    -- A default function with 16 subdivisions per-cycle.
    hex :: [Char] -> Pattern Bool
    hex s = hexAt 16 s

    --  Two convenience functions
    structH s = struct (hexAt 16 s)
    maskH s = mask (hexAt 16 s)
:}

-- text representation of patterns
-- drawLine $ "x y" -- also drawLineSz , unsure of extra functionality provided though

