#!/bin/bash

IMAGE_DEFINITION_DIR='02_pixels_per_image/*'
OUTPUT_DIR='03_transformed_image_pixels'

index=0
for file in $IMAGE_DEFINITION_DIR; do
    index=$((index+1))
    echo "processing image $index.txt"
    sed -E "s/^.*#pixel_([0-9]+).*$/\1/" $file > "$OUTPUT_DIR/$index.txt"
done
