<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.amazonaws.*" %>
<%@ page import="com.amazonaws.auth.*" %>
<%@ page import="com.amazonaws.services.ec2.*" %>
<%@ page import="com.amazonaws.services.ec2.model.*" %>
<%@ page import="com.amazonaws.services.s3.*" %>
<%@ page import="com.amazonaws.services.s3.model.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.model.*" %>

<%! // Share the client objects across threads to
    // avoid creating new clients for each web request
    //private AmazonEC2         ec2;
    //private AmazonS3           s3;
    //private AmazonDynamoDB dynamo;
 %>

<%
    /*
     * AWS Elastic Beanstalk checks your application's health by periodically
     * sending an HTTP HEAD request to a resource in your application. By
     * default, this is the root or default resource in your application,
     * but can be configured for each environment.
     *
     * Here, we report success as long as the app server is up, but skip
     * generating the whole page since this is a HEAD request only. You
     * can employ more sophisticated health checks in your application.
     */
    if (request.getMethod().equals("HEAD")) return;
%>

<%
//     if (ec2 == null) {
//         AWSCredentialsProvider credentialsProvider = new ClasspathPropertiesFileCredentialsProvider();
//         ec2    = new AmazonEC2Client(credentialsProvider);
//         s3     = new AmazonS3Client(credentialsProvider);
//         dynamo = new AmazonDynamoDBClient(credentialsProvider);
//     }
%>


<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

<meta charset="utf-8">
<title>Borealis Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/login.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>

<body>

<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<img src="images/LOGO2.png" width="150" height="100" >
    </div>
		
			<div class="login_form">
				<form action="index.jsp" id="login_form" method="post">
					<div class="form-group">
						<label for="j_username" class="t">UserName:</label> 
						<input id="username" value="" name="username" type="text" class="form-control x319 in" 
						autocomplete="off">
					</div>
					<div class="form-group">
						<label for="j_password" class="t">Password:</label> 
						<input id="password" value="" name="password" type="password" 
						class="password form-control x319 in">
					</div>
					<div class="form-group">
				    <label class="t"></label>
						<label for="j_remember" class="m">
						<input id="j_remember" type="checkbox" value="true">
						&nbsp;Remember password</label>
					</div>
					<div class="form-group space">
                    	<label class="t"></label>
						<button type="button"  id="submit_btn" 
						class="btn btn-primary btn-lg">Submit </button>
				      <input type="reset" value="reset" class="btn btn-default btn-lg">
					</div>
				</form>
			</div>
		</div>
		<div class="bottom">Copyright &copy; <script type="text/javascript">document.write(new Date().getFullYear())</script> <a href="#">Borealis</a></div>
	</div>
</div>

<!-- Javascript -->

<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/scripts.js"></script>
<div style="text-align:center;">

</div>
</body>
</html>