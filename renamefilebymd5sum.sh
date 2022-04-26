#!/bin/bash

# Supposedly renames each file by its md5 hash

# First argument is your target directory, second is your destination directory
if [ "$#" -ne 1 ]; then
    echo "Use is script.sh sourcefolder destinationfolder"
fi

source_dir=$1
destination_dir=$2

for file in "${source_dir}"/*;do

    hash=$(md5sum "${file}"|cut -d' ' -f1)

    ext=${file##*.}

    cp -v "$file" "${destination_dir}/${hash}.${ext}"

done
