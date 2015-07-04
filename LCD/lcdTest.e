lcd_check		bne		loop_body		test_increment		lcd_ascii_size
				cp		test_increment	test_zero
				cp		lcd_x_test		test_zero
				cp		lcd_y_test		test_zero
				halt
loop_body		cp		lcd_x			lcd_x_test
				cp		lcd_y			lcd_y_test
				cpfa	lcd_ascii		lcd_ascii_array		test_increment
				call	driverLCD		lcd_ra				
				add		lcd_x_test		test_one			lcd_x_test
				add		test_increment	test_one			test_increment
				be		lcd_check		test_zero			test_zero		


#include driverLCD.e

lcd_x_test		.data 0
lcd_y_test		.data 0
lcd_ascii_array .data 98
				.data 114
				.data 101
				.data 110
				.data 100
				.data 97
				.data 110
test_one		.data 1
test_zero		.data 0
lcd_ascii_size	.data 7
test_increment	.data 0
