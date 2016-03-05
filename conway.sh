#!/bin/bash

git_churn=`git log --all -M -C --name-only --format='format:' "$@" | sort | grep -v '^$' | uniq -c | sort | awk '{print $1 "\t" $2}' | sort -g | awk '$1 >= 10'`

while read -r line; do
  file=($line)
  file_name=${file[1]}
  if [ -f $file_name ]; then
    cmd=`git log --format='%an' $file_name | sort | uniq -c | sort -rn`
    contributors_number=`echo "$cmd" | wc -l`
    num=`echo "$cmd" | head -2 | awk '{ print $1 }'`
    num=($num)
    echo -e "\n\n$file_name"
    echo -e "Contributors: $contributors_number" | xargs
    echo -e "Total edits: ${file[0]}"
    echo -e "1st contributor edits: ${num[0]}"
    echo -e "2nd contributor edits: ${num[1]}"
  fi
done <<< "$git_churn"
