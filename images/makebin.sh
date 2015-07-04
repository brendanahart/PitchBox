#!/bin/bash
# A compilation shell script to make sdcard.bin
# copies sdcard.bin to ../assembly/ when compiled
echo "Deleting old sdcard.bin"
rm sdcard.bin
echo "Creating new sdcard.bin"
touch sdcard.bin
echo "Adding files to sdcard.bin"
echo "    letters"
cat letter*.bin > sdcard.bin
echo "    start screen"
cat *startscreen*.bin >> sdcard.bin
echo "    clef"
cat *clef*.bin >> sdcard.bin
echo "    end screen"
cat *endscreen*.bin >> sdcard.bin
echo "    choose num players"
cat num_player_choose.png.bin >> sdcard.bin
echo "    player1 wins"
cat player1_wins.png.bin >> sdcard.bin
echo "    player2 wins"
cat player2_wins.png.bin >> sdcard.bin
echo "    player1 score"
cat score_player1.png.bin >> sdcard.bin
echo "    player2 score"
cat score_player2.png.bin >> sdcard.bin
echo "    player1 turn"
cat turn_player1.png.bin >> sdcard.bin
echo "    player2 turn"
cat turn_player2.png.bin >> sdcard.bin
echo "Finished compiling sdcard.bin"
cp sdcard.bin ../assembly/
echo "Copied sdcard.bin to ../assembly/"
