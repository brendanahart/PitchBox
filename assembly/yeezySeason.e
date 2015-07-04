// REQUIRES: none
// MODIFIES: vga 
// EFFECTS: moves a character down or up on the vga screen according to if a note was wrong or right

yeezySeason			be		moveKanyeUp			jumpDownUp			one_yeezus

moveKanyeDown		be		yeezyOver			yeezusLowerLim		yeezus_god_y
					add		yeezus_god_y		yeezus_god_y		jumpAbility_yeezus
					cp	    vga_color_write		blue_yeezus
		        	cp	    vga_x1		    	zero_yeezus
		        	cp	    vga_y1		    	zero_yeezus
		        	cp	    vga_x2		    	x_end_yeezus
		        	cp	    vga_y2		    	y_end_yeezus
		        	call	vga     	    	vga_ra
					be		yeezyOver			zero_yeezus			zero_yeezus

moveKanyeUp			be		yeezyOver			yeezusUpperLim		yeezus_god_y
					sub		yeezus_god_y		yeezus_god_y		jumpAbility_yeezus
					cp	    vga_color_write		blue_yeezus
		        	cp	    vga_x1		    	zero_yeezus
		        	cp	    vga_y1		    	zero_yeezus
		        	cp	    vga_x2		    	x_end_yeezus
		        	cp	    vga_y2		    	y_end_yeezus
		        	call	vga     	    	vga_ra
					be		yeezyOver			zero_yeezus			zero_yeezus

yeezyOver			ret		yeezySeason_ra	

yeezus_god_y		.data 260
yeezus_x 			.data 10 
jumpDownUp			.data 0
yeezySeason_ra		.data 0        
jumpAbility_yeezus	.data 50
yeezusUpperLim		.data 60
yeezusLowerLim		.data 260
blue_yeezus	    	.data 828
zero_yeezus			.data 0
x_end_yeezus		.data 40
y_end_yeezus		.data 330
one_yeezus			.data 1







