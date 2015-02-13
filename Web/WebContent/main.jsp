<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ca.servlets.Login" %>
<%@ page import="ca.objects.User" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="styles/main.css" type="text/css" media="screen">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>Main Menu</title>
</head>
<body>
	<div id="degree_tracker">
	
		<!-- degree title -->
		
		<p class="center">Bachelors degree in Course Science</p>
		
		<% User user = (User) session.getAttribute(Login.CURRENT_SESSION_USER); %>
			
          <p>Welcome! You have logged in: <br/> username:<%= user.getUsername() %> <br/> password:<%= user.getPassword() %> <br/> Congratulations! </p>
		
		<!-- this value is going to be calculated based on courses completed / total courses left
		(or rather credit hours achieved / total credit hours?) also taking into account required minimum grade
		in each course.  -->
		
		<progress class="center" value="30" max="100"></progress> 
		
		<p style="color:red">The course names can be links to the course info. We can also include the grade achieved
		in each course. This section should also be more compact since students may take lots of courses and we want
		to keep everything tight so people won't have to scroll through a whole page of just the courses they took.
		maybe make this div scrollable instead of stretching it when new elements are added.
		<br>
		Some more ideas:
		<br>
		- maybe add a "drop course" button beside the current courses?
		<br>
		- a "search courses" button at the bottom of this div (or somewhere else around here)?</p>
		
		<!-- here we will load ALL courses required for the degree, and then pull all courses that the student
		have taken or is currently taking and match the css class so the course names are highlighted accordingly.
		for example, courses already taken (and achieved the minimum grade requirement) are highlighted green, 
		courses currently taken are bold, and future courses gray. -->
		
		<p class="completed">COURSE 1010: Intro To Courses</p>
		<p class="completed">COURSE 1020: Second Intro To Courses</p>
		<p class="completed">COURSE 1210: Topics In Courses</p>
		<p class="current">COURSE 2080: Advanced Courses</p>
		<p class="current">COURSE 2345: Can I make It?</p>
		<p class="current">ELECTIVE 1340: Intro to Electives</p>
		<p class="future">COURSE 3690: Super Advanced Course</p>
		
	</div>
		
	<div id="schedule">
	
		<p class="center">Schedule</p>
		

		
		<!-- this is a full blown feature so it's not ready yet... -->
		
		<p style="color:red">Schedule should be similar to the one in Aurora. Some ideas:
		<br>
		- tag special events (exams, midterms and assignments due if such info is available)</p>
	
	</div>
</body>
</html>