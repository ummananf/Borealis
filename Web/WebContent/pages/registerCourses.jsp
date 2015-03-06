<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>my exam</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    <link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
    <script src="Script/Base.js" type="text/javascript"></script>
    
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function() {
        $('#term').change(function(event) {  
        var $term=$("select#term").val();
           $.get('CourseSelectionServlet',{termName:$term},function(responseJson) {   
        	   var $select = $('#category');                           
               $select.find('option').remove();                          
               $.each(responseJson, function(key, value) {               
                   $('<option>').val(key).text(value).appendTo($select);      
                    });
            });
        });
    });          
</script>
    
</head>
<body>



<jsp:include page="body.jsp" />



            <div class="rightbox">
                
    <h2 class="pathNavigator">
        academic center &gt; my exam</h2>
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
<option value="201512">Winter 2015</option>
<option value="201409">Fall 2014</option>
</select>
<br/>
<br/>
Select Category:
<select id="category">
<option selected="selected">Select Category</option>
</select>   


</table>
</form>
          
            
        
            </div>
        </div>
        
        
        
        <div class="footer">
            <p>
                &copy;copyright 2015 borealis</p>
        </div>
    </div>
</body>
</html>
