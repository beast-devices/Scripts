#!/bin/bash
PREVIEW_DIR=preview
EXCLUDE=.svn

for dir in $(find . -type d -printf '%P\n' | sort -n -z); do

    if [ "$dir" = "$PREVIEW_DIR" ] || [ "$dir" = "$EXCLUDE" ]; then
	continue
    fi

    mkdir -p "\"$PREVIEW_DIR/$dir\""

    echo "Creating directory \"$PREVIEW_DIR/$dir\""

    for file in $(find "$dir" -maxdepth 1 -name *.jpg -type f -printf '%P\n' | sort -n -z); do
	echo "Generating preview for \'$file\' in \'$dir\'"
        convert "\"$dir/$file\"" -resize 1920x1080 -quality 80 "\"$PREVIEW_DIR/$dir/$file\""
    done

 
    for file in $(find "$dir" -maxdepth 1 -name *.JPG -type f -printf '%P\n' | sort -n -z); do
        echo "Generating preview for $file in $dir"
        convert "\"$dir/$file\"" -resize 1920x1080 -quality 80 "\"$PREVIEW_DIR/$dir/$file\""
    done

done

exit 0
