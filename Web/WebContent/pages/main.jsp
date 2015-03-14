<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page session="true" %>
<%@ page import="ca.objects.User" %>

<% 
if (session == null)  
{
 System.out.println("session is null");
 String address = "index.jsp";
 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
 dispatcher.forward(request,response);
}
else
{
  // the user *does* have a valid session.
  // do whatever you need to for logged in users.
 User user = (User)session.getAttribute("CURRENT_SESSION_USER");
 String userName = user.getUsername();
 String e_mail = user.getEmail();
 
 System.out.println(userName);  // This is for testing purpose only
 System.out.println(e_mail);  // This is for testing purpose only
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Borealis</title>
		<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
		<link href="Style/start.css" rel="stylesheet" type="text/css" />
		<script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
	    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script>   <!-- this lib is for parsing the json data -->
	    
	    <script>
            var persons = [
                { "name": "John Doe", "studentID": "7777454" }
            ];
            $(document).ready(function() {
                var table = $('<table/>').appendTo($('#welcomeTag'));
                $(persons).each(function(i, person) {
                    $('<tr/>').appendTo(table)
                        .append($('<td/>').text(person.name))
                        .append($('<td/>').text(person.studentID))
                    	.append($('<td/>').text(",Welcome back!"));
                });
            });
        </script>
	</head>
	<body>

<jsp:include page="template/header_nav.jsp" />

Your session ID is
<span id="sessionId"><em><%= request.getSession(true).getId() %></em></span>.


		<div class="rightbox">


    <h2 class="pathNavigator">
        My Zone</h2>

    <div class="innerMainFrame">
        <div class="innerMainFrameTopLeft" style="margin: 0 27px 15px 0;">
            <div class="topLeftFrame">
                <p>
                    You have <span class="red">0</span> announcements <span class="red">0 </span>unread
                </p>
                <p>
                    You have <span class="red">0 </span>messages <span class="red">0</span> appeals <span class="red">
                        0 </span>opinions
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
              You have <span class="red">0</span> exams.
              </p>
                <p>
                   <font color="#FFFF33"> You passed</font> <span class="red">0 </span>courses.&nbsp; There are <span class="red">13</span> in total. 
                </p>
                <p>
              <font color="#FFFF00">You need to buy </font> <span class="red">0 </span>books.
              </p>
                <div class="btright">
<!--                     <a href="myExam.jsp">
                        <img src="images/Student/default/bt_jw.jpg" alt="academic center" width="121" height="25" /></a> -->
                </div>
            </div>
        </div>
        <div class="dh3" style="margin: 0 27px 15px 0;">
            <div class="topLeftFrame">
<!--                 <p align="center">
                    <a href="">sample exams</a></p>
                <p align="center">
                    <a href="">exercises</a>
                </p>
                <p align="center">
                    <a href="">online homeworks</a></p>
                <div class="btright">
                    <a href="">
                        <img src="images/Student/default/bt_ks.jpg" alt="exam" width="121" height="25" /></a>
                </div> -->
            </div>
        </div>
        <div class="dh4">
            <div class="topLeftFrame">
                <p>
                    You should pay $<span class="blue">7800.00</span> ，paid $<span class="green">3700.00</span></p>
                    <p>
                    owned $ <span class="red">4100.00</span></p>
                <p>
                    You have <span class="red">3</span> financial rewards to be checkout</p>
                
<!--                 <div class="btright">
                    <a href="tuition.jsp">
                        <img src="images/Student/default/bt_cw.jpg" alt="finance cne" width="121" height="25" /></a> -->
                </div>

    <!-- <div class="securityDiv">
        <strong class="securityBanner">Security track:</strong>
    </div>
    <div class="trackTable">
        <div class="timeCell">
            2015-02-01</div>
        <div class="timeCell">
            2015-02-02</div>
        <div class="timeCell">
             2015-02-03</div>
        <div class="lctime2">
            2015-02-04</div>
        <div class="timeCell">
             2014-02-05</div>
        <div class="timeCell">
             2014-02-06</div>
        <div class="timeCell">
             2014-02-07</div>
    </div>
    <div class="xxjl">
    
        <div align="center">
        <span>
            18:10 login
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            18:20 logout
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            20:06 login
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            20:50 logout
            
              <a></a>
             
              </span>
            </div>
           
           
    </div> -->

            </div>
        </div>
    </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
