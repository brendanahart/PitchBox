//REQUIRES: Is given:   X and Y location of top left corner
//                      Image array location
//          Image is greater than 0 pixels
//MODIFIES: VGA display
//EFFECTS:  Displays image to VGA at given x and y location from
//          top left corner.

//INPUT:    display_image_image:    # of image in array of images
//          display_image_x:        x location of top left of image
//          display_image_y:        y location of top left of image
//          display_image_ra:       return address
            //NOTE: 1st pixel is location (0, 0) top left

//OUTPUT:   image is displayed to VGA

//NOTE: Potential optimization. Replace the call in the loop with a ret. Set vga_ra before the loop.
//      We can do this because the return address does not change

//Get image width and height from array
display_image           cpfa                display_image_width     display_image_image_w   display_image_image
                        cpfa                display_image_height    display_image_image_h   display_image_image
//Import correct image address
                        cpfa                display_image_image     display_image_image_loc display_image_image

//Calculate image length (final mem location of image) and store necessary vars
                        mult                display_image_length    display_image_width     display_image_height
                        add                 display_image_length    display_image_length    display_image_image
//Initialize first-column var
                        cp                  display_image_xstart    display_image_x
//Set width equal to last column of pixels to be displayed
                        add                 display_image_width     display_image_width     display_image_xstart
//Set height equal to last row of pixels to be displayed
                        add                 display_image_height    display_image_height    display_image_y


//Begin loop to display each pixel (end loop when i = length)
//Set pixel location
display_image_loop      cp                  vga_x1                  display_image_x
                        cp                  vga_x2                  display_image_x
                        cp                  vga_y1                  display_image_y
                        cp                  vga_y2                  display_image_y
//Get pixel data from SD
                        cp                  SD_write                display_image_zero
                        cp                  SD_address              display_image_image
                        call                SD                      SD_ra
//Set pixel color
                        cp                  vga_color_write         SD_data_read
                        be                  display_image_iterate   vga_color_write         display_image_zero //If color = 0, skip to iterate
                        call                vga                     vga_ra
//Iterate display_image_x, display_image_image
display_image_iterate   add                 display_image_x         display_image_x         display_image_one
                        add                 display_image_image     display_image_image     display_image_one

//Check if display_image_y should be iterated (next line of pixels)
                        bne                 display_image_reloop    display_image_x         display_image_width
                        add                 display_image_y         display_image_y         display_image_one
                        cp                  display_image_x         display_image_xstart
//Check and Reloop (end loop when i = length)
display_image_reloop    bne                 display_image_loop      display_image_image         display_image_length

//Reset display_image_image to 0 and return
                        cp                  display_image_image         display_image_zero
                        ret                 display_image_ra

display_image_zero      .data               0
display_image_one       .data               1
display_image_width     .data               0
display_image_height    .data               0
display_image_length    .data               0
display_image_xstart    .data               0
display_image_x         .data               0
display_image_y         .data               0
display_image_ra        .data               0
display_image_image     .data               0
display_image_color     .data               0
display_image_image_loc .data               0       //A - 0
                        .data               8100    //B - 1
                        .data               16200   //C - 2
                        .data               24300   //D - 3
                        .data               32400   //E - 4
                        .data               40500   //F - 5
                        .data               48600   //G - 6
                        .data               56700   //Start - 7
                        .data               363900  //Clef - 8
                        .data               383900  //End - 9
                        .data               691100  //Choose num players - 10
                        .data               998300  //Player 1 wins - 11
                        .data               1305500 //Player 2 wins - 12
                        .data               1612700 //Player 1 score - 13
                        .data               1626700 //Player 2 score - 14
                        .data               1640700 //Player 1 turn - 15
                        .data               1654700 //Player 2 turn - 16
						.data				1668700 //Ye - 17
display_image_image_h   .data               90  //A
                        .data               90  //B
                        .data               90  //C
                        .data               90  //D
                        .data               90  //E
                        .data               90  //F
                        .data               90  //G
                        .data               480 //Start
                        .data               200 //Clef
                        .data               480 //End
                        .data               480 //Choose num players
                        .data               480 //Player 1 wins
                        .data               480 //Player 2 wins
                        .data               70  //Player 1 score
                        .data               70  //Player 2 score
                        .data               70  //Player 1 turn
                        .data               70  //Player 2 turn
						.data				40	// Ye
display_image_image_w   .data               90  //A
                        .data               90  //B
                        .data               90  //C
                        .data               90  //D
                        .data               90  //E
                        .data               90  //F
                        .data               90  //G
                        .data               640 //Start
                        .data               100 //Clef
                        .data               640 //End
                        .data               640 //Choose num players
                        .data               640 //Player 1 wins
                        .data               640 //Player 2 wins
                        .data               200 //Player 1 score
                        .data               200  //Player 2 score
                        .data               200  //Player 1 turn
                        .data               200  //Player 2 turn
						.data				30	// Ye

