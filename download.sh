#!/usr/bin/env bash

for json_file in wan.json qwen.json; do
    [ -f "$json_file" ] || continue
    echo "Processing $json_file ..."

    for row in $(jq -c '.[]' "$json_file"); do
        url=$(echo "$row" | jq -r '.download_url')
        dir=$(echo "$row" | jq -r '.target_dir')
        name=$(echo "$row" | jq -r '.file_name')

        mkdir -p "$dir"
        if [ -f "$dir/$name" ]; then
            echo "Skipping $name (already exists)"
        else
            echo "Downloading from $url"
            curl -L -o "$dir/$name" "$url"
        fi
    done
done