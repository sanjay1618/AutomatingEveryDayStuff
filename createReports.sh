#!/bin/bash
excel_sheet="/media/sf_shared_folder/GradesProject2.xlsx"
output_dir="/home/sanjay/grader/reportsProject2"

# Converting xlsx file to csv to retrieve values for each student.
xlsx2csv "$excel_sheet" > temp.csv
docu_comments="IF YOU LOST POINTS FOR DOCUMENTATION ERRORS ABOVE, THE POSSIBLE ERRORS YOUR
PROGRAM CONTAINED IS LISTED AS FOLLOWS (see me in my office if you cannot 
locate the error you might have had):

-)  Line length exceeds 72 characters (This includes documentation).  Aside 
from breaking long lines into multiple lines, you might decrease the size 
of your tabs.  This can help for deeply nested blocks.
-)  What you have list as documentation before each method is actually not 
javadoc as it should be.  The reason being, javadoc HAS to begin with '/**  not /*'
-)  import statements not between top multi-line and class javadoc.
-)  No name on the assignment.
-)  Missing javaDoc @author tag-needed in all classes & Interfaces.
-)  Missing javaDoc @version tag-needed in all classes & Interfaces.
-)  Missing javaDoc @param tag-Needed on all methods with parameters 
including abstract.
-)  Missing javaDoc @return tag-Needed on all methods with a return value, 
even abstract methods.
-)  Missing javaDoc for a class-this includes all classes, abstract classes, 
Module classes, 
and Interfaces.
-)  Missing javaDoc on methods-this includes all methods (including all 
constructors) in all classes, abstract classes, Module classes, and the abstract 
methods of Interfaces.
Also, keep in mind '/*'  is not javadoc,  '/**' is.
-)  Missing short description in javadoc for each and every class field.  This
includes final fields. Also, keep in mind  '/*' and '//' is not javadoc, ' /**' is
-)  Method names should start with lowercase followed by camelCase.
-)  No space between operators and operands.
-)  No space after a comma.
-)  No space preceding a left brace  { or following a right brace: } else).
-)  No space between control construct term (for, if, while, etc.) and 
left parenthesis.
-)  There is no such tag as a @field tag (we only use @name, @version, 
@param, and @return)
-)  Named constants should be listed before class fields.

   COMMENTS (Single Line, Multi-Line, JavaDoc)   
-)  Incorrect use/placement of Multi-Line Documentation (such as none at
    the top of the file).
-)  Missing javadoc tags (such as @author, @version, @param, @return, etc.).
-)  Missing short description in javadoc for each and every method.  This
includes abstract methods. Also, all appropriate tags are required.
   IDENTIFIER NAMES:   
-)  Class name should begin with upper case.
-)  Incorrect naming of constants fields(final).  Should be all UPPER_CASE.
-)  Incorrect naming of class instance variables-should hava a prefix of 'my'
followed by CamelCase.
-)  Incorrect naming of parameters-should have a prefix of 'the' followed by camelCase.
   INDENTATION:        
-)  Inconsistent indentation of blocks"

while IFS=, read -r Name ID Compiles Executes Methods Docu const penalty actual raw comments; do
	if [ "$Name" != "Name" ]; then
		report_file=$output_dir/${ID}_report.txt
		echo "TCS 143-B Fall 2023" > $report_file;
		echo "Project 2" >> $report_file;
		echo "Student Name: $Name" >> $report_file;
		echo "Raw Score : $raw / 15" >> $report_file;
		echo "Actual Score: $actual /15" >> $report_file;
		echo "Bonus Points: 0" >> $report_file;
		echo "Due at Nov 6 11:59PM" >> $report_file;
		echo "Comments: $comments" >> $report_file;
	 	echo "Compiles : $Compiles /3" >> $report_file;
		echo "Executes : $Executes /3" >> $report_file;
		echo "Method Implemented: $Methods /5" >> $report_file;
		echo "Documentation : $Docu /1" >> $report_file;
		echo "Constructors : $const /3 " >> $report_file;
		echo "Penalty : $penalty" >> $report_file;
		echo "$docu_comments" >> $report_file;
	fi
done < temp.csv
rm temp.csv
echo "done creating reports for each student";






