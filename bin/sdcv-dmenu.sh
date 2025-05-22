#!/bin/bash

# Use dmenu to prompt for a word
WORD=$(echo "" | dmenu -p "Enter word:")

# Check if a word is provided
if [ -z "$WORD" ]; then
    exit 1
fi

# Ask user whether to use sdcv or Cambridge Dictionary
CHOICE=$(echo -e "sdcv\nCambridge" | dmenu -p "Choose lookup method:")

if [ "$CHOICE" == "sdcv" ]; then
    sdcv "$WORD" > "$OUTPUT_FILE"
    OUTPUT_FILE="/tmp/sdcv_output.html"
    sdcv "$WORD" > "$OUTPUT_FILE"
    # Open the output in surf
    xdg-open "file://$OUTPUT_FILE"
else
    # Replace spaces with hyphens
    WORD=$(echo "$WORD" | sed 's/ /-/g')
    URL="https://dictionary.cambridge.org/dictionary/english/${WORD}"
    
    # Open the URL in the default browser
    xdg-open "$URL" 2>/dev/null || open "$URL" 2>/dev/null || echo "Please open: $URL"
fi

