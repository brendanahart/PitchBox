//REQUIRES: mem[speaker_sample] = the sample to be played
//EFFECTS:  plays mem[speaker_sample] through speakers for one period 

speaker         cp      0x80000040              speaker_zero                        //Command to 0
                cp  	0x80000042		        speaker_sample                      //Load sample
                cp		0x80000040		        speaker_one                         //Command to 1
speaker_wait    bne		speaker_wait 	        0x80000041	        speaker_one     //Wait response 1
                cp      0x80000040              speaker_zero                        //Command to 0
speaker_wait2   bne     speaker_wait2           0x80000041          speaker_zero    //Wait response to 0

//Ret
speaker_stop	ret		speaker_ra

speaker_zero		.data		0
speaker_one			.data		1
speaker_ra		    .data		0
speaker_sample      .data       0
