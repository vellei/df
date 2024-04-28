#!/bin/bash
# Selects a random wallpaper to use as a background

wallpaper_dir="${HOME}/pictures/wallpapers"

files=$(find $HOME/pictures/wallpapers -type f -regex '.*.[png|jpg|jpeg]$' ! -name 'background.*')

num_files=$(echo "${files}" | sed 's/ /\n/' | wc -l)
index=$((RANDOM % num_files + 1))

wallpaper=$(echo ${files} | cut -f${index} -d' ')

file_type=$(echo "${wallpaper}" | sed 's/^.*\.//')
cp ${wallpaper} ${wallpaper_dir}/background.${file_type}

