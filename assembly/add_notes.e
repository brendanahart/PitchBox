//input: (1) note_called (A-G) written as 1-7
//	 (2) note_correct 0 or 1 
//outputs: set x1,x2 for desired note based on column
		
add_note    cp          display_image_x         letter_loc_x
            cp          display_image_y         letter_loc_y    
            be 	add_A	note_called	one
            be 	add_B	note_called	two
            be 	add_C	note_called	three
            be 	add_D	note_called	four
            be 	add_E	note_called	five
            be 	add_F	note_called	six
            be 	add_G	note_called	seven
add_A       cp	vga_y1	A_y1
            cp	vga_y2	A_y2
            cp          display_image_image     zero
            be	check1	0	0
add_B       cp	vga_y1	B_y1
            cp	vga_y2	B_y2
            cp          display_image_image     one
            be	check1	0	0
add_C       cp	vga_y1	C_y1
            cp	vga_y2	C_y2
            cp          display_image_image     two
            be	check1	0	0
add_D       cp	vga_y1	D_y1
            cp	vga_y2	D_y2
            cp          display_image_image     three
            be	check1	0	0
add_E       cp	vga_y1	E_y1
            cp	vga_y2	E_y2
            cp          display_image_image     four
            be	check1	0	0
add_F       cp	vga_y1	F_y1
            cp	vga_y2	F_y2
            cp          display_image_image     five
            be	check1	0	0
add_G       cp	vga_y1	G_y1
            cp	vga_y2	G_y2
            cp          display_image_image     six
            be	check1	0	0
check1      be	red_note	note_correct	zero
            be	green_note	note_correct	one
red_note	cp	vga_color_write	note_red
            be 	check_j		0	0		
green_note	cp	vga_color_write	note_green				
            be	check_j		0	0
check_j		bne	continue_j	j	five
            cp	j	zero	
            cp	vga_color_write	blue
            cp	vga_x1	reset_x1
            cp	vga_x2	reset_x2
            cp	vga_y1	reset_y1
            cp	vga_y2	reset_y2	
            call	vga 	vga_ra
            cp	vga_color_write	white
            cp	vga_y1		line1_y1
            cp	vga_y2		line1_y2
            call	vga 	vga_ra
            cp	vga_y1		line2_y1
            cp	vga_y2		line2_y2
            call	vga 	vga_ra
            cp	vga_y1		line3_y1
            cp	vga_y2		line3_y2
            call	vga 	vga_ra
            cp	vga_y1		line4_y1
            cp	vga_y2		line4_y2
            call	vga 	vga_ra
            cp	vga_y1		line5_y1
            cp	vga_y2		line5_y2
            call	vga 	vga_ra
            be	add_note	0	0
continue_j	be	j_0	j	zero
		    be	j_1	j	one
		    be	j_2	j	two
		    be 	j_3	j	three
		    be	j_4	j	four	
j_0 		cp	vga_x1	j0_x1	
		    cp	vga_x2	j0_x2
		    be	increment_j	0	0
j_1 		cp	vga_x1	j1_x1
		    cp	vga_x2	j1_x2
		    be	increment_j	0	0
j_2 		cp	vga_x1	j2_x1
		    cp	vga_x2	j2_x2
		    be	increment_j	0	0
j_3 		cp	vga_x1	j3_x1
		    cp	vga_x2	j3_x2
		    be	increment_j	0	0
j_4 		cp	vga_x1	j4_x1
		    cp	vga_x2	j4_x2
		    be	increment_j	0	0
increment_j	add	j	j	one	
call_driver	call	vga 	vga_ra
            call        display_image           display_image_ra  
            ret	add_note_ra

two         .data   2	
three       .data   3
four        .data   4
five        .data   5
six         .data   6
seven       .data   7
eight       .data   8
add_note_ra	.data	0
note_white  .data   32767
note_red	.data	32008 //what color is red? 
note_green	.data	11111
x1	        .data	250
x2	        .data	290
j	        .data	0
A_y1	    .data	206
A_y2	    .data	246
B_y1	    .data	181
B_y2	    .data	221
C_y1	    .data	156
C_y2	    .data	196
D_y1	    .data	131
D_y2	    .data	171
E_y1	    .data	281
E_y2	    .data	321
F_y1	    .data	256
F_y2	    .data	296
G_y1	    .data	231
G_y2	    .data	271
j0_x1	    .data	190	
j0_x2	    .data	230
j1_x1	    .data	270		
j1_x2	    .data	310
j2_x1	    .data	350	
j2_x2	    .data	390
j3_x1	    .data	430	
j3_x2	    .data	470
j4_x1	    .data	510	
j4_x2	    .data	550
reset_x1    .data	170
reset_x2 	.data	570
reset_y1    .data	99
reset_y2    .data	323
note_called .data   0
note_correct    .data 0
letter_loc_x    .data 550  
letter_loc_y    .data 390

