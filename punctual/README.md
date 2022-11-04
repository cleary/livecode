# Media Sources for Punctual Visuals

## Videos

| Media Link | Source | License |
|------------|--------|---------|
| [Birds](https://upload.wikimedia.org/wikipedia/commons/3/30/Bird_feeder_in_the_mountains_of_Slovakia.webm) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Bird_feeder_in_the_mountains_of_Slovakia.webm) | [Creative Commons Attribution 3.0 Unported](https://creativecommons.org/licenses/by/3.0/deed.en) |
| [Drone Landscapes](https://upload.wikimedia.org/wikipedia/commons/3/3f/Le_grand_voyage.webm) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Le_grand_voyage.webm) | [Creative Commons Attribution 3.0 Unported](https://creativecommons.org/licenses/by/3.0/deed.en) |
| [Leaves](https://upload.wikimedia.org/wikipedia/commons/4/43/Leaves-in-quebec.webm) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Leaves-in-quebec.webm) | [Creative Commons Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.en) |
| [Mikropolis](https://upload.wikimedia.org/wikipedia/commons/c/ce/Mikropolis_Donostia_-_Tilt_Shift.webm) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Mikropolis_Donostia_-_Tilt_Shift.webm) | [Creative Commons Attribution-Share Alike 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/deed.en) |
| [Mountain biking on an Island](https://upload.wikimedia.org/wikipedia/commons/2/20/Enduro_Madeira_Island%2C_GoPro.webm) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Enduro_Madeira_Island,_GoPro.webm) | [Creative Commons Attribution 3.0 Unported](https://creativecommons.org/licenses/by/3.0/deed.en) |
| [Tilt-shift Miniature](https://upload.wikimedia.org/wikipedia/commons/8/88/Miniaturized_Port.webm) | [Wikimedia]([https://commons.wikimedia.org/wiki/File:Miniaturized_Port.webm](https://upload.wikimedia.org/wikipedia/commons/2/23/Spider_web_building.webm)) | [Creative Commons Attribution 3.0 Unported](https://creativecommons.org/licenses/by/3.0/deed.en) |
| [Tilt-shift Miniature](https://upload.wikimedia.org/wikipedia/commons/8/88/Miniaturized_Port.webm) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Miniaturized_Port.webm) | [Creative Commons Attribution 2.0 Generic](https://creativecommons.org/licenses/by/2.0/deed.en) |
| [Volcano](https://upload.wikimedia.org/wikipedia/commons/9/9f/Hunga_Tonga%E2%80%93Hunga_Ha%27apai_volcanic_eruption_January_14%2C_2022.webm) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Hunga_Tonga%E2%80%93Hunga_Ha%27apai_volcanic_eruption_January_14,_2022.webm) | [Creative Commons Attribution 3.0 Unported](https://creativecommons.org/licenses/by/3.0/deed.en) |

## Images

| Media Link | Source | License |
|------------|--------|---------|
| [Castle](https://upload.wikimedia.org/wikipedia/commons/8/87/Schloss_Marienburg_im_herbstlichen_Abendlicht.jpg) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Schloss_Marienburg_im_herbstlichen_Abendlicht.jpg) | [Creative Commons Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.en) | 
| [Frank Miller](https://upload.wikimedia.org/wikipedia/commons/7/71/Frank_Miller_-_Lucca_Comics_%26_Games_2016.jpg) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Frank_Miller_-_Lucca_Comics_%26_Games_2016.jpg) | [Creative Commons Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.en) |
| [Silence (street)](https://upload.wikimedia.org/wikipedia/commons/a/a9/Tilley_Hats_and_Silence.jpg) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Tilley_Hats_and_Silence.jpg) | [Creative Commons Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.en) |
| [Skylight Concentric Circles](https://upload.wikimedia.org/wikipedia/commons/5/5a/Solomon_R._Guggenheim_Museum_skylight.jpg) | [Wikimedia](https://commons.wikimedia.org/wiki/File:Solomon_R._Guggenheim_Museum_skylight.jpg) | [Creative Commons Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.en) |

## Code Snippets

Generating squares from audio
```
move (saw (step [0.4,0.9,-0.4,-0.9] $ lfsaw lo)) $ zoom (lo) $ hsvrgb(rect [0,0] [1.8] * [fft fx * sin lo,1,1]) >> video;
0.98 >> fdbk;
```

Parallax movement
```
someContent << img "https://img.grbt.com.au/tower2.jpg";
shiftRight << saw 0.1;
move [shiftRight,0] $ tile 1 $ someContent >> video;
```

Rorschach test
```
mono $ hsvrgb (setfxy [fx * 0.2, [fft fy]*4] $ circle [0,0] [fft fy] )  >> video;
step [1, 1, 1, 1, 0] (lfsaw (cps/4)) >> fdbk;
```
