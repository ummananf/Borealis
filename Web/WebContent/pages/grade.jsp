

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>my grade</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    <script src="Script/letterGrade.js" type="text/javascript"></script>
    <script src="Script/Base.js" type="text/javascript"></script>
    <script src="Script/gradeScripts/populateCourseTable.js" type="text/javascript"></script>
    <script src="Script/gradeScripts/prepareTable.js" type="text/javascript"></script>
</head>
<body>


<jsp:include page="template/header_nav.jsp" />
    <div class="rightbox">
       
    <h2 class="pathNavigator">Academic Center</h2>
    <div class="changeViewMainArea">
        <ul>
            <li><a class="tab2" href="registerCourses">Register Courses</a></li>
	    	<li><a class="tab2" href="classInfo">My Courses</a></li>
	    	<li><a class="tab1" href="grade">My Grades</a></li>
        </ul>
    </div>
    <div>
    <select id="termSelect">
    	<option value="noterm">Select Term:</option>
    	<option value="Fall2014">Fall 2014</option>
    	<option value="Winter2015">Winter 2015</option>
    </select>
    </div>
    <div class="workingSpace" id="gradeTable">
    </div>
    
    <script>
    
    $('#termSelect').change(function()
    {
    	$.post("grade", {}, function(enrollsCompleted) {
    		populateCourseTable(enrollsCompleted);
    	});
    	
    	
    });
    
    $(document).ready(function()
    {
    	prepareTable();
    });
    
    </script>

    </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
