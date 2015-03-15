<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page session="true" %>


<%

System.out.println(session.getAttribute("studentInfo"));


%>




<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>personal info</title>
		<link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
		<link href="Style/start.css" rel="stylesheet" type="text/css" />
	    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
	    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    
	    
	 	<script type="text/javascript">
	$(document).ready(function() {
	 $("#tablediv").hide();
	     $("#showTable").click(function(event){
	           $.get('myInfo',function(responseJson) {
	            if(responseJson!=null){
                $("#countrytable").find("tr:gt(0)").remove();
                var table1 = $("#countrytable");
               $.each(responseJson, function(key,value) {
	                        rowNew.children().eq(0).text(value['userID']);
                        rowNew.children().eq(1).text(value['username']);
                        rowNew.children().eq(2).text(value['password']);
                        rowNew.children().eq(3).text(value['email']);
                       rowNew.children().eq(5).text(value['capitfNamea']);
	                        rowNew.appendTo(table1);
	                });
	            }
	            $("#tablediv").show();         
	  });     
	});   
	    </script>
	    
	    
	    
	    
	    
	    
	</head>
<body>

<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
                
<h2 class="pathNavigator">my info &gt; personal info &nbsp;&nbsp;&nbsp;</h2>       
<div class="changeViewMainArea">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="myInfo">personal info</a> </li>
    <li><a class="tab2" onclick="" href="classInfo">class info</a></li>
<!--    <li><a class="tab2" onclick="" href="messages">messages</a></li>
    <li><a class="tab2" onclick="" href="announcements">announcements<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="appeals">appeals</a></li> -->
</ul>

</div>
<div class="workingSpace" id="infoTable"></div>

<script type="text/javascript">
	
	/*var myInfo = [
		{"fName": "John", "lName":"Doe", "sID": "7777454",
		"username": "johndoe", "email": "johndoe@school.ca"}
	];*/
	
	//var myInfo = '@Session["studentInfo"]';
	//var myInfo = session.getAttribute("studentInfo");
	 var myInfo = ${studentInfo};

	var myDegrees = [
	    {"degName":"Computer Science - Honours"}
	];

	$(document).ready(function()
	{
        var table = $('<table/>').appendTo($('#infoTable'));
        $(myInfo).each(function(i, person)
        {
	        $('<tr/>').appendTo(table)
	        	.append($('<td align="right" width="125"/>').text("name:"))
	        	.append($('<td width="125"/>').text(person.firstName + " " + person.lastName))
	        	.append($('<td align="right" width="125"/>').text("student ID:"))
	        	.append($('<td width="125"/>').text(person.userID));
	        $('<tr/>').appendTo(table)
	    		.append($('<td align="right"/>').text("email:"))
	    		.append($('<td/>').text(person.email))
	    		.append($('<td align="right"/>').text("user name:"))
	    		.append($('<td/>').text(person.username));
	        $(myDegrees).each(function(i, degree)
	        {
		        $('<tr/>').appendTo(table)
	    			.append($('<td align="right"/>').text("degree:"))
	    			.append($('<td colspan="3"/>').text(degree.degName));
	        });
	    });
    });
</script>

            </div>
            
 <h1>AJAX Retrieve Data from Database in Servlet and JSP using JSONArray</h1>
	<input type="button" value="Show Table" id="showTable"/>
	<div id="tablediv">
	<table cellspacing="0" id="countrytable">
	    <tr>
	        <th scope="col"></th>
	        <th scope="col"></th>
	        <th scope="col"></th>
            <th scope="col"></th>
	        <th scope="col"></th>
	    </tr>
	</table>
	</div>           
            
   
<jsp:include page="template/footer.jsp" />
</body>

</html>
