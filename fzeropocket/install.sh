#!/bin/bash

EXE="./gamedata/FZero_Pocket.exe"
TRACKS="gamedata/Tracks"
ASSETS="assets"
DATA="gamedata"

# Extract .trk files to the Tracks folder
./lib/7za e "$EXE" "*.trk" -o"$TRACKS"

# Extract .ogg and .png files to the Assets folder
./lib/7za e "$EXE" "*.ogg" "*.png" -o"$ASSETS"

# Extract .win and .ini files to the Data folder
./lib/7za e -y "$EXE" "*.win" "*.ini" -o"$DATA"

# Rename data.win
mv "$DATA/data.win" "$DATA/game.droid"

# Create a new zip file game.apk from specified directories
zip -r "game.apk" "./game.apk" "./$ASSETS"

# Delete the executable file after extraction
rm "$EXE"