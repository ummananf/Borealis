<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Register Courses</title>
<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
<link href="Style/start.css" rel="stylesheet" type="text/css" />
<<<<<<< HEAD
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="Script/Common.js" type="text/javascript"></script>
<script src="Script/Data.js" type="text/javascript"></script>
=======
<script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
>>>>>>> origin/jasmine
<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
<script src="Script/register.js" type="text/javascript"></script>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

	<jsp:include page="template/header_nav.jsp" />


	<div class="rightbox">

		<h2 class="pathNavigator">Academic Center</h2> <!-- &gt; register courses</h2> -->
		<div class="changeViewMainArea">
			<ul>
				<li><a class="tab1" href="registerCourses">Register Courses</a></li>
				<li><a class="tab2" href="grade">My Grades</a></li> 
			</ul>
		</div>

		<div class="workingSpace">
 
			<form action="" METHOD="POST" onSubmit="">
				<table width="100%">

					Select Term:
					<select id="term">
						<option selected="selected">Select Term:</option>
						<option value="winter2015">Winter 2015</option>
						<option value="fall2014">Fall 2014</option>
					</select>
					<br />
					<br /> Select Category:
					<select id="category">
						<option selected="selected">Select Category</option>
					</select>
				</table>
			</form>
		</div>

		<div id="course_list">
			<table id="course_table" style="width: 100%">
			</table>
		</div>
	</div>

	<jsp:include page="template/footer.jsp" />
	</div>
</body>
</html>