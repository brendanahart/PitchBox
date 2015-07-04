//REQUIRES: return address is in listen_keystroke_any_ra
//MODIFIES: keyboard_keypressed, keyboard_key
//EFFECTS:  Only exits when a key is pressed. keyboard_key will contain the most recently pushed key.

//Code
listen_keystroke_any
key_start           call       keyboard           keyboard_ra
                    bne        key_start          keyboard_keypressed       key_one			//Back to start if no key was pressed
                    bne        key_start          keyboard_key              key_enter 
                    ret        listen_keystroke_any_ra                        

//Data
listen_keystroke_any_ra     .data   0
key_one                     .data   1
key_enter                   .data   10


