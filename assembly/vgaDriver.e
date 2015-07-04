vga	        cp  	0x80000060 						vga_zero 			// Set Command to 0
			cp		0x80000062 						vga_write			// Set VGA Write To Write
			cp 		0x80000063						vga_x1				// Read in Command Parameters 
			cp		0x80000064						vga_y1
			cp		0x80000065						vga_x2
			cp		0x80000066						vga_y2
			cp		0x80000067 						vga_color_write
			cp		0x80000060						vga_one				// Set Command to 1 
waitc		bne		waitc			0x80000061		vga_one				// Wait to Set Response to One
			be		vga_end			vga_one			vga_write
			cp		vga_color_read					0x80000068								
vga_end		cp  	0x80000060 						vga_zero 			// Set Command to 0
waitr		bne		waitr 			0x80000061		vga_zero			// Wait to Set Response to Zero 
			ret		vga_ra												// Return 
			
			 
vga_one   				.data 1 
vga_zero  				.data 0 
vga_x1					.data 0
vga_y1					.data 0
vga_x2					.data 0
vga_y2					.data 0 
vga_color_write			.data 0
vga_color_read			.data 0 
vga_ra					.data 0
vga_write				.data 1
