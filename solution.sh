#!/bin/bash

. demo-magic.sh -d

SHOW_CMD_NUMS=true
DEMO_PROMPT="${BLUE}~/pikachuface ${GREY}(01-preparation)${COLOR_RESET}$ "

clear

pe 'SPECIFICATION_FILE=00_specification/pikachuface.svg'

pe 'less $SPECIFICATION_FILE'
pe 'wc -l $SPECIFICATION_FILE' # number of lines
pe 'wc -L $SPECIFICATION_FILE' # max line length'
pe 'clear'

pe 'head -n16 $SPECIFICATION_FILE | cut -c -80' # first few lines truncated to 80 characters
pe '# We know: SVG file with many media queries that color individual "pixels"'
pe 'clear'

pe 'tail -n16 $SPECIFICATION_FILE' # last few lines
pe 'echo $((1980 / 20))'
pe '# We know: 
# - pixels are named from pixel_0 to pixel_9999
# - 100x100 cells grid
# - one cell is 20x20 pixels'
pe 'clear'

pe 'grep "</style>" -A20 $SPECIFICATION_FILE' # get the first few lines after style tag to see first pixel rects
pe '# We know: pixels are defined column first '
pe 'clear'

pe 'PREPARATION_DIR=01_preparation'
pe 'head -n2 $SPECIFICATION_FILE | tail -n1 > $PREPARATION_DIR/query.txt'
pe 'grep -E "\(\([^,]*\)\)" -o $PREPARATION_DIR/query.txt | head'
pe '# We got: all media queries for the first "pixel" cell'
pe 'clear'

p 'grep -E "\(\([^,]*\)\)" -o $SPECIFICATION_FILE > $PREPARATION_DIR/all_query_entries.txt' # might take around 30 seconds to complete
cp cache/01_all_query_entries.txt $PREPARATION_DIR/all_query_entries.txt
wait
pe 'wc -l $PREPARATION_DIR/all_query_entries.txt'
p 'sort -u $PREPARATION_DIR/all_query_entries.txt > $PREPARATION_DIR/sorted_query_entries.txt' # might take around 10 seconds to complete
cp cache/01_sorted_query_entries.txt $PREPARATION_DIR/sorted_query_entries.txt
wait
pe 'wc -l $PREPARATION_DIR/sorted_query_entries.txt'
pe 'clear'

DEMO_PROMPT="${BLUE}~/pikachuface ${CYAN}(02-pixels-per-image)${COLOR_RESET}$ "

pe 'wc -l $PREPARATION_DIR/sorted_query_entries.txt'
pe 'head $PREPARATION_DIR/sorted_query_entries.txt'
pe 'grep "((max-height: 399px))" -A1 $SPECIFICATION_FILE | head -n2'
pe 'clear'
pe 'grep "((max-height: 399px))" -A1 $SPECIFICATION_FILE | grep -v "((max-height: 399px))" | head'
pe 'grep "((max-height: 399px))" --no-group-separator -A1 $SPECIFICATION_FILE | grep -v "((max-height: 399px))" | head'
pe 'clear'

pe 'cat ./bin/02_generate_pixels_per_image.sh'
p './bin/02_generate_pixels_per_image.sh' # might take around 12 minutes
echo 'processing image 1.txt' && sleep 0.5
echo 'processing image 2.txt' && sleep 0.5
echo 'processing image 3.txt' && sleep 0.5
echo 'processing image 4.txt' && sleep 0.5
echo 'processing image 5.txt' && sleep 0.5
echo 'processing image 6.txt' && sleep 0.5
echo 'processing image 7.txt' && sleep 1
echo 'processing image 8.txt' && sleep 1
echo 'processing image 9.txt' && sleep 1
echo '^C'
pe 'ln cache/02_generated/* 02_pixels_per_image/ &> /dev/null'
pe 'clear'

pe 'cat 02_pixels_per_image/1.txt | head'
pe 'clear'

DEMO_PROMPT="${BLUE}~/pikachuface ${PURPLE}(03-transformed_image_pixels)${COLOR_RESET}$ "

pe 'cat ./bin/03_transform_image_pixels.sh'
p './bin/03_transform_image_pixels.sh' # might take around 2 minutes
echo 'processing image 1.txt' && sleep 0.1
echo 'processing image 2.txt' && sleep 0.1
echo 'processing image 3.txt' && sleep 0.1
echo 'processing image 4.txt' && sleep 0.1
echo 'processing image 5.txt' && sleep 0.1
echo 'processing image 6.txt' && sleep 0.1
echo 'processing image 7.txt' && sleep 0.1
echo 'processing image 8.txt' && sleep 0.1
echo 'processing image 9.txt' && sleep 0.1
echo '^C'
pe 'ln cache/03_generated/* 03_transformed_image_pixels/ &> /dev/null'
pe 'clear'

pe 'cat 03_transformed_image_pixels/1.txt | head'
pe 'clear'

DEMO_PROMPT="${BLUE}~/pikachuface ${BROWN}(04-filter-images)${COLOR_RESET}$ "

pe 'ls -l 03_transformed_image_pixels | wc -l'
pe 'cat ./bin/04_filter_images.sh'
p './bin/04_filter_images.sh' # might take around 1 minute
echo 'processing image 1.txt' && sleep 0.1
echo 'processing image 2.txt' && sleep 0.1
echo 'processing image 3.txt' && sleep 0.1
echo 'processing image 4.txt' && sleep 0.1
echo 'processing image 5.txt' && sleep 0.1
echo 'processing image 6.txt' && sleep 0.1
echo 'processing image 7.txt' && sleep 0.1
echo 'processing image 8.txt' && sleep 0.1
echo 'processing image 9.txt' && sleep 0.1
echo '^C'
pe 'ln cache/04_generated/* 04_filter_images/ &> /dev/null'
pe 'ls -l 04_filter_images | wc -l'
pe 'clear'

DEMO_PROMPT="${BLUE}~/pikachuface ${GREEN}(05-A-image_generation)${COLOR_RESET}$ "

pe '# Approach A: Using ASCII art to create our images'
pe 'cat ./bin/05_A_generate_image.sh'
pe 'clear'
pe './bin/05_A_generate_image.sh'
pe 'clear'

DEMO_PROMPT="${BLUE}~/pikachuface ${GREEN}(05-B-image_generation)${COLOR_RESET}$ "

pe '# Approach B: Using python and PIL (image library) to create our images'
pe 'cat ./bin/05_B_generate_image.py'
pe 'clear'
pe 'python3 bin/05_B_generate_image.py'
pe 'clear'

pe '# The solution word can now be read from the resulting files.'
pe '# Thanks for your attention!'
