initialize		cp		vga_x1				vga_test_x1
				cp		vga_x2				vga_bound_x
				cp		vga_y1				vga_test_y1
				cp		vga_y2				vga_bound_y
				cp		vga_color_write		vga_initial
				call	vga     			vga_ra
				
vga_loop_check	bne		vga_loop_body		vga_color_size		increment
				cp		increment			vga_test_zero
				cp		vga_x1				vga_test_zero
				cp		vga_x2				vga_test_zero
				cp		vga_y1				vga_test_zero
				cp		vga_y2				vga_test_zero
				halt
vga_loop_body	cp		vga_x1				vga_test_x1
				cp		vga_x2				vga_test_x2
				cp		vga_y1				vga_test_y1
				cp		vga_y2				vga_test_y2
				cpfa	vga_color_write		vga_color_values	increment	
				call	vga			        vga_ra
				add		vga_test_x1			fitty_eight			vga_test_x1
				add		vga_test_x2			fitty_eight			vga_test_x2			
				add		increment			vga_test_one		increment
				be		vga_loop_check		vga_test_zero		vga_test_zero
				

//REMOVED#include vgaDriver.e 

vga_test_x1			.data 0 
vga_test_y1			.data 0 
vga_test_x2			.data 58
vga_test_y2			.data 479
vga_bound_x			.data 639
vga_bound_y			.data 479
vga_initial			.data 32767
vga_color_values 	.data 32767
					.data 6142
					.data 32767
					.data 12267
					.data 6142
					.data 32767
					.data 12267
					.data 6142
					.data 32767
					.data 6142
					.data 12267
vga_color_size   	.data 11
increment			.data 0
fitty_eight			.data 58
vga_test_one		.data 1
vga_test_zero		.data 0



