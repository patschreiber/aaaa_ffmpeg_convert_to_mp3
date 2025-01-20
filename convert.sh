#!/bin/sh

#1. Takes a target path
#2. Copies the contents of that dir into converted_files
#3. Makes text file with original target path (as a reminder)
#4. Operates on the files in converted_files
#5.

TARGET_PATH=$1
dt=$(date '+%d/%m/%Y %H:%M:%S');

# INFILE = $2
# OUTFILE = $3
# ffmpeg -n -i $INFILE -c:a libmp3lame -q:a 1 -ar 44100 -map_metadata 0 -map_metadata 0:s:0 -id3v2_version 3 -vn $OUTFILE.mp3

#2. Copy the contents of TARGET_PATH into converted_files
# cp $TARGET_PATH ./converted_files

# Batch convert with subdirs
# find converted_files -exec ffmpeg -i {} {}.mp3 \;


run ()
{
  while true; do
      read -p "Copy and convert files from $TARGET_PATH [yn] " yn
      case $yn in
          # rm all files in converted_files, then re-add gitkeep
          # [Yy]* ) echo "Deleting all files in converted_files/ dir..."; rm -rf ./$CONVERTED_FILES_DIR/*; touch $CONVERTED_FILES_DIR/.gitkeep ; echo "...done!"; break;;
          [Yy]* ) cp_files; break;;
          [Nn]* ) echo "cool, not copying."; exit 0;;
          * ) echo "Yes or no, dawg.";;
      esac
  done
}

cp_files ()
{
  #2. Copy the contents of TARGET_PATH into converted_files
  # cp $TARGET_PATH ./converted_files

  #3. Make text file with original target path (as a reminder)
  touch ./converted_files/original_path.txt && echo "${dt} ${TARGET_PATH}" >> ./converted_files/original_path.txt

  #4. Batch convert with subdirs
  # find converted_files -exec ffmpeg -i {} {}.mp3 \;
}

# Runs the prgm.
run
