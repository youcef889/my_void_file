#!/bin/bash

# Bash script to extract extended data from YouTube RSS
# Usage: ./youtube_rss_extended.sh <YouTube Channel ID>

CHANNEL_ID="$1"

if [[ -z "$CHANNEL_ID" ]]; then
    echo "Usage: $0 <YouTube Channel ID>"
    exit 1
fi

RSS_URL="https://www.youtube.com/feeds/videos.xml?channel_id=${CHANNEL_ID}"

echo "📡 Fetching RSS feed from YouTube Channel ID: $CHANNEL_ID"
echo "============================================================"

# Fetch and parse RSS using xmllint and awk
curl -s "$RSS_URL" | xmllint --format - 2>/dev/null | awk '
    BEGIN {
        RS="</entry>"; FS="\n";
    }
    /<entry>/ {
        title=""; link=""; thumb=""; desc="";
        for (i = 1; i <= NF; i++) {
            if ($i ~ /<media:title>/) {
                gsub(/.*<media:title>|<\/media:title>.*/, "", $i);
                title = $i;
            }
            if ($i ~ /<media:content /) {
                match($i, /url="([^"]+)"/, a);
                url = a[1];
            }
            if ($i ~ /<media:thumbnail /) {
                match($i, /url="([^"]+)"/, b);
                thumb = b[1];
            }
            if ($i ~ /<media:description>/) {
                gsub(/.*<media:description>|<\/media:description>.*/, "", $i);
                desc = $i;
            }
            if ($i ~ /<media:statistics /) {
                match($i, /views="([0-9]+)"/, c);
                views = c[1];
            }
        }
        printf "\n🎬 Title: %s\n", title;
        printf "▶️  Video URL: %s\n", url;
        printf "🖼  Thumbnail: %s\n", thumb;
        printf "👁️  Views: %s\n", views;
        printf "📝 Description: %s...\n", substr(desc, 1, 120);
    }
'

echo -e "\n✅ Done."

