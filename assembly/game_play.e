//SINGLEPLAYER VERSION OF THE GAME
//(0) Screen that does initial display
start      call     display_game                display_game_ra
           cp	    display_image_x		        line_x1
	       cp	    display_image_y		        line1_y1
	       cp	    display_image_image	        game_clef
	       call	    display_image		        display_image_ra
           cp       j                           zero
          cp        yeezus_god_y              yeezusLowerLim
          //play sound first! 
           cp       note_called                 five
           call     add_note                    add_note_ra
           cp       play_sound_name             five
           call     play_sound                  play_sound_ra

           cp       note_called                 six
           call     add_note                    add_note_ra
           cp       play_sound_name             six
           call     play_sound                  play_sound_ra

           cp       note_called                 seven
           call     add_note                    add_note_ra
           cp       play_sound_name             seven
           call     play_sound                  play_sound_ra

           cp       note_called                 one
           call     add_note                    add_note_ra
           cp       play_sound_name             one
           call     play_sound                  play_sound_ra

           cp       note_called                 two
           call     add_note                    add_note_ra
           cp       play_sound_name             two
           call     play_sound                  play_sound_ra

           cp       note_called                 three  
           cp       note_correct                one
           call     add_note                    add_note_ra
           cp       play_sound_name             three
           call     play_sound                  play_sound_ra

           cp       note_called                 four
           call     add_note                    add_note_ra
           cp       play_sound_name             four
           call     play_sound                  play_sound_ra

//(1) Call Pixel/Pixel display function to show to start game page
	        cp	    display_image_x		        game_zero
            cp	    display_image_y		        game_zero
            cp	    display_image_image	        game_startscreen
            call	display_image		        display_image_ra
            cp      score                       zero
            cp      score2                      zero
            cp      j                           zero
//(2) Wait for keyboard input
            call	listen_keystroke_any	    listen_keystroke_any_ra
//(2.5) Ask how many players will be playing
            //background screen for choosing players
	        cp	    display_image_x		        game_zero
            cp	    display_image_y		        game_zero
            cp	    display_image_image	        game_player_chose_screen
            call	display_image		        display_image_ra
            call    listen_keystroke_player      key_start_player_ra
            be      multiplayer_version         bool_players            two            
//(3) GAME_PLAY:
    //(a) Display background screen
            call    display_game                display_game_ra  
    //show clef picture
            cp	    display_image_x		        line_x1
            cp	    display_image_y		        line1_y1
            cp	    display_image_image	        game_clef
            call	display_image		        display_image_ra
next_note   call    random_generator            gen_rand_num_ra	
            cp      note_to_call                num_random  //note_to_call stores 1-7
            cp      play_sound_name             note_to_call
replay_note call    play_sound                  play_sound_ra

	// show kanye 
			cp 		display_image_x				yeezus_x
			cp 		display_image_y				yeezus_god_y
			cp		display_image_image			ye
			call	display_image				display_image_ra

 //(d) Wait for keyboard input (A-G)
step_d	 call	listen_keystroke_note		listen_keystroke_note_ra
         be   replay_note             listen_keystroke_replay     one

    //(e) Display red/green note accordingly and corresponding letter
            cp      note_called     note_to_call
            cp      note_correct    guess_is_right
            call    add_note        add_note_ra

	//(e.1) Update Kanye Position
			cp		jumpDownUp					guess_is_right
			call	yeezySeason					yeezySeason_ra
 
			cp 		display_image_x				yeezus_x
			cp 		display_image_y				yeezus_god_y
			cp		display_image_image			ye
			call	display_image				display_image_ra
            
//include the letters somehow
    //(f) Update Score
                        bne      skip_update_score      guess_is_right      one
                        call     update_score           update_score_ra
skip_update_score       be       next_note              0                   0
 //(4) End Game
//show final screen
end_game	            cp	    display_image_x		    zero
	                    cp	    display_image_y		    zero
                        be      single_player_wins      bool_players            one
                        be      multi_two_wins          player_who_wins         two

multi_one_wins          cp	    display_image_image	    p1_is_winner
	                    call	display_image		    display_image_ra
                        be      wait_start_over         0           0

multi_two_wins          cp	    display_image_image	    p2_is_winner
	                    call	display_image		    display_image_ra
                        be      wait_start_over         0           0

single_player_wins      cp	    display_image_image	    game_endscreen
	                    call	display_image		    display_image_ra
                        be      wait_start_over         0           0

//wait for anyinput 
wait_start_over
	call	listen_keystroke_any	listen_keystroke_any_ra
	be	start	0	0






