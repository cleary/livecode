import Sound.Tidal.Bjorklund (bjorklund)

import qualified Data.List as L

import Data.List hiding (union)

import Data.Char as Char

:m +  Data.Maybe

:m + Sound.Tidal.Utils

:{
espeakTarget :: Target
espeakTarget = Target {oName = "espeak",
                       oAddress = "127.0.0.1",
                       oPort = 6053,
                       oBusPort = Nothing,
                       oLatency = 0.02,
                       oWindow = Nothing,
                       oSchedule = Live,
                       oHandshake = False
                      }

espeakShape :: OSC
espeakShape = OSC "/espeak" $ ArgList [("word", required),
                                       ("language", sDefault "german"),
                                       ("pitch", fDefault 32),
                                       ("speed", fDefault 150)
                                      ]
:}

:{
let word = pS "word"
    pitch = pF "pitch"
:}

 :{
 let flood = putStrLn . concat . replicate 9999
     replicator text1 = [putStr (text1) | x <- replicate 9999 text1]
     spill text2 = sequence_(replicator text2)
     replicator' n text1 = [putStr (text1) | x <- replicate n text1]
     spill' n text2 = sequence_(replicator' n text2)
     destabilizeBy a p = (a <~) p
     shh p = degradeBy 1 $ p
     rip a b p = within (0.25, 0.75) (slow 2 . stutWith 8 (a/(-8))(|* legato b)) p
     devolve p = (# pan (range 0 1 $ slow 8.88 perlin)).(# cps ("<0.65 0.75 0.85 0.95 1.05 1.15>" * (range 0.55 1.11 $ slow 22.22 perlin))) $ p
     compress x p = slow x $ (# (nudge (range 0 1 $ slow 2 sine))) $ p
     sliceDiv posL posR subdivWhat subdivBy p = within' ((posL/subdivWhat), posR/subdivWhat) (fast subdivBy . _slow (posR - posL)) p
     rinse a b p = ((1/a) <~) $ struct (slow b "t") $ loopAt (-1/a) $ p
     trap p = slow 2 $ foldEvery [4,5,6] (stripe 2) $ p
     trill n p = (slow n . ply n) $ p
     screw p = someCyclesBy 0.66 (plyWith 2 ((0.25 <~).(# legato 0.5))) $ p
     tilt p = whenmod 11 5 ((spaceOut [2,1.95..0.75]).(iter 2)) $ p
     twirl p = outside "<2 4>" (chop 2 . stutWith 12 (1/24)(|* legato 0.9)) $ p
     slide x = accelerate (2 **| (x |/ 12) - 1)
     shrand x = (x ~>) $ rand
     nvrand = (1 - rand)
     -- launch p = qtrigger 2 $ filterWhen (>=0) $ p
     limit = (# gain 1.25)
     tParamTup :: ((a,b) -> c -> Pattern d) -> (Pattern a, Pattern b) -> c -> Pattern d
     tParamTup f = uncurry $ tParam2 $ curry f
     zoom' = tParamTup zoom
     lingerAt :: (Pattern Time, Pattern Time) -> Pattern a -> Pattern a
     lingerAt a@(t1,t2) p = slow (t2 - t1) $ zoom' a p
     dRack :: Pattern String -> ControlPattern
     dRack = n . (subtract 48 . drumN <$>)
     drumN :: Num a => String -> a
     drumN "1" = 0
     drumN "2" = 1
     drumN "3" = 2
     drumN "4" = 3
     drumN "5" = 4
     drumN "6" = 5
     drumN "7" = 6
     drumN "8" = 7
     rakk x = dRack x # dek 1 1 5
     sClip :: Pattern String -> ControlPattern
     sClip = n . (subtract 48 . clipN <$>)
     clipN :: Num a => String -> a
     clipN "1" = 0
     clipN "2" = 1
     clipN "3" = 2
     clipN "4" = 3
     clipN "5" = 4
     clipN "6" = 5
     clipN "7" = 6
     clipN "8" = 7
     clipN "9" = 8
     clipN "10" = 9
     clipN "11" = 10
     clipN "12" = 11
     clipN "13" = 12
     clipN "14" = 13
     clipN "15" = 14
     clipN "16" = 15
     clip x = sClip x # dek 6 1 7
     funcrush = s "funcrush"
     dek a b c = s "funcrush" # midichan (a -1) # legato b # octave c # amp 1
     ccvrand shiftAmount = ccv (range 0 127 $ shrand shiftAmount)
     ccup n = ccv (range 0 127 $ saw) # ccn n
     ccdown n = ccv (range 127 0 $ saw) # ccn n
     randcc n = ccv (range 0 127 $ rand) # ccn n
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
     hexAt :: Int -> [Char] -> Pattern Bool
     hexAt n s = parseBP_E $ "{" ++ (mconcat $ map mLookup s') ++ "}%" ++ show n
             where mLookup l = maybe "" id (lookup l mAlphabet)
                   s'        = (map Char.toLower s)
     hex :: [Char] -> Pattern Bool
     hex s = hexAt 16 s
     structH s = struct (hexAt 16 s)
     maskH s = mask (hexAt 16 s)
     fill :: Int -> Int -> Pattern Bool
     fill n x = timeCat $ map (\d -> (toRational d,pure True)) $ iois 0 $ bjorklund (n,x)
         where iois :: Int -> [Bool] -> [Int]
               iois 0 [] = []
               iois i [] = (i:[])
               iois 0 (True:xs) = iois 1 xs
               iois i (True:xs) = i:(iois 1 xs)
               iois i (False:xs) = iois (i+1) xs
     rolled = withEvents aux
              where aux es = concatMap (steppityIn) (groupBy (\a b -> whole a == whole b) $ sortOn whole es)
                    steppityIn xs = mapMaybe (\(n, x) -> shiftIt n (length xs) x) $ enumerate xs
                    shiftIt n d (Event c (Just (Arc s e)) a' v) = do
                              a'' <- subArc (Arc newS e) a'
                              return (Event c (Just $ Arc newS e) a'' v)
                           where newS = s + (dur * fromIntegral n)
                                 dur = (e - s) / (4*fromIntegral d)
     ncat :: [(Time, Pattern a)] -> Pattern a
     ncat = seqPLoop . go 0
       where
         go _     []          = []
         go t_acc ((0, _):ps) = go t_acc ps
         go t_acc ((t, p):ps) = (t_acc, t', p) : go t' ps
           where
             t' = t_acc + t
     applyOneByOneFromLeft :: Pattern (a -> b) -> Pattern a -> Pattern b
     applyOneByOneFromLeft pf px = Pattern q
         where q st = catMaybes $ concat $ zipWith match [0..length fQuery - 1] fQuery
                 where
                   fQuery = query pf st
                   match n ef = case length xQuery > n of
                                                   True -> [withFX ef (xQuery!!n)]
                                                   False -> []
                              where xQuery = query px $ st {arc = wholeOrPart ef}
                   withFX ef ex = do let whole' = whole ef
                                     part' <- subArc (part ef) (part ex)
                                     return (Event (combineContexts [context ef, context ex]) whole' part' (value ef $ value ex))
     (##) :: Unionable a => Pattern a -> Pattern a -> Pattern a
     (##) a b = applyOneByOneFromLeft (union <$> a) b
 :}
