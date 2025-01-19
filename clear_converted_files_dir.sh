#1. Clears the copied files in ./converted_files

destructive_delete ()
{
  local CONVERTED_FILES_DIR='./converted_files'

  while true; do
      read -p "Delete all the files in converted_files/ dir? [yn] " yn
      case $yn in
          [Yy]* ) echo "Deleting all files in converted_files/ dir..."; rm -rf ./converted_files/*; echo "...done!"; break;;
          [Nn]* ) echo "cool, not deleting."; exit 0;;
          * ) echo "Yes or no, dawg.";;
      esac
  done
}

# Run the script
# Making sure I'm the only user running this script. (just in case).
if [ "$(whoami)" == 'patrickschreiber' ]; then
  destructive_delete
else
  echo "Gotta be the correct user"; exit 1;
fi
