//INPUTS:   SD_write is 0 for read and 1 for write
//          SD_address is address to be read/wrote from
//          SD_data_write is data to be written (if writing)
//OUTPUTS:  SD_data_read contains data read from SD_data_address

SD      	cp  	0x80000080 						SD_zero 			// Set Command to 0
			cp		0x80000082 						SD_write			// Set SD Write To Write
			cp 		0x80000083						SD_address			// Read in Command Parameters 
			cp		0x80000084						SD_data_write
			cp		0x80000080						SD_one				// Set Command to 1 
SD_waitc	bne		SD_waitc		0x80000081		SD_one				// Wait to Set Response to One
			be		SD_end			SD_one			SD_write
			cp		SD_data_read					0x80000085								
SD_end		cp  	0x80000080 						SD_zero 			// Set Command to 0
SD_waitr	bne		SD_waitr 		0x80000081		SD_zero				// Wait to Set Response to Zero 
			ret		SD_ra												// Return 
			
			 
SD_one   				.data 1 
SD_zero  				.data 0 
SD_write				.data 1
SD_address				.data 0
SD_data_write			.data 0
SD_data_read			.data 0
SD_ra					.data 0

