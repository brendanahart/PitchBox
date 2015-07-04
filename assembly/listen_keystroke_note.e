//REQUIRES: return address is in listen_keystroke_note_ra. note_to_call = correct note on 1-7 (A-G) scale. guess_is_right is declared
//MODIFIES: keyboard_keypressed, keyboard_key, guess_is_right
//EFFECTS:  Only exits when a key with a value of 'A' - 'G' or 'a' - 'g' is pressed. keyboard_key will contain that keys ascii
//	value. guess_is_right will be 1 if it was the same as note_to_call. else 0.

//Code
listen_keystroke_note                       cp      listen_keystroke_replay                     listen_keystroke_note_zero
                                            call    keyboard                                    keyboard_ra

//Check if value pressed is SPACE
                                            bne     listen_keystroke_continue                   keyboard_key                listen_keystroke_space
                                            bne     listen_keystroke_continue                   keyboard_keypressed         listen_keystroke_note_one
                                            cp      listen_keystroke_replay                     listen_keystroke_note_one
                                            ret     listen_keystroke_note_ra

//Check if value pressed is outside A-G
listen_keystroke_continue                   blt     listen_keystroke_note                       keyboard_key                listen_keystroke_note_A  //If lower than A: Go to start
                                            blt     listen_keystroke_note_check_lowercase       listen_keystroke_note_G     keyboard_key             //Or greater than G: Go to  for lowercase
//Value is A-G. Convert to 1-7 then 
                                            sub     keyboard_key                                keyboard_key                listen_keystroke_note_A
                                            add     keyboard_key                                keyboard_key                listen_keystroke_note_one //Add 1 because of 1-7 representation
                                            be      listen_keystroke_note_check                 0                           0
//Check if value is outside a-g
listen_keystroke_note_check_lowercase       blt     listen_keystroke_note                       keyboard_key                listen_keystroke_note_a //If lower than a: Go to start
                                            blt     listen_keystroke_note                       listen_keystroke_note_g     keyboard_key            //If greater than g: Go to start
//Value is a-g. Convert to 1-7 then 
                                            sub     keyboard_key                                keyboard_key                listen_keystroke_note_a
                                            add     keyboard_key                                keyboard_key                listen_keystroke_note_one //Add 1 because of 1-7 representation
                                            be      listen_keystroke_note_check                 0                           0
//Check if guess was correct and key is pressed NOT released
listen_keystroke_note_check                 bne     listen_keystroke_note                       keyboard_keypressed         listen_keystroke_note_one                                  
                                            bne     listen_keystroke_note_incorrect             keyboard_key                note_to_call
                                            cp      guess_is_right                              listen_keystroke_note_one
                                            be      listen_keystroke_note_ret                   0                           0

listen_keystroke_note_incorrect             cp      guess_is_right                              listen_keystroke_note_zero

listen_keystroke_note_ret                   ret     listen_keystroke_note_ra

//Includes
//REMOVED#include                    keyboarddriver.e

//Data
listen_keystroke_note_ra    .data   0
listen_keystroke_note_zero  .data   0
listen_keystroke_note_one   .data   1
listen_keystroke_note_A     .data   65
listen_keystroke_note_G     .data   71
listen_keystroke_note_a     .data   97
listen_keystroke_note_g     .data   103
listen_keystroke_space      .data   32
listen_keystroke_replay     .data   0
