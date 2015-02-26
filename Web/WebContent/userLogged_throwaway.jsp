<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="ca.servlets.LoginServlet" %>
<%@ page import="ca.objects.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGGED</title>
</head>
<body>
	<center>
   		<%
   			User user = (User) session.getAttribute(LoginServlet.CURRENT_SESSION_USER);
   		%>
			
          <p>Welcome <%= user.getUsername() %> </p>
    </center>
</body>
</html>