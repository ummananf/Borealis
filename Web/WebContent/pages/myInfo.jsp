<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>My Info</title>
		<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
		<link href="Style/start.css" rel="stylesheet" type="text/css" />
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script src="Script/extractInfo/personalInfo.js" type="text/javascript"></script>
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

	var myInfo = ${userInfo};
	var termInfo = ${termInfo};

	$(document).ready(function()
	{
        showPersonalInfo(myInfo);
    });

</script>	

</div> 
<jsp:include page="template/footer.jsp" />
</body>
</html>