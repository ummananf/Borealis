

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>progress bar</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    <script src="Script/jquery-1.4.1.js" type="text/javascript"></script>
    <link href="Style/history.css" rel="stylesheet" type="text/css" />
</head>
<body>



<jsp:include page="template/header_nav.jsp" />



<div class="rightbox">
                
    <h2 class="pathNavigator">
        learning center &gt; progress bar</h2>
    <div class="history">
        <div class="history-date">
            <ul id="hData">
            </ul>
        </div>
    </div>

<div id="degreeCourses"></div>

<div class="progress" id="degreeProgress"></div>

<script>
	var degrees = [
	    {"degName":"B. Sc. Computer Science (Major)", "crHrs":"120"}
	];
	var coursesTaken = [
	    {"cID":"COMP1010", "grade":"A+", "crHrs":3},
	    {"cID":"COMP1020", "grade":"A", "crHrs":3},
	    {"cID":"BIO1000", "grade":"A+", "crHrs":3},
	    {"cID":"COMP2160","grade":"A", "crHrs":3},
	    {"cID":"ECON1010","grade":"B", "crHrs":6}
	];
	var crHrsComplete = 0;
	
	$(document).ready(function()
	{
		$(degrees).each(function(i, degree)
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
			
			var table = $('<table/>').appendTo($('#degreeCourses'));
			$('<tr/>').appendTo(table)
				.append($('<td width="75"/>').text("course ID"))
				.append($('<td width="300"/>').text("course name"))
				.append($('<td width="75"/>').text("credit hours"))
				.append($('<td width="50"/>').text("grade"));
			
			// print headers for degree course table
			$(degCourses).each(function(i, course)
			{
				var courseGrade = "n/a";
				
				// print the course. look for course in courseTaken, if found,
				// print the grade and increment crHrsComplete by the correct amount.
				// if not found, leave grade field as "n/a"
				// linear search is not efficient but number of courses taken will be small
				// enough that it shouldn't really matter
				$(coursesTaken).each(function(i, takenCourse)
				{
					if (takenCourse.cID == course.cID)
					{
						courseGrade = takenCourse.grade;
						crHrsComplete += takenCourse.crHrs;
					}
				});
				
				$('<tr/>').appendTo(table)
					.append($('<td/>').text(course.cID))
					.append($('<td/>').text(course.cName))
					.append($('<td/>').text(course.crHrs))
					.append($('<td/>').text(courseGrade));
			});
			
			// make a progress bar
			var progressPct = (crHrsComplete / degree.crHrs) * 100;
			var progressBarDiv = '<div class="progress-bar progress-bar-success" style="width:' + progressPct + '%"/>';
			$(progressBarDiv).appendTo($('#degreeProgress'))
		});
	});
</script>

</div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
