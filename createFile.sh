#!/bin/bash

create_file() {
    local filename=$1
    local extension="${filename##*.}"
    local name="${filename%.*}"
    local count=1

    if [ ! -e "$filename" ]; then
        touch "$filename"
        echo "Created file: $filename"
    else
        while [ -e "${name}_${count}.${extension}" ]; do
            ((count++))
        done
        new_filename="${name}_${count}.${extension}"
        touch "$new_filename"
        echo "Created file: $new_filename"
    fi
}

# Example usage
create_file "example.txt"

