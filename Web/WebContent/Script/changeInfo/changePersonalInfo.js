 function changePersonalInfo() 
 {
	 var mtitle = "Change Personal Info";
	 var html = 
		 "<div>name:<input id='name' name='name'></input><br/>email:<input id='email' name='email'></input></div>";
	 		
		 var submit = function (v, h, f) {
			 var messageForName = validateName(f.name);
         if (messageForName != "success") {
             $.jBox.tip(messageForName, 'error', { focusId: "name" }); 
             return false;
         }
         
         /*var messageForEmail = validateEmail(f.email);
         if(messageForEmail != "success" || messageForEmail != 'empty')
         {
        	 $.jBox.tip(messageForEmail, 'error', { focusId: "email" });
        	 return false;
         }*/
         
         $(document).ready(function(){
 	        $.post("myInfo",
 	        {
 	          newName: f.name,
 	          newEmail: f.email
 	        },
 	        function(data,status){
 	        	 $.jBox.tip(data);
 	        });
         });
	}
		 $.jBox(html, { title: "Change Info", submit: submit });
 }