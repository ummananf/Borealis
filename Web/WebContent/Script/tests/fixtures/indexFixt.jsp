<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
 <!-- <script src="Script/Login/login2.js" type="text/javascript"></script> -->
</head>

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
         <strong>For testing purposes: userName: bob password: 4350 (Readme.md contains more testing account names)</strong></font>
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
			
</html>