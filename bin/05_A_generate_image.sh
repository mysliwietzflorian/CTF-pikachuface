#!/bin/bash

INPUT_DIR='04_filter_images/*'
OUTPUT_DIR='05_A_generate_image'

for file in $INPUT_DIR; do
    echo "processing image $(basename $file)"
    result=''

    pixelArray=($(cat $file)) 
    pixelIndex=0
    indexToColor=${pixelArray[$pixelIndex]}

    loopIndex=0
    for y in {0..99}; do
        for x in {0..99}; do

            if [[ $indexToColor == $loopIndex ]]; then
                result+='xx'

                pixelIndex=$((pixelIndex+1))
                indexToColor=${pixelArray[$pixelIndex]}
            else
                result+='  '
            fi

            loopIndex=$((loopIndex+1))
        done

        result+=$'\n'
    done

    echo "$result" > "$OUTPUT_DIR/$(basename $file)"
done
