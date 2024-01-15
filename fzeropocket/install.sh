#!/bin/bash

EXE="./gamedata/FZero_Pocket.exe"
TRACKS="gamedata/Tracks"
ASSETS="assets"
DATA="gamedata"

# Extract .trk files to the Tracks folder
echo "Extracking tracks into $TRACKS..." > /dev/tty0
./lib/7za e "$EXE" "*.trk" -o"$TRACKS"

# Extract .ogg files to the Assets folder
echo "Extracking music into $ASSETS..." > /dev/tty0
./lib/7za e "$EXE" "*.ogg" -o"$ASSETS"

# Extract .win and .ini files to the Data folder
echo "Extracking data into $DATA..." > /dev/tty0
./lib/7za e -y "$EXE" "*.win" "*.ini" -o"$DATA"

# Rename data.win
mv "$DATA/data.win" "$DATA/game.droid"

# Create a new zip file game.apk from specified directories
echo "Zipping $ASSETS into apk..." > /dev/tty0
./lib/7za a -r "./game.apk" "./$ASSETS"

# Delete the executable file after extraction
rm "$EXE"