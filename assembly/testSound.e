testSound       cp      play_sound_name     testSound_0
                call    play_sound          play_sound_ra
                be      testSound           1               0
testSound1      cp      play_sound_name     testSound_1  
                call    play_sound          play_sound_ra
                be      testSound1          1               0
testSound2      cp      play_sound_name     testSound_2   
                call    play_sound          play_sound_ra
                be      testSound2          1               0
testSound3      cp      play_sound_name     testSound_3   
                call    play_sound          play_sound_ra
                be      testSound3          1               0
testSound4      cp      play_sound_name     testSound_4   
                call    play_sound          play_sound_ra
                be      testSound4          1               0
testSound5      cp      play_sound_name     testSound_5   
                call    play_sound          play_sound_ra
                be      testSound5          1               0
testSound6      cp      play_sound_name     testSound_6   
                call    play_sound          play_sound_ra
                be      testSound6          1               1
                halt

#include play_sound.e
#include speaker.e
#include base_sample.e

testSound_0   .data   0
testSound_1   .data   1
testSound_2   .data   2
testSound_3   .data   3
testSound_4   .data   4
testSound_5   .data   5
testSound_6   .data   6
testSound_7   .data   7

