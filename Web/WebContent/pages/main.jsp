<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page session="true" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Borealis</title>
		<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
		<link href="Style/start.css" rel="stylesheet" type="text/css" />
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>     	  
	</head>
	<body>

<jsp:include page="template/header_nav.jsp" />

		<div class="rightbox">

    <h2 class="pathNavigator">
        My Zone</h2>

    <div class="innerMainFrame">
        <div class="innerMainFrameTopLeft" style="margin: 0 27px 15px 0;">
            <div class="topLeftFrame" id="askProfessor">
                <p>
                    You have registered <span class="red" id="winter2015"> </span> credit hours in winter 2015 
                </p>
                
                <p>
                    You have registered <span class="red" id="fall2014"> </span> credit hours in fall 2014  
				</p>
                <p>&nbsp; </p>
                <div class="btright">
<!--                     <a href="messages.jsp">
                        <img src="images/Student/default/bt_bzr.jpg" alt="send messages to prof" width="121" height="25" /></a> -->
                </div>
            </div>
        </div>
        <div class="dh2">
            <div class="topLeftFrame">
                <p>
              Your GPA is<span class="red" id="gpa"></span> .
              </p>
                <p>
                   <font color="#FFFF33"> You passed</font> <span class="red" id="numCompleted"></span>courses.&nbsp; There are <span class="red" id="numTotalEnrolled"></span> courses you have enrolled in history. 
                </p>
                <div class="btright">
                </div>
            </div>
        </div>
        <div class="dh3" style="margin: 0 27px 15px 0;">
            <div class="topLeftFrame">
            </div>
        </div>
        <div class="dh4">
            <div class="topLeftFrame">

                </div>
            </div>
        </div>
    </div>
<jsp:include page="template/footer.jsp" />


	<script>  
	    	var otherInfo = ${otherInfo};  // get the session info

	    	document.getElementById("winter2015").innerHTML =
	    		otherInfo.winter2015CreditHours;
	    	document.getElementById("fall2014").innerHTML = 
	    		otherInfo.fall2014CreditHours;
	    	document.getElementById("gpa").innerHTML = 
	    		otherInfo.gpa;
	    	document.getElementById("numCompleted").innerHTML = 
	    		otherInfo.numCompleted;
	    	document.getElementById("numTotalEnrolled").innerHTML = 
	    		otherInfo.numTotalEnrolled;
      </script> 
</body>
</html>
