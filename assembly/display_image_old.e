//REQUIRES: Is given:   Image resolution in pixels
//                      X and Y location of top left corner
//                      Image array location
//          Image is greater than 0 pixels
//MODIFIES: VGA display
//EFFECTS:  Displays image to VGA at given x and y location from
//          top left corner.

//INPUT:    display_image_image:    # of image in array of images
//          display_image_x:        x location of top left of image
//          display_image_y:        y location of top left of image
//          display_image_ra:       return address
            //NOTE: 1st pixel is location (0, 0)

//OUTPUT:   image is displayed to VGA

//NOTE: Potential optimization. Replace the call in the loop with a ret. Set vga_ra before the loop.
//      We can do this because the return address does not change

//Get image width and height from array
display_image           cpfa                display_image_width     display_image_image_w   display_image_image
                        cpfa                display_image_height    display_image_image_h   display_image_image
//Import correct image
bobert                  cpfa                display_image_image     display_image_image_loc display_image_image

//Calculate image length (final mem location of image) and store necessary vars
                        mult                display_image_length    display_image_width     display_image_height
                        add                 display_image_length    display_image_length    display_image_image
//Initialize first-column var
                        cp                  display_image_xold      display_image_x
//Set width equal to last column of pixels to be displayed
                        add                 display_image_width     display_image_width     display_image_xold
//Set height equal to last row of pixels to be displayed
                        add                 display_image_height    display_image_height    display_image_y


//Begin loop to display each pixel (end loop when i = length)
//Set pixel location
display_image_loop      cp                  vga_x1                  display_image_x
                        cp                  vga_x2                  display_image_x
                        cp                  vga_y1                  display_image_y
                        cp                  vga_y2                  display_image_y
//Set pixel color
                        cpfa                vga_color_write         0                       display_image_image 
                        be                  display_image_iterate   vga_color_write         display_image_zero //If color = 0, skip to iterate
                        call                vga                     vga_ra
//Iterate display_image_x, display_image_image
display_image_iterate   add                 display_image_x         display_image_x         display_image_one
                        add                 display_image_image     display_image_image     display_image_one

//Check if display_image_y should be iterated (next line of pixels)
                        bne                 display_image_reloop    display_image_x         display_image_width
                        add                 display_image_y         display_image_y         display_image_one
                        cp                  display_image_x         display_image_xold
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
display_image_xold      .data               0
display_image_x         .data               0
display_image_y         .data               0
display_image_ra        .data               0
display_image_image     .data               0
display_image_image_loc .data               0
                        .data               letter_A //1
//                        .data               letter_B //2
//                        .data               letter_C //3
//                        .data               letter_D //4
//                        .data               letter_E //5
//                        .data               letter_F //6
//                        .data               letter_G //7
display_image_image_h   .data               0
                        .data               90  //A
                        .data               90  //B
                        .data               90  //C
                        .data               90  //D
                        .data               90  //E
                        .data               90  //F
                        .data               90  //G
display_image_image_w   .data               0
                        .data               90  //A
                        .data               90  //B
                        .data               90  //C
                        .data               90  //D
                        .data               90  //E
                        .data               90  //F
                        .data               90  //G

