## grader.awk


# user-defined function - to calculate the average score amongst all of a student's classes
function calc_avg(total, count) {
	return total / count
}



# Begin block - set FS
BEGIN {

	FS = ","

}

# from the first row of the csv file, check the headers and count the number of subjects
NR == 1 {
	
	for (i=1; i<= NF; i++) {
		# if statement - keep track of subjects, if field starts with "CS" count as subject
		if ($i ~ /^CS/) {
		 	subject_count++
		} 
	}
	next
}


# store sum of grades in assoc. array, calc avg grade/classify as pass (>=70) or fail
# track highest and lowest scoring students (using total score)
{
	name = $2
	grade_total = 0

	for (i=3; i<= NF; i++) {
		grade_total += $i
	}

	avg = calc_avg(grade_total, subject_count)
	status = (avg >= 70) ? "Pass" : "Fail"
	
	# associative arrays to keep track of student info using their names as indices
	total_score[name] = grade_total
	avg_score[name] = avg
	result[name] = status

	# if statements to keep track high and low
	if (NR == 2 || grade_total > high_score) {
		high_score = grade_total
		top_student = name
	}
	if (NR == 2 || grade_total < low_score) {
		low_score = grade_total
		lowest_student = name
	}



}


# print student name, total score, avg score, status of pass/failed for each student, and highest and lowest scorers
END {

	print "Student Summary: "
	for (student in total_score) {
		printf "%-10s Total: %-3d | Average: %.2f | Status: %s\n",student, total_score[student],
		       avg_score[student], result[student]
	
	}

	# highest and lowest scorers from the group of students
	print "\nTop Scorer: " top_student " with a " high_score
	print "\nLowest Scorer: " lowest_student " with a " low_score

}
