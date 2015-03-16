<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>register courses</title>
<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
<link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet"
	type="text/css" />
<link href="Style/start.css" rel="stylesheet" type="text/css" />
<script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="Script/Common.js" type="text/javascript"></script>
<script src="Script/Data.js" type="text/javascript"></script>
<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
<script src="Script/Base.js" type="text/javascript"></script>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {

		$.ajaxSetup({
			cache : false
		});

		$('#term').change(function(event) {
			var $term = $("select#term").val();
			$.post('registerCourses', {
				termName : $term
			}, function(data) {
				var $select = $('#category');
				$select.find('option').remove();
				$.each(data, function(key, value) {
					$('<option>').val(0).text(value.degName).appendTo($select);
				});
			});
		});

		$("#category").change(function(event) {
			var category = $("select#category option:selected").text();
			$.post("registerCourses", {
				categoryName: category
			}, function(data) {
				// clear table so not to append to previous courses
				$("#course_table").empty();
				// add table headers
				var headers = "<tr><th align='left'>Course ID</th><th align='left'>crn</th><th align='left'>Section</th><th align='left'>Capacity</th><th align='left'>Days</th><th align='left'>Start Time</th><th align='left'>End Time</th><th align='left'>Location</th></tr>";
				$("#course_table").append(headers);
				// populate table
				$.each(data, function(key, value) {
					var registerButton = "<button type='button' id='register_" + value.cID + "'>Register</button>";
					var dropButton = "<button type='button' id='drop_" + value.cID + "'>Drop</button>";
					var row = "<tr><td>" + value.cID + "</td><td>" + value.crn + "</td><td>" + value.sectID + "</td><td>" + value.maxSize + "</td><td>" + value.days + "</td><td>" + value.startTime + "</td><td>" + value.endTime + "</td><td>" + value.location + "</td><td>" + registerButton + dropButton + "</td></tr>";
					$("#course_table").append($.parseHTML(row));
					
					// add event handlers to the buttons that were created
					// on register
					$(document).on("click", "#register_" + value.cID, function() { 
						
						var post = $.post("register", {
							action: "register",
							cID: value.cID,
							sectID: value.sectID,
							startDate: value.termStart,
							crn:value.crn
						});
						
						post.done(function(data, textStatus, jqXHR) {
							alert("Successfully registered to " + value.cID + "!");
						});
						
						post.fail(function(jqXHR, textStatus, errorThrown) {
							alert("Registration to " + value.cID + " failed.");
						});
						
					});
					
					// on drop
					$(document).on("click", "#drop_" + value.cID, function() { 
						
						var post = $.post("register", {
							action: "drop",
							cID: value.cID,
							sectID: value.sectID,
							startDate: value.termStart,
							crn: value.crn
						});
						
						post.done(function(data, textStatus, jqXHR) {
							alert("Successfully dropped " + value.cID + "!");
						});
						
						post.fail(function(jqXHR, textStatus, errorThrown) {
							alert("Dropping " + value.cID + " failed.");
						});
						
					});
						
						
				});

			});
		});
	});
</script>

</head>
<body>



	<jsp:include page="template/header_nav.jsp" />



	<div class="rightbox">

		<h2 class="pathNavigator">academic center &gt; my exam</h2>
		<div class="changeViewMainArea">
			<ul>
				<li><a class="tab1" href="registerCourses">Register Courses</a></li>
				<li><a class="tab1" href="myExam">my exams</a></li>
				<li><a class="tab2" href="grade">my grade</a></li>
				<li><a class="tab2" href="books">books & materials</a></li>

			</ul>
		</div>

		<div class="workingSpace">


			<!--  
	<form action="" METHOD="POST" onSubmit="">        
	<table width="100%">
	<tr>
		<td>
		<span>Term:</span>
		<select name="term"  ID="termID">
		<option value="0">None
		<option value="201512">Winter 2015
		<option value="201409">Fall 2014
 	</td>
 </tr>
 
                               
 
 </table>
 
 -->
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
