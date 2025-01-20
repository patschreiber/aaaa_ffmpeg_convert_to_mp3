#!/bin/sh

TARGET_PATH=$1
MANIFEST_FILENAME="./converted_files/CONVERSION_MANIFEST.txt"

# Target path cant be blank
if [ -z "$1" ]; then
  echo "need a path, bro."
  exit 1
fi

main () {
  create_manifest_file
  add_to_manifest
  convert_from_manifest
}

create_manifest_file ()
{
  touch $MANIFEST_FILENAME
  echo "Created Manifest file at $MANIFEST_FILENAME"
}

# Read from each line
convert_from_manifest ()
{
  while read -r line; do
    echo "Converting $line"
  done < $MANIFEST_FILENAME
}

add_to_manifest ()
{
  find $TARGET_PATH -type f | grep wav$ >> $MANIFEST_FILENAME
  find $TARGET_PATH -type f | grep aiff$ >> $MANIFEST_FILENAME
  find $TARGET_PATH -type f | grep aif$ >> $MANIFEST_FILENAME
  find $TARGET_PATH -type f | grep m4a$ >> $MANIFEST_FILENAME
  find $TARGET_PATH -type f | grep flac$ >> $MANIFEST_FILENAME
  find $TARGET_PATH -type f | grep ogg$ >> $MANIFEST_FILENAME
}

# get_date ()
# {
#   dt=$(date '+%d/%m/%Y %H:%M:%S');
# }

main
