//removes old score and adds new number 
//once score reaches 10 game is over handles that too 


update_score	add	score		score		one
	cp	vga_color_write		blue
	cp	vga_x1		replace_x1
	cp	vga_x2		replace_x2
	cp	vga_y1		replace_y1
	cp	vga_y2		replace_y2
	call	vga 	vga_ra
	cp	vga_color_write	yellow
	be	s_one		score	one
	be	s_two		score	two
	be	s_three		score	three
	be	s_four		score	four
	be	s_five		score	five
	be	s_six		score	six
	be	s_seven		score	seven
	be	s_eight		score	eight
	be	s_nine		score	nine
	be	s_ten		score	ten

s_one   call	score_line1	score_ra
	call	score_line2	score_ra	
	be	done_score	0	0
s_two	call	score_line5	score_ra
	call	score_line3	score_ra
	call	score_line6	score_ra
	call	score_line2	score_ra
	call	score_line7	score_ra
	be	done_score	0	0
s_three	call	score_line5	score_ra
	call	score_line3	score_ra
	call	score_line6	score_ra
	call	score_line4	score_ra
	call	score_line7	score_ra
	be	done_score	0	0
s_four	call	score_line1	score_ra
	call	score_line3	score_ra
	call	score_line6	score_ra
	call	score_line4	score_ra
	be	done_score	0	0
s_five	call	score_line5	score_ra
	call	score_line1	score_ra
	call	score_line6	score_ra
	call	score_line4	score_ra
	call	score_line7	score_ra
	be	done_score	0	0
s_six	call	score_line5	score_ra
	call	score_line1	score_ra
	call	score_line6	score_ra
	call	score_line4	score_ra
	call	score_line7	score_ra
	call	score_line2	score_ra
	be	done_score	0	0
s_seven	call	score_line5	score_ra
	call	score_line3	score_ra
	call	score_line4	score_ra
	be	done_score	0	0
s_eight	call	score_line1	score_ra
	call	score_line2	score_ra
	call	score_line3	score_ra
	call	score_line4	score_ra
	call	score_line5	score_ra
	call	score_line6	score_ra
	call	score_line7	score_ra
	be	done_score	0	0
s_nine	call	score_line1	score_ra
	call	score_line3	score_ra
	call	score_line4	score_ra
	call	score_line5	score_ra
	call	score_line6	score_ra
	be	done_score	0	0
s_ten	call	score_line1	score_ra
	call	score_line2	score_ra
	call	score_line3	score_ra
	call	score_line4	score_ra
	cp	vga_x1		pos10
	cp	vga_x2		pos11
	cp	vga_y1		pos1
	cp	vga_y2		pos2
	call	vga 	vga_ra
	cp	vga_x1		pos10
	cp	vga_x2		pos11
	cp	vga_y1		pos5
	cp	vga_y2		pos6
	call	vga 	vga_ra
	cp	vga_x1		pos11
	cp	vga_x2		pos12
	cp	vga_y1		pos1
	cp	vga_y2		pos3
	call	vga 	vga_ra
	cp	vga_x1		pos11
	cp	vga_x2		pos12
	cp	vga_y1		pos4
	cp	vga_y2		pos5
	call	vga 	vga_ra
    cp      player_who_wins     two
	be	end_game	0	0

done_score		ret	update_score_ra
score	.data	0
yellow	.data	31488
update_score_ra	.data	0
score_ra	.data	0
replace_x1	.data	230
replace_x2	.data	400
replace_y1	.data	400
replace_y2	.data	470
pos1	.data	410
pos2	.data	412
pos3	.data	438
pos4	.data	440
pos5	.data	466
pos6	.data	468
pos7	.data	250
pos8	.data	252
pos9	.data	278
pos10	.data	280
pos11	.data	308
pos12	.data	310
nine    .data   9
ten     .data   10
//individual functions to draw each section of lines
score_line1	cp	vga_x1		pos7
		cp	vga_x2		pos8
		cp	vga_y1		pos1
		cp	vga_y2		pos3
	    call	vga 	vga_ra
		ret	score_ra
score_line2	cp	vga_x1		pos7
		cp	vga_x2		pos8
		cp	vga_y1		pos4
		cp	vga_y2		pos5
	    call	vga 	vga_ra
		ret	score_ra
score_line3	cp	vga_x1		pos9
		cp	vga_x2		pos10
		cp	vga_y1		pos1
		cp	vga_y2		pos3
	    call	vga 	vga_ra
		ret	score_ra
score_line4	cp	vga_x1		pos9
		cp	vga_x2		pos10
		cp	vga_y1		pos4
		cp	vga_y2		pos5
	    call	vga 	vga_ra
		ret	score_ra
score_line5	cp	vga_x1		pos8
		cp	vga_x2		pos9
		cp	vga_y1		pos1
		cp	vga_y2		pos2
	    call	vga 	vga_ra
		ret	score_ra
score_line6	cp	vga_x1		pos8
		cp	vga_x2		pos9
		cp	vga_y1		pos3
		cp	vga_y2		pos4
	    call	vga 	vga_ra
		ret	score_ra
score_line7	cp	vga_x1		pos8
		cp	vga_x2		pos9
		cp	vga_y1		pos5
		cp	vga_y2		pos6
	    call	vga 	vga_ra
		ret	score_ra
	
