

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>my grade</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script> 
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    

    
    <script src="Script/Base.js" type="text/javascript"></script>
</head>
<body>


<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
       
    <h2 class="pathNavigator">
        academic center &gt; my grade</h2>
    <div class="changeViewMainArea">
        <ul>
              <li><a class="tab1" href="registerCourses">Register Courses</a></li>
            <!-- <li><a class="tab2" href="myExam">my exams</a></li> -->
            <li><a class="tab1" href="grade">my grade</a></li>
            <!-- <li><a class="tab2" href="books">books &amp; materials</a></li> -->
        </ul>
    </div>
    <div>
    <select id="termSelect">
    	<option value="noterm">Select Term:</option>
    	<option value="fall2014">Fall 2014</option>
    	<option value="winter2015">Winter 2015</option>
    </select>
    </div>
    <div class="workingSpace" id="gradeTable">
    
    <script>
    // convention: courses taken over more than one term are
    // reported in the final term (ie. the term grade is received in)
    var coursesTaken = [
        {"cID":"COMP1010", "cName":"Introduction to Computer Science", "grade":"A+", "crHrs":3, "term":"fall2014"},
        {"cID":"COMP1020", "cName":"Introduction to Computer Science 2", "grade":"A", "crHrs":3, "term":"fall2014"},
        {"cID":"BIO1000", "cName":"Introduction to Biology", "grade":"A+", "crHrs":3, "term":"winter2015"},
        {"cID":"COMP2160", "cName":"Programming Language Concepts", "grade":"A", "crHrs":3, "term":"winter2015"},
        {"cID":"ECON1010", "cName":"Introduction to Economics", "grade":"B+", "crHrs":6, "term":"winter2015"},
    ];
    
    var table = $('<table/>').appendTo($('#gradeTable'));
    
    $('#termSelect').change(function()
    {
    	// clear previous information
    	$('#gradeTable').empty();
    	
    	var table = $('<table/>').appendTo($('#gradeTable'));
    	$('<tr/>').appendTo(table)
    		.append($('<td width="75"/>').text("course ID"))
    		.append($('<td width="300"/>').text("course name"))
    		.append($('<td width="35"/>').text("grade"));
    	
    	// populate table with courses from the selected term
    	$(coursesTaken).each(function(i, course)
    	{
    		var courseGrade = course.grade;
    		
    		if (course.term == $('#termSelect').val())
    		{
				$('<tr/>').appendTo(table)
					.append($('<td/>').text(course.cID))
					.append($('<td/>').text(course.cName))
					.append($('<td/>').text(courseGrade));
    		}
    	});
    });
    
    $(document).ready(function()
    {
    	// show first row of table now
    	$('<tr/>').appendTo(table)
    		.append($('<td width="75"/>').text("course ID"))
    		.append($('<td width="300"/>').text("course name"))
    		.append($('<td width="35"/>').text("grade"));
    });
    </script>

            </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
