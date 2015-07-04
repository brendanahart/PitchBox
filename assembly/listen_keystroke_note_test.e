start         call    listen_keystroke_note   listen_keystroke_note_ra
              halt

#include listen_keystroke_note.e
#include keyboarddriver.e

note_to_call    .data   0
guess_is_right  .data   0
zero            .data   0
