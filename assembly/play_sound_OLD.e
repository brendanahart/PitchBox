//inputs: (1) play_sound_name: the note to be played (0-6)
//        (2) play_sound_total_time: can change if needed

play_sound	        cp 	        play_sound_time		    play_sound_zero
//Get correct length
                    cpfa        speaker_length          play_sound_store_size   play_sound_name
                    cpfa        speaker_length          0                       speaker_length
//Get correct sound addresses into play_sound_address
                    cpfa        speaker_noise           play_sound_store        play_sound_name
//Begin sound playing loop
play_sound_again    call	    speaker		            speaker_ra
//Every period (of length
            	    add	        play_sound_time		    play_sound_time		    play_sound_one
                    bne 	    play_sound_again   	    play_sound_time 		play_sound_total_time
		            ret	        play_sound_ra

play_sound_time		        .data		0
play_sound_total_time	    .data 		500
play_sound_ra	            .data		0
play_sound_name	            .data       0
play_sound_zero             .data       0
play_sound_one              .data       1
play_sound_sound            .data       0
play_sound_address          .data       0
play_sound_address_i        .data       0
play_sound_address_end      .data       0
play_sound_store            .data       A4_sound //0
                            .data       B4_sound //1
                            .data       C4_sound //2
                            .data       D4_sound //3
                            .data       E4_sound //4
                            .data       F4_sound //5
                            .data       G4_sound //6
play_sound_store_size       .data       A4_size
                            .data       B4_size
                            .data       C4_size
                            .data       D4_size
                            .data       E4_size
                            .data       F4_size
                            .data       G4_size
