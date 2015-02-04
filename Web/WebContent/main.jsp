<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<p class="center">Bachelors degree in Course Science</p>
		<!-- this value is going to be calculated based on courses completed / total courses left
		(or rather credit hours achieved / total credit hours?) also taking into account required minimum grade
		in each course.  -->
		<progress class="center" value="30" max="100"></progress> 
		
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
</body>
</html>