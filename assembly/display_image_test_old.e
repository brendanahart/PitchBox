//Tests display_image function with 90x90 image "letter_A.png.e"

            cp              display_image_image       one
            cp              display_image_x           oneforty
            cp              display_image_y           oneforty
            call            display_image             display_image_ra
            halt

#include    display_image.e
#include    vgaDriver.e
#include    letter_A.png.e
//#include    letter_B.png.e
//#include    letter_C.png.e
//#include    letter_D.png.e
//#include    letter_E.png.e
//#include    letter_F.png.e
//#include    letter_G.png.e


oneforty    .data       240
one         .data       1
