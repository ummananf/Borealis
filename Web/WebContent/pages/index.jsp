<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="utf-8">
		<title>Borealis Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link href="Style/supersized.css" rel="stylesheet">
		<link href="Style/login.css" rel="stylesheet">
		<link href="Style/bootstrap.min.css" rel="stylesheet">
		<script src="Script/Login/jquery-1.8.2.min.js"></script>
		<script src="Script/Login/jquery.form.js" type="text/javascript"></script>
		<script src="Script/Login/tooltips.js" type="text/javascript"></script>
		<script src="Script/Login/login.js" type="text/javascript"></script>
	</head>

<body>

<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<img src="images/new_logo.png" width="204" height="70" >
    </div>
		
			<div class="login_form">
				<form action="login" id="login_form" method="post" name="login" onSubmit="return">
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
						<font color="#CC0000">
         <strong>For testing purposes: userName: student1 password: password</strong></font>
					</div>
                    
					<div class="form-group">
				    <label class="t"></label>
						<label for="j_remember" class="m">
						<input id="j_remember" type="checkbox" value="true">
						&nbsp;Remember password</label>
					</div>
					<div class="form-group space">
                    	<label class="t"></label>
						
						<button type="button"  id="submit_btn"  class="btn btn-primary btn-lg">Submit </button>
						
				      <input type="reset" value="reset" class="btn btn-default btn-lg">
					</div>
				</form>
			</div>
		</div>
		<div class="bottom">Copyright &copy; <script type="text/javascript">document.write(new Date().getFullYear())</script> <a href="#">Borealis</a></div>
	</div>
</div>

<!-- Javascript -->

<script src="Script/Login/supersized.3.2.7.min.js"></script>
<script src="Script/Login/supersized-init.js"></script>
<script src="Script/Login/scripts.js"></script>
<div style="text-align:center;">

</div>
</body>
</html>
