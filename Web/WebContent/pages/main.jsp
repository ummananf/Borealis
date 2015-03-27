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
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
	   
	</head>
	<body>

<jsp:include page="template/header_nav.jsp" />

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
                </div>
            </div>
        </div>
        <div class="dh3" style="margin: 0 27px 15px 0;">
            <div class="topLeftFrame">
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
                </div>
            </div>
        </div>
    </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
