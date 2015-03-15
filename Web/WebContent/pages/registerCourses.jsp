<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>my exam</title>
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
				categoryName : category
			}, function(data) {
				$("#course_table").empty();
				var headers = "<tr><th align='left'>Course ID</th><th align='left'>Course Name</th><th align='left'>Credit Hours</th><th align='left'>Faculty</th><th align='left'>Department</th></tr>";
				$("#course_table").append(headers);
				$.each(data, function(ley, value) {
					var row = "";
					row = "<tr><td>" + value.courseID + "</td><td>" + value.courseName + "</td><td>" + value.creditHrs + "</td><td>" + value.faculty + "</td><td>" + value.dept + "</td><td><button>Register</button></td></tr>";
					$("#course_table").append(row);
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
