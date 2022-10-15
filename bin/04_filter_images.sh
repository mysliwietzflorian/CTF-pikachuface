#!/bin/bash

IMAGE_DEFINITION_DIR='03_transformed_image_pixels/*'
OUTPUT_DIR='04_filter_images'

index=0
for file in $IMAGE_DEFINITION_DIR; do
    index=$((index+1))
    echo "processing image $index"
    hash=($(sha1sum $file)) # use array assignment to get first column
    cat $file > "$OUTPUT_DIR/$hash.txt"
done
