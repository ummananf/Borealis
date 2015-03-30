<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>Degree Progress</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="Script/letterGrade.js" type="text/javascript"></script>
    <script src="Script/trackerScripts/displayTracker.js" type="text/javascript"></script>
</head>
<body>

<jsp:include page="template/header_nav.jsp" />

<div class="rightbox">
                
    <h2 class="pathNavigator">Progress Center</h2>
    <div class="changeViewMainArea"></div>
    <div class="history">
        <div class="history-date">
            <ul id="hData">
            </ul>
        </div>
    </div>

<div id="degreeCourses"></div>

<div class="progress" id="degreeProgress"></div>

<script>
	
	var degrees = ${degreeInfo};
	
	var coursesTaken = ${completedEnrollments};
	
	var degCourses = ${degreeCourses};
	$(document).ready(function()
	{
		displayTracker(degrees, coursesTaken, degCourses);
	});

</script>

</div>
<jsp:include page="template/footer.jsp" />
</body>
</html>