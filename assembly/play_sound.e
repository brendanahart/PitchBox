//inputs: (1) play_sound_name: the note to be played (1-7)
//        (2) play_sound_total_time (8000 = 1 second): time for sound to play

//Set time to zero
play_sound	        cp 	        play_sound_time		    play_sound_zero
//Get correct delta
                    cpfa        play_sound_delta        play_sound_deltas       play_sound_name
//Get correct time_delta
                    div         play_sound_time_delta   play_sound_8000         play_sound_delta
//Set i to zero, start loop
                    cp          play_sound_i            play_sound_zero
                    be          play_sound_next         0                       0
//If 8000 < i, set i to i - 8000
play_sound_reset    sub         play_sound_i            play_sound_i            play_sound_8000
//Add time delta to sound
                    add         play_sound_time         play_sound_time         play_sound_time_delta
play_sound_next     blt         play_sound_reset        play_sound_8000         play_sound_i
//Get next sample into speaker_sample
                    cpfa        speaker_sample          base_sample_sound       play_sound_i
            	    call        speaker                 speaker_ra
                    add         play_sound_i            play_sound_i            play_sound_delta
                    blt         play_sound_next         play_sound_time         play_sound_total_time
                    ret         play_sound_ra

play_sound_time		        .data       0
play_sound_time_delta       .data       0
play_sound_total_time	    .data       8000
play_sound_i                .data       0
play_sound_ra	            .data       0
play_sound_name	            .data       0
play_sound_zero             .data       0
play_sound_one              .data       1
play_sound_8000             .data       8000
play_sound_100000           .data       100000
play_sound_address          .data       base_sample_sound   //First address of base_sample
play_sound_address_end      .data       0
play_sound_delta            .data       1
play_sound_deltas           .data       0
                            .data       440 //A
                            .data       494 //B
                            .data       523 //C
                            .data       587 //D
                            .data       330 //E
                            .data       349 //F
                            .data       392 //G
