# aaaa Convert wav to MP3

1. Run `./convert.sh <PATH>` to convert all wav files in that path to mp3.
   Non-destructively cp's to `aaaa/converted_files` so be careful about file
   size.
2. Run `./clear_converted_files_dir.sh` to delete the copied files in
   converted_files when you're done with them. Right now you have to be
   `patrickschreiber` user to do this destructive action via script.
