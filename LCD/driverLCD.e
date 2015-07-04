driverLCD	cp		0x80000012 						lcd_x
			cp 		0x80000013 						lcd_y
			cp 		0x80000014 						lcd_ascii		
			cp		0x80000010 						lcd_one
waitc		bne		waitc			0x80000011		lcd_one
			cp  	0x80000010 		lcd_zero 
waitr		bne		waitr 			0x80000011		lcd_zero
			ret		lcd_ra	
			
			 
lcd_one   .data 1 
lcd_zero  .data 0 
lcd_x	  .data 8
lcd_y	  .data 7
lcd_ascii .data 0
lcd_ra	  .data	0
