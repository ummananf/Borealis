<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page session="true" %>

<!--hint: Use enrollmentInfo to grab session for this page-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>class info</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="Script/extractInfo/classInfo.js" type="text/javascript"></script>
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
		displayClassInfo(mySections, myInfo);
	});

</script>

</div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
