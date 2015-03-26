<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page session="true" %>

<!--hint: Use enrollmentInfo to grab session for this page-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>class info</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>


<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
                

<h2 class="pathNavigator">Academic Center</h2>  
<div class="changeViewMainArea">
	<ul>
	    <li><a class="tab2" href="registerCourses">Register Courses</a></li>
	    <li><a class="tab1" href="classInfo">My Courses</a></li>
	    <li><a class="tab2" href="grade">My Grades</a></li>
	</ul>


</div>
<div class="workingSpace" id="infoTable">
<!-- start of working space and not to break the div structure>
<!-- end of working space -->
</div>


<script type="text/javascript">
    var mySections = ${enrollmentInfo};
    var myInfo = ${userInfo};
	
    
	$(document).ready(function()
	{
		var table2 = $('<table/>').appendTo($('#infoTable'));
        $('<tr/>').appendTo(table2)
        	.append($('<td colspan="8"/>').text("Current Courses"));
        $('<tr/>').appendTo(table2)
        	.append($('<th width="75"/>').text("Course"))
			.append($('<th width="50"/>').text("Section"))
			.append($('<th width="280"/>').text("Course Name"))
			.append($('<th width="50"/>').text("Credits"))
			.append($('<th width="60"/>').text("Days"))
			.append($('<th width="80"/>').text("Time"))
			.append($('<th width="65"/>').text("Location"))
			.append($('<th width="40"/>').text("Drop\nCourse"));
        $.each(mySections, function(i, enrol)
        {
        	$('<tr/>').appendTo(table2)
    			.append($('<td/>').text(enrol.section.cID))
    			.append($('<td/>').text(enrol.section.sectID))
    			.append($('<td/>').text(enrol.section.course.courseName))
    			.append($('<td/>').text(enrol.section.course.creditHrs))
    			.append($('<td/>').text(enrol.section.days))
    			.append($('<td/>').text(enrol.section.startTime + "-\n" + enrol.section.endTime))
    			.append($('<td/>').text(enrol.section.location))
    			.append($("<td align='center'><button class='btn btn-primary' type='button' id='drop_" + enrol.crn + "'>Drop</button></td>"));
        	
        	// on drop
			$(document).on("click", "#drop_" + enrol.crn, function(event) { 
				
				var post = $.post("register", {
					action: "drop",
					crn: enrol.crn
				});
				
				post.done(function(data, textStatus, jqXHR) {
					alert("Successfully dropped " + enrol.section.cID + "!");
					location.reload(); //to update table
				});
				
				post.fail(function(jqXHR, textStatus, errorThrown) {
					alert("Dropping " + enrol.section.cID + " failed.");
				});
				
			});
        });
        
        $(myInfo).each(function(i, person){
        	$('<tr/>').appendTo(table2).append($('<td colspan="100%"/>').text("Max credit hours: " + person.maxCreditsPerTerm ));
        });
	});
</script>

		</div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
