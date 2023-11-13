#!/bin/bash

main_zip_folder="/media/sf_shared_folder/submissions.zip"
temp_extract_dir="/home/sanjay/temp"

unzip -q "$main_zip_folder" -d "$temp_extract_dir"

for student_zip in "$temp_extract_dir"/*.zip; do
    student_extract_dir="$temp_extract_dir/$(basename -s .zip "$student_zip")"
    mkdir -p "$student_extract_dir"
    unzip -q "$student_zip" -d "$student_extract_dir"
    
    # Extract student name from the folder name
    student_name=$(echo "$(basename "$student_extract_dir")" | cut -d_ -f1)

    # Destination folder for the student
    destination_folder="/home/sanjay/grader/$student_name"

    # Rename and move the student's folder to the destination
    mv "$student_extract_dir" "$destination_folder"
done

# Clean up: Remove the main zip folder
rm -rf "$main_zip_folder"

echo "Folders have been extracted and renamed."





