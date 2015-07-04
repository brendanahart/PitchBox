//Tests display_image function with 90x90 image "letter_A.png.e"

            cp              display_image_image       test
            cp              display_image_x           xy
            cp              display_image_y           xy
            call            display_image             display_image_ra
            halt

#include    display_image.e
#include    vgaDriver.e
#include    SDDriver.e


xy           .data       50
test         .data       16
