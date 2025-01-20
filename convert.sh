#!/bin/sh

#1. Takes a target path
#2. Copies the contents of that dir into converted_files
#3. Makes text file with original target path (as a reminder)
#4. Operates on the files in converted_files
#5.

TARGET_PATH=$1
dt=$(date '+%d/%m/%Y %H:%M:%S');

if [ -z "$1" ]; then
  echo "need a path, bro."
  exit 1
fi

run ()
{
  while true; do
      read -p "Copy and convert files from $TARGET_PATH [yn] " yn
      case $yn in
          # rm all files in converted_files, then re-add gitkeep
          # [Yy]* ) echo "Deleting all files in converted_files/ dir..."; rm -rf ./$CONVERTED_FILES_DIR/*; touch $CONVERTED_FILES_DIR/.gitkeep ; echo "...done!"; break;;
          [Yy]* ) aaaa; break;;
          [Nn]* ) echo "cool, not copying."; exit 0;;
          * ) echo "Yes or no, dawg.";;
      esac
  done
}

# The main prgm. Didn't know what to call this function. Guess it could have been main()...
aaaa ()
{
  cp_files
  make_textfile
  ffmpeg_convert_files
  echo "Done converting the files. You should probably run the delete_converted_files_dir when you're done copying the .mp3 files from there."
  exit 0
}

#2. Copy the contents of TARGET_PATH into converted_files
cp_files ()
{
  #2. Copy the contents of TARGET_PATH into converted_files
  echo "Copying the contents of $TARGET_PATH into ./converted_files..."
  echo "(The size is $(du -hs $TARGET_PATH))..."
  cp -R $TARGET_PATH ./converted_files/
  echo "...done!"
}

#3. Make text file with original target path (as a reminder)
make_textfile ()
{
  # make file then add datetime and target path to file.
  echo "Making original_path.txt file with datetime and target path..."
  touch ./converted_files/original_path.txt && echo "${dt} ${TARGET_PATH}" >> ./converted_files/original_path.txt
  echo "...done!"
}

#4. Batch convert wav files (and in subdirs).
ffmpeg_convert_files ()
{
  echo "Running ffmpeg to convert wav files to mp3, recursively..."
  find ./converted_files/**/*.wav -exec ffmpeg -i {} {}.mp3 \;

  # gtfor i in *.wav; do ffmpeg -i "$i" -f mp3 "${i%}.mp3"; done
  # The above command creates files that are named wav.mp3.
  # To get files with the correct file extension, change the command to:
  ## for i in *.wav; do ffmpeg -i "$i" -f mp3 "${i%.*}.mp3"; done
  # i.e. add .* after i%.

  echo "...done!"
}

# Runs the prgm.
run
