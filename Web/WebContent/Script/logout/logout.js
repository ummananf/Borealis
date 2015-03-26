function logout()
{
	 //$.post("LogoutServlet",function(data){
	        // if you want you can show some message to user here
	 
	 
	//});
	
	    var message = confirm("Are you sure want to logout?");
	    if (message == true) {
	    	 $.ajax({
	 		    url: "LogoutServlet",
	 		    type: "post",
	 		  }).success(function(result){
	 			 alert("logout successfully");
	 		  });
	        txt = "You pressed OK!";
	    } 
	 
	
};