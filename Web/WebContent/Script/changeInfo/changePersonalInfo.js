 function changePersonalInfo() 
 {
	 var mtitle = "Change Personal Info";
	 var html = 
		 "<div><strong>Leave it blank if you don't need to change.</strong></div><br/><div>new name:<input id='name' name='name'></input><br/>new email: <input id='email' name='email'></input></div>";
	 		
		 var submit = function (v, h, f) {
			 var messageForName = validateName(f.name);
			 var messageForEmail = validateEmail(f.email);
			 
         if (messageForName != "success" && messageForName != "empty") {
             $.jBox.tip(messageForName, 'error', { focusId: "name" }); 
             return false;
         }
         else if(messageForEmail != "success" && messageForEmail != 'empty')
         {
        	 $.jBox.tip(messageForEmail, 'error', { focusId: "email" });
        	 return false;
         }
         else if(messageForName == "empty" && messageForEmail == "empty")
         {
        	 $.jBox.tip("Hold on, You didn't change anything~~",'error');
        	 return false;
         }
         
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
		 $.jBox(html, { title: "Change Info", buttons:{'ok':1}, submit:submit});
 }