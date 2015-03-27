function logout()
{
	    var message = confirm("Are you sure want to logout?");
	    if (message == true) {
	    	 $.ajax({
	 		    url: "LogoutServlet",
	 		    type: "post",
	 		  }).success(function(result){
	 			 window.location.href = "login";
	 		  });
	    } 
	 
	
};