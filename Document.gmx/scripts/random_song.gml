if audio_is_playing(global.song) audio_stop_sound(global.song)

global.song = choose(
        mscHolland1945, mscLoveHurts, mscBadCase, 
        mscPururin, mscLoveIsFire, mscYouMakeMyDreams, 
        msc1985, mscHipToBeSquare, mscAi, mscAllIWantIsYou,
        mscAccidentallyInLove, mscSUNSHINE_FES,
        mscAishite, mscWeKnow, mscAllStar, mscHowWillIKnow,
        mscPlasticLove, mscSUPERSEX420, mscMusic, mscWish,
        mscDammit, mscAllTheSmallThings, mscPeopleWhoDied,
        mscAngelOfTheMorning, mscWalkingOnSunshine,
        mscFriday, mscGirlfriend, mscSk8erBoi, mscBlackSkinhead,
        mscBadMoonRising)
        
play_song(global.song)
