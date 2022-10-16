# Pikachuface CTF

## Task

Find the solution of the puzzle. All parts of the solution word can be found in
the file `00_specification/pikachuface.svg.zst`. A decompressed version of that
file can be found at `00_specification/pikachuface.svg`.

Hint: The solution starts with `CSR{` and ends with `}`.

Good luck.

## Notes for the solution script

As the remote repository does not allow files bigger than 100 MB in size, two
files had to be removed from the repo:

`00_specification/pikachuface.svg`:
- This file can be decompressed from *.svg.zst.

`cache/01_all_query_entries.txt`:
- This file lists all possible entries of media queries from the specification
  file and is copied instead of being generated to skip this lengthy process. It
  has 4_362_443 lines of text. In the next step of the solution, we remove all
  duplicate entries. It makes the file small enough to fit into the repository.
  Therefore, it is not as problematic if we skip over this part. We copied the
  result from the next step into this file to ensure the solution script
  executes smoothly. Another solution would be to generate this file with the
  following command by yourself (takes approximately 12 minutes):
  `./bin/02_generate_pixels_per_image.sh`.
