#!/bin/sh

DIR="${1:-$HOME}"  # Default directory is HOME unless specified
FILE=$(ls  "$DIR" | dmenu -i -l 20)  # Show files/folders with dmenu

[ -z "$FILE" ] && exit 1  # Exit if no file selected

if [ -d "$DIR/$FILE" ]; then
    # If it's a directory, reopen the script in that directory
    $0 "$DIR/$FILE"
else
    # If it's a file, open it with xdg-open or a specific app
    xdg-open "$DIR/$FILE" &
fi

