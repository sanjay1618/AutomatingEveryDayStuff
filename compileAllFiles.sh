#!/bin/bash
submissions="/media/sf_shared_folder/"
for student_folder in "$submissions"/*/; do
	if [ -d "$student_folder" ]; then
		cp /media/sf_shared_folder/ItemMain.java "$student_folder"/ItemMain.java
		java_files=("$student_folder"*.java)
		if [ "${#java_files[@]}" -gt 0 ]; then
			javac "${java_files[@]}";
			java -cp "$student_folder" ItemMain > "$student_folder"/output.txt 2>&1
		       if diff -q "$student_folder"/output.txt "$submissions"/MainOutput.txt >/dev/null; then
		       echo "Output Matched for $student_folder" >> "$submissions"differ.txt
		       fi	       
		else
			echo "No such folder"
		fi
	fi
done
			
			