//MULTIPLAYER VERSION OF THE GAME 
multiplayer_version
  //(a) Display background screen
            call    display_game                display_game_ra  
            cp      current_player              one //we start with player one 
  //add two score images
            cp      vga_x1                  zero
            cp      vga_x2                  blue_end
            cp      vga_y1                  new_stuff1
            cp      vga_y2                  new_stuff2
            cp      vga_color_write         blue    
            call    vga     vga_ra

            cp      display_image_x             zero
            cp      display_image_y             score_pos_p1
            cp	    display_image_image	        hi_data
            call	display_image		        display_image_ra

            cp      display_image_x             zero
            cp      display_image_y             score_pos_p2
            cp	    display_image_image	        hi2_data
            call	display_image		        display_image_ra

    //sign displaying whos turn it is :) 
            cp      display_image_x             turn_signx1
            cp      display_image_y             turn_signy1
            cp	    display_image_image	        p1_turn_sign
            call	display_image		        display_image_ra
    //show clef picture
            cp	    display_image_x		        line_x1
            cp	    display_image_y		        line1_y1
            cp	    display_image_image	        game_clef
            call	display_image		        display_image_ra
multi_next  call    random_generator            gen_rand_num_ra	
            cp      note_to_call                num_random  //note_to_call stores 1-7
            cp      play_sound_name             note_to_call
mult_replay_note call    play_sound                  play_sound_ra

 //(d) Wait for keyboard input (A-G)
step_e	 call	listen_keystroke_note		listen_keystroke_note_ra
         be   mult_replay_note             listen_keystroke_replay     one
    //(e) Display red/green note accordingly and corresponding letter
            cp      note_called     note_to_call
            cp      note_correct    guess_is_right
            call    add_note        add_note_ra

 //(f) Update Score
    be     update_player_score   guess_is_right     one //if the guess is correct
    be     switch_player        0   0       //otherwise switch the player
update_player_score
    be     update_one_score      player_one_turn     one
    be     update_two_score      0                   0

update_one_score call  update_score2   update_score_ra2
    be      switch_player        0   0
update_two_score call  update_score   update_score_ra

switch_player
    be      p2_time         player_one_turn     one //if its p1 switch to p2
    be      p1_time         player_one_turn     zero //if its p2 switch to p1

p1_time
    cp     player_one_turn    one
//clear top screen part
            cp      vga_x1                  rainbowx1
            cp      vga_x2                  rainbowx2
            cp      vga_y1                  rainbowy1
            cp      vga_y2                  rainbowy2
            cp      vga_color_write         blue    
            call    vga     vga_ra

           cp      display_image_x               turn_signx1
            cp      display_image_y             turn_signy1
            cp	    display_image_image	        p1_turn_sign
            call	display_image		        display_image_ra
            be       multi_next              0                   0
p2_time
    cp     player_one_turn    zero
//clear top screen
            cp      vga_x1                  rainbowx1
            cp      vga_x2                  rainbowx2
            cp      vga_y1                  rainbowy1
            cp      vga_y2                  rainbowy2
            cp      vga_color_write         blue    
            call    vga     vga_ra

            cp      display_image_x             turn_signx1
            cp      display_image_y             turn_signy1
            cp	    display_image_image	        p2_turn_sign
            call	display_image		        display_image_ra
            be      multi_next              0                   0

game_startscreen    .data   7
game_clef           .data   8
game_endscreen      .data   9
game_zero           .data   0
note_to_call        .data   0
guess_is_right      .data   0
game_player_chose_screen    .data   10
player_one_turn     .data       1
score_pos_p1        .data   410
score_pos_p2        .data   340
hi_data             .data   14
hi2_data            .data   13
blue_end            .data   300
new_stuff1          .data   330
new_stuff2          .data   480
turn_signx1         .data   220
turn_signy1         .data   10    
p1_turn_sign        .data   15
p2_turn_sign        .data   16
current_player      .data   0
rainbowx1           .data   220
rainbowx2           .data   420
rainbowy1           .data   10
rainbowy2           .data   80
p1_is_winner        .data   11
p2_is_winner        .data   12
player_who_wins     .data   1000
ye					.data	17



#include display_image.e
#include vgaDriver.e
#include SDDriver.e
#include listen_keystroke_any.e
#include display_game.e
#include keyboarddriver.e
#include random_generator.e
#include speaker.e
#include listen_keystroke_note.e
#include add_notes.e
#include UpdateScore.e
#include play_sound.e
#include base_sample.e
#include listen_keystroke_player.e
#include Update_Score_2.e
#include yeezySeason.e





