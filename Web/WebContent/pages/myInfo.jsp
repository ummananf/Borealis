<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page session="true" %>


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>My Info</title>
		<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
		<link href="Style/start.css" rel="stylesheet" type="text/css" />
	    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
	    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	    
	    
	</head>
<body>

<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
                
<h2 class="pathNavigator">Personal Center</h2>       
<div class="changeViewMainArea">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab1" onclick="" href="myInfo">My Info</a></li>
</ul>

</div>
<div class="workingSpace" id="infoTable">
	<!-- could put change password here -->
</div>



<script type="text/javascript">
	
	var myInfo = ${studentInfo};

	$(document).ready(function()
	{
        var table = $('<table/>').appendTo($('#infoTable'));
        $(myInfo).each(function(i, person)
        {
	        $('<tr/>').appendTo(table)
	        	.append($('<td align="right" width="125"/>').text("name:"))
	        	.append($('<td width="125"/>').text(person.firstName + " " + person.lastName))
	        	.append($('<td align="right" width="125"/>').text("student ID:"))
	        	.append($('<td width="125"/>').text(person.userID));
	        $('<tr/>').appendTo(table)
	    		.append($('<td align="right"/>').text("email:"))
	    		.append($('<td/>').text(person.email))
	    		.append($('<td align="right"/>').text("user name:"))
	    		.append($('<td/>').text(person.username));
	        $(myInfo).each(function(i, degree)
	        {
		        $('<tr/>').appendTo(table)
	    			.append($('<td align="right"/>').text("degree:"))
	    			.append($('<td colspan="3"/>').text(degree.degName));
	        });
	    });
    });
</script>

	

            </div> 
<jsp:include page="template/footer.jsp" />
</body>

</html>
