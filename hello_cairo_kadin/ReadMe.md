How to start virtual env:

activate virtual env: 
source ~/cairo_venv/bin/activate

Compile:
cairo-compile <program_name>.cairo --output <compiled_program_name>.json

e.g. cairo-compile fifteen_puzzle.cairo --output fifteen_puzzle_compiled.json

Run:
cairo-run --program=<compiled_program_name>.json  \                           
    --print_output --layout=small


or 
cairo-run \
  --program=<compiiled_program_name>.json --print_output \
  --print_info --relocate_prints

the last 2 are flags for something from the first tutorial, needs --layout flag to print apparently
