-- fmbass WIP
d1
    $ slow 2
    $ s "superfm"
    # octave 4
    # amp1 1
    # amp2 1
    # amp3 0
    # amp4 0
    # amp5 0
    # amp6 1
    # ratio2 2
    # ratio3 3
    # ratio4 4
    # ratio5 0.5
    # ratio6 0.25
    # feedback 1
    # mod11 1
    # mod16 1
    # mod66 1
    # mod23 1
    # mod34 1
    # mod45 1
    # eglevel62 0.1
    # eglevel63 1.5
    # egrate63 0.5 
    # verb 1 0.9 0.1 0.1
    
d2
    $ foldEvery [3,4] (|- n 3)
    $ (3 ~>)
    $ slow 2
    $ struct "t*2 ~"
    $ s "superfm"
    # legato "1 0.333 ~ ~"
    # n "1 4 ~ ~"
    # octave 4
    # amp1 1
    # amp2 1
    # amp3 0
    # amp4 0
    # amp5 0
    # amp6 1
    # ratio2 2
    # ratio3 3
    # ratio4 4
    # ratio5 0.5
    # ratio6 0.25
    # feedback 1
    # mod11 1
    # mod16 1
    # mod66 1
    # mod23 1
    # mod34 1
    # mod45 1
    # eglevel62 0.1
    # eglevel63 1.5
    # egrate63 0.5 
    # orbit 1
    
