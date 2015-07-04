//keyboardtest
                    cp      i               zero								//Reset i

start               call    keyboard        keyboard_ra

cont                bne     start           keyboard_keypressed     one			//Back to start if no key was pressed
store               cpta    keyboard_key    userPass                i
                    cp      temp1           keyboard_key
                    cpfa    temp2           pass                    i
                    bne     fail            temp1                   temp2
                    be      chk             1                       1
increment           add     i               i                       one
reloop              be      start           1                       1			//Back to start


fail				call    ledROnAll       ledROnAll_ra
                    halt
chk					be      succeed         passlength i
                    be      increment       1                       1	
succeed			    call    ledGOnAll       ledGOnAll_ra
					halt
s

//REMOVED#include keyboarddriver.e
//REMOVED#include ledswitch.e
temp1					    .data 0
temp2					    .data 0
i							.data 0
redOn					    .data 262143
greenOn				        .data 255
twentyseven		            .data 27
ledRadd				        .data 0x80000001
passlength		            .data 11
pass					    .data 74					        //Justin Rules
							.data 117
							.data 115
							.data 116
							.data 105
							.data 110
							.data 32
							.data 82
							.data 117
							.data 108
							.data 101
							.data 115
userPass			.data 0
							.data 0
							.data 0
							.data 0
							.data 0
							.data 0
							.data 0
							.data 0
							.data 0
							.data 0
							.data 0
							.data 0
