#!/usr/bin/env bash
#./phrase.sh --count 5 --phrase "hello world" --reverse
# Counts - Number of times to print phrase
count=4

# Phrase - Message to print
phrase="hello Cheran"

# Reverse - Whether to reverse string
reverse=0

# Parse options
while [[ $# -gt 0 ]]; do
   key="$1"
   case $key in
     -c|--count)
        count="$2"
        shift
        ;;
     -p|--phrase)
        phrase="$2"
        shift
        ;;
     -r|--reverse)
        reverse=1
        shift
        ;;
    esac
    shift
done

# Generate phrase
output=""
for ((i=0; i<$count; i++)); do

  # Reverse phrase if reverse flag set
  if [ $reverse -eq 1 ]; then
    rev_phrase=$(echo $phrase | rev)
    output+="$rev_phrase "
  else
    output+="$phrase "
  fi

done

# Alter phrase capitalization
output=$(echo $output | sed 's/.*/\U&/')

# Change the output delimiter between phrases
output=$(echo $output | sed 's/ /--- /g')

echo $output
