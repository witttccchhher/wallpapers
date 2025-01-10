#!/usr/bin/env bash

output="README.md"
truncate --size=0 "$output"

for dir in */; do
    dir_name="${dir%/}"
    echo "# $(echo "$dir_name" | awk '{print toupper(substr($0, 1, 1)) substr($0, 2)}')" >> "$output"

    for img in $dir_name/*; do
      echo "![${img##*/}](./$img)" >> "$output"
    done

    echo "" >> "$output"
done
