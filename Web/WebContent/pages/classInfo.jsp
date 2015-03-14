<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>class info</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
</head>
<body>


<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
                

<h2 class="pathNavigator">my info &gt; class info</h2>  
<div class="changeViewMainArea">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="myInfo">personal info</a> </li>
    <li><a class="tab2" onclick="" href="classInfo">class info</a></li>
<!--     <li><a class="tab2" onclick="" href="messages">messages</a></li>
    <li><a class="tab2" onclick="" href="announcements">announcements<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="appeals">appeals</a></li> -->
</ul>

</div>
<div class="workingSpace" id="infoTable">
<!-- start of working space and not to break the div structure>
<!-- end of working space -->
</div>

<script>
	var mySections = [
        {"cID":"COMP 1010", "cName":"Introduction to Computer Science",
        "sectID":"A01", "start":"9:30", "end":"10:20", "days":"Mon, Wed, Fri"},
        {"cID":"COMP 1020", "cName":"Introduction to Computer Science 2",
        "sectID":"A02", "start":"10:30", "end": "11:20", "days":"Mon, Wed, Fri"}
    ];
	
	$(document).ready(function()
	{
		var table2 = $('<table/>').appendTo($('#infoTable'));
        $('<tr/>').appendTo(table2)
        	.append($('<td colspan="5"/>').text("Current Courses"));
        $('<tr/>').appendTo(table2)
			.append($('<td width="50"/>').text("section"))
			.append($('<td width="75"/>').text("course"))
			.append($('<td width="225"/>').text("course name"))
			.append($('<td width="75"/>').text("time"))
			.append($('<td width="85"/>').text("days"));
        $(mySections).each(function(i, course)
        {
        	$('<tr/>').appendTo(table2)
    			.append($('<td/>').text(course.sectID))
    			.append($('<td/>').text(course.cID))
    			.append($('<td/>').text(course.cName))
    			.append($('<td/>').text(course.start + "-" + course.end))
    			.append($('<td/>').text(course.days));
        });
	});
</script>

            </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
