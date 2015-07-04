//keyboard
//REQUIRES: computer-keyboard interface is idle
//MODIFIES: keyboard_keypressed, keyboard_key
//EFFECTS:  stores key and keypressed for up to one key at a time. a press returns 0 and a release returns 1

keyboard			
keyboard_wait1          bne keyboard_wait1      0x80000021 board_zero		//WAIT for RESPONSE to 0
                        cp  0x80000020          board_one					//COMMAND to 1
keyboard_wait2          bne keyboard_wait2      0x80000021 board_one		//WAIT for RESPONSE to 1

						cp  keyboard_key        0x80000023		    //PUT key in mem[key]
						cp  keyboard_keypressed 0x80000022	        //PUT keypressed
command_zero			cp  0x80000020          zero			    //COMMAND to 0
						ret keyboard_ra
			
board_one				.data 1
board_zero				.data 0
keyboard_keypressed		.data 0
keyboard_key			.data 0
keyboard_ra				.data 0
