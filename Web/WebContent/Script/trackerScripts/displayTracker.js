function displayTracker(degrees, coursesTaken, degCourses)
{
	var creditHrsComplete = 0;
	var creditHrsDegree = 0;

	$(degrees).each(function(i, degree)
	{
		// Note: when activating degree tracker, change the getDegreeCourses function
			
		var table = $('<table/>').appendTo($('#degreeCourses'));
		$('<tr/>').appendTo(table)
			.append($('<td colspan="4"/>').text("Progress towards: " + degree.degName));
		$('<tr/>').appendTo(table)
			.append($('<td width="75"/>').text("course ID"))
			.append($('<td width="300"/>').text("course name"))
			.append($('<td width="75"/>').text("credit hours"))
			.append($('<td width="50"/>').text("grade"));
			
		// print headers for degree course table
		$(degCourses).each(function(i, course)
		{
			var courseGrade = "n/a";
			creditHrsDegree += 3;
				
			// print the course. look for course in courseTaken, if found,
			// print the grade and increment creditHrsComplete by the correct amount.
			// if not found, leave grade field as "n/a"
			// linear search is not efficient but number of courses taken will be small
			// enough that it shouldn't really matter
			$(coursesTaken).each(function(i, takenCourse)
			{
				var intGrade = takenCourse.grade;
					
				if (takenCourse.courseID == course.courseID)
				{
					// mark courseID as -1 if we are counting the course. This will permanently
					// alter the JSON string so if you need the original JSON object being used for
					// courseTaken, take courseTaken as a copy of the original
					courseGrade = getLetterGrade(intGrade);
					takenCourse.courseID = "-1";
						
					// VWs, Fs do not count as credit hours towards your degree
					if (intGrade > 0)
						creditHrsComplete += takenCourse.creditHrs;
				}
			});
			
			$('<tr/>').appendTo(table)
				.append($('<td/>').text(course.courseID))
				.append($('<td/>').text(course.courseName))
				.append($('<td/>').text(course.creditHrs))
				.append($('<td/>').text(courseGrade));
		});
			
		// calculate the number of credit hours available for electives
		var creditHrsElective = degree.creditHrs - creditHrsDegree;
			
		// go through courses taken and use them towards the degree
		// if possible and not already used
		$(coursesTaken).each(function(i, elective)
		{
			var intGrade = elective.grade;
			var electiveGrade = getLetterGrade(intGrade);
				
			// courseID is -1 if the course was counted above
			if (creditHrsElective > elective.creditHrs && elective.courseID != "-1" && intGrade > 0)
			{
				$('<tr/>').appendTo(table)
					.append($('<td/>').text(elective.courseID))
					.append($('<td/>').text("ELECTIVE: " + elective.courseName))
					.append($('<td/>').text(elective.creditHrs))
					.append($('<td/>').text(electiveGrade));
					
				creditHrsElective -= elective.creditHrs;
				creditHrsComplete += elective.creditHrs;
			}
		});
			
		// make a progress bar
		var progressPct = (creditHrsComplete / degree.creditHrs) * 100;
		var progressBarDiv = '<div class="progress-bar progress-bar-success" style="width:' + progressPct + '%"/>';
		$(progressBarDiv).appendTo($('#degreeProgress'))
	});
}