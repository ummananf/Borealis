function displayTracker(degrees, coursesTaken)
{
	var crHrsComplete = 0;
	var crHrsDegree = 0;

	$(degrees).each(function(i, degree)
	{
		// Note: when activating degree tracker, change the getDegreeCourses function
		var degCourses = getDegreeCourses();
			
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
			crHrsDegree += 3;
				
			// print the course. look for course in courseTaken, if found,
			// print the grade and increment crHrsComplete by the correct amount.
			// if not found, leave grade field as "n/a"
			// linear search is not efficient but number of courses taken will be small
			// enough that it shouldn't really matter
			$(coursesTaken).each(function(i, takenCourse)
			{
				var intGrade = takenCourse.grade;
					
				if (takenCourse.cID == course.cID)
				{
					// mark cID as -1 if we are counting the course. This will permanently
					// alter the JSON string so if you need the original JSON object being used for
					// courseTaken, take courseTaken as a copy of the original
					courseGrade = getLetterGrade(intGrade);
					takenCourse.cID = "-1";
						
					// VWs, Fs do not count as credit hours towards your degree
					if (intGrade > 0)
						crHrsComplete += takenCourse.crHrs;
				}
			});
			
			$('<tr/>').appendTo(table)
				.append($('<td/>').text(course.cID))
				.append($('<td/>').text(course.cName))
				.append($('<td/>').text(course.crHrs))
				.append($('<td/>').text(courseGrade));
		});
			
		// calculate the number of credit hours available for electives
		var crHrsElective = degree.crHrs - crHrsDegree;
			
		// go through courses taken and use them towards the degree
		// if possible and not already used
		$(coursesTaken).each(function(i, elective)
		{
			var intGrade = elective.grade;
			var electiveGrade = getLetterGrade(intGrade);
				
			// cID is -1 if the course was counted above
			if (crHrsElective > elective.crHrs && elective.cID != "-1" && intGrade > 0)
			{
				$('<tr/>').appendTo(table)
					.append($('<td/>').text(elective.cID))
					.append($('<td/>').text("ELECTIVE: " + elective.cName))
					.append($('<td/>').text(elective.crHrs))
					.append($('<td/>').text(electiveGrade));
					
				crHrsElective -= elective.crHrs;
				crHrsComplete += elective.crHrs;
			}
		});
			
		// make a progress bar
		var progressPct = (crHrsComplete / degree.crHrs) * 100;
		var progressBarDiv = '<div class="progress-bar progress-bar-success" style="width:' + progressPct + '%"/>';
		$(progressBarDiv).appendTo($('#degreeProgress'))
	});
}

// change this function when activating tracker
function getDegreeCourses()
{
	var degCourses = [
			{"cID":"COMP1010", "cName":"Introduction to Computer Science", "crHrs":3},
		    {"cID":"COMP1020", "cName":"Introduction to Computer Science 2", "crHrs":3},
		    {"cID":"COMP2140", "cName":"Human-Computer Interaction", "crHrs":3},
		    {"cID":"COMP2150", "cName":"Introduction to Object Oriented Programming", "crHrs":3},
			{"cID":"COMP2160", "cName":"Programming Language Concepts", "crHrs":3},
		    {"cID":"COMP2170", "cName":"Programming Practices", "crHrs":3},
		    {"cID":"COMP2180", "cName":"Computer Organization", "crHrs":3},
		    {"cID":"COMP2190", "cName":"Introduction to Artificial Intelligence", "crHrs":3},
			{"cID":"COMP3150", "cName":"Object Oriented Programming 2", "crHrs":3},
			{"cID":"COMP3190", "cName":"Artificial Intelligence 2", "crHrs":3},
			{"cID":"COMP3350", "cName":"Software Engineering", "crHrs":3},
			{"cID":"COMP3430", "cName":"Operating Systems", "crHrs":3},
			{"cID":"COMP4190", "cName":"Advanced Artificial Intelligence", "crHrs":3},
			{"cID":"COMP4350", "cName":"Software Engineering 2", "crHrs":3}
		];

	return degCourses;
}