#!/bin/bash

SPECIFICATION_FILE='00_specification/pikachuface.svg'
QUERIES_FILE='01_preparation/sorted_query_entries.txt'
OUTPUT_DIR='02_pixels_per_image'

index=0
while read query; do
    index=$((index+1))
    echo "processing image $index.txt"
    grep "$query" --no-group-separator -A1 $SPECIFICATION_FILE | grep -v "$query" > "$OUTPUT_DIR/$index.txt"
done < $QUERIES_FILE
