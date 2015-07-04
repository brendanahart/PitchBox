listen_keystroke_player
key_start_player        call        keyboard           keyboard_ra 
                        bne         key_start_player   keyboard_keypressed      key_one
                        be          key_one_player      keyboard_key             key_num_one
                        be          key_two_player      keyboard_key             key_num_zero
                        be          key_start_player    0                       0
key_one_player          cp          bool_players        one 
                        be          key_stuff_end       0               0
key_two_player          cp          bool_players        two
                        be          key_stuff_end       0               0
key_stuff_end           ret         key_start_player_ra

key_num_one .data   49
key_num_zero .data  50
bool_players    .data   1000
key_start_player_ra .data   0
