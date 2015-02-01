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
    private AmazonEC2         ec2;
    private AmazonS3           s3;
    private AmazonDynamoDB dynamo;
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
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>Borealis</title>
    <link rel="stylesheet" href="styles/styles.css" type="text/css" media="screen">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script> 
	$(document).ready(function(){
	    $("button").click(function(){
	        $("h1").fadeOut();
	    });
	});
	</script> 
</head>
<body>
    <div id="content" class="container">
    	<button>click for magic</button>
    	<h1>hello</h1>
    </div>
</body>
</html>