#!/bin/sh

#1. Takes a target path
#2. Copies the contents of that dir into converted_files
#3. Makes text file with original target path (as a reminder)
#4. Operates on the files in converted_files
#5.

TARGET_PATH = $1


# INFILE = $2
# OUTFILE = $3
# ffmpeg -n -i $INFILE -c:a libmp3lame -q:a 1 -ar 44100 -map_metadata 0 -map_metadata 0:s:0 -id3v2_version 3 -vn $OUTFILE.mp3

#2. Copy the contents of TARGET_PATH into converted_files
cp $TARGET_PATH ./converted_files

#3. Make text file with original target path (as a reminder)
touch "./converted_files/original_path_is:\ $TARGET_PATH.txt"

# Batch convert with subdirs
# find converted_files -exec ffmpeg -i {} {}.mp3 \;


