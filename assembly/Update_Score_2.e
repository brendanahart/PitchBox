//removes old score and adds new number 
//once score reaches 10 game is over handles that too 


update_score2	add	score2		score2		one
	cp	vga_color_write		blue
	cp	vga_x1		replace_x1b
	cp	vga_x2		replace_x2b
	cp	vga_y1		replace_y1b
	cp	vga_y2		replace_y2b
	call	vga 	vga_ra
	cp	vga_color_write	yellow
	be	s_oneb		score2	one
	be	s_twob		score2	two
	be	s_threeb	score2	three
	be	s_fourb		score2	four
	be	s_fiveb		score2	five
	be	s_sixb		score2	six
	be	s_sevenb		score2	seven
	be	s_eightb		score2	eight
	be	s_nineb		score2	nine
	be	s_tenb		score2	ten

s_oneb   call	score_line1b	score_ra
	call	score_line2b	score_ra	
	be	done_scoreb	0	0
s_twob	call	score_line5b	score_ra
	call	score_line3b	score_ra
	call	score_line6b	score_ra
	call	score_line2b	score_ra
	call	score_line7b	score_ra
	be	done_scoreb	0	0
s_threeb	call	score_line5b	score_ra
	call	score_line3b	score_ra
	call	score_line6b	score_ra
	call	score_line4b	score_ra
	call	score_line7b	score_ra
	be	done_scoreb	0	0
s_fourb	call	score_line1b	score_ra
	call	score_line3b	score_ra
	call	score_line6b	score_ra
	call	score_line4b	score_ra
	be	done_scoreb	0	0
s_fiveb	call	score_line5b	score_ra
	call	score_line1b	score_ra
	call	score_line6b	score_ra
	call	score_line4b	score_ra
	call	score_line7b	score_ra
	be	done_scoreb	0	0
s_sixb	call	score_line5b	score_ra
	call	score_line1b	score_ra
	call	score_line6b	score_ra
	call	score_line4b	score_ra
	call	score_line7b	score_ra
	call	score_line2b	score_ra
	be	done_scoreb	0	0
s_sevenb	call	score_line5b	score_ra
	call	score_line3b	score_ra
	call	score_line4b	score_ra
	be	done_scoreb	0	0
s_eightb	call	score_line1b	score_ra
	call	score_line2b	score_ra
	call	score_line3b	score_ra
	call	score_line4b	score_ra
	call	score_line5b	score_ra
	call	score_line6b	score_ra
	call	score_line7b	score_ra
	be	done_scoreb	0	0
s_nineb	call	score_line1b	score_ra
	call	score_line3b	score_ra
	call	score_line4b	score_ra
	call	score_line5b	score_ra
	call	score_line6b	score_ra
	be	done_scoreb	0	0
s_tenb	call	score_line1b	score_ra
	call	score_line2b	score_ra
	call	score_line3b	score_ra
	call	score_line4b	score_ra
	cp	vga_x1		pos10b
	cp	vga_x2		pos11b
	cp	vga_y1		pos1b
	cp	vga_y2		pos2b
	call	vga 	vga_ra
	cp	vga_x1		pos10b
	cp	vga_x2		pos11b
	cp	vga_y1		pos5b
	cp	vga_y2		pos6b
	call	vga 	vga_ra
	cp	vga_x1		pos11b
	cp	vga_x2		pos12b
	cp	vga_y1		pos1b
	cp	vga_y2		pos3b
	call	vga 	vga_ra
	cp	vga_x1		pos11b
	cp	vga_x2		pos12b
	cp	vga_y1		pos4b
	cp	vga_y2		pos5b
	call	vga 	vga_ra
    cp      player_who_wins     one
	be	end_game	0	0

done_scoreb		ret	update_score_ra2
score2	.data	0
update_score_ra2	.data	0
replace_x1b	.data	230
replace_x2b	.data	400
replace_y1b	.data	330
replace_y2b	.data	398
pos1b	.data	340
pos2b	.data	342
pos3b	.data	368
pos4b	.data	370
pos5b	.data	396
pos6b	.data	398
pos7b	.data	250
pos8b	.data	252
pos9b	.data	278
pos10b	.data	280
pos11b	.data	308
pos12b	.data	310
//individual functions to draw each section of lines
score_line1b	cp	vga_x1		pos7b
		cp	vga_x2		pos8b
		cp	vga_y1		pos1b
		cp	vga_y2		pos3b
	    call	vga 	vga_ra
		ret	score_ra
score_line2b	cp	vga_x1		pos7b
		cp	vga_x2		pos8b
		cp	vga_y1		pos4b
		cp	vga_y2		pos5b
	    call	vga 	vga_ra
		ret	score_ra
score_line3b	cp	vga_x1		pos9b
		cp	vga_x2		pos10b
		cp	vga_y1		pos1b
		cp	vga_y2		pos3b
	    call	vga 	vga_ra
		ret	score_ra
score_line4b	cp	vga_x1		pos9b
		cp	vga_x2		pos10b
		cp	vga_y1		pos4b
		cp	vga_y2		pos5b
	    call	vga 	vga_ra
		ret	score_ra
score_line5b	cp	vga_x1		pos8b
		cp	vga_x2		pos9b
		cp	vga_y1		pos1b
		cp	vga_y2		pos2b
	    call	vga 	vga_ra
		ret	score_ra
score_line6b	cp	vga_x1		pos8b
		cp	vga_x2		pos9b
		cp	vga_y1		pos3b
		cp	vga_y2		pos4b
	    call	vga 	vga_ra
		ret	score_ra
score_line7b	cp	vga_x1		pos8b
		cp	vga_x2		pos9b
		cp	vga_y1		pos5b
		cp	vga_y2		pos6b
	    call	vga 	vga_ra
		ret	score_ra
	
