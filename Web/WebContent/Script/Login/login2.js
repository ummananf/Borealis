// JavaScript Document
//Press enter to login
document.onkeydown = function(e)
{
	if($(".bac").length==0)
	{
		if(!e) e = window.event;
		if((e.keyCode || e.which) == 13) // notice: 13 corresponds to the Enter key
		{
			var obtnLogin=document.getElementById("submit_btn");
			obtnLogin.focus();
		}
	}
};

$(function()
{
	//submit form
	$('#submit_btn').click(function()
	{
		
//		show_loading();
		var myReg = /^[a-zA-Z0-9]+$/; //We only allow the name to be English letters or numbers
		if($('#username').val() == '')
		{
			show_err_msg('You cannot leave your name empty');	
			$('#username').focus();
		}
		else if(!myReg.test($('#username').val()))
		{
			show_err_msg('Your user name contains non English characters or numbers!!!');
			$('#username').focus();
		}
		else if($('#password').val() == '')
		{
			show_err_msg('Wait, where is your password?');
			$('#password').focus();
		}
		else
		{
			//ajax submit form，#login_form is form's ID. example：$('#login_form').ajaxSubmit(function(data) { ... });
	//		show_msg('Redirecting...' , '/');
			$(login_form).submit();

		}
	});
});