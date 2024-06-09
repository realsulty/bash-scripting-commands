#!/bin/bash

create_file() {
    local base_filename=$1
    local extension="${base_filename##*.}"
    local base_name="${base_filename%.*}"
    local count=1

    for i in {1..25}; do
        local filename="${base_name}.${extension}"

        if [ -e "$filename" ]; then
            while [ -e "${base_name}_${count}.${extension}" ]; do
                ((count++))
            done
            filename="${base_name}_${count}.${extension}"
        fi

        touch "$filename"
        echo "Created file: $filename"

        ((count++))
    done
}

# Example usage
create_file "example.txt"

