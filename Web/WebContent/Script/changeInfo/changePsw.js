  function changePassword() {
        var oldPwd = $("#txtOldPwd").val();
        var newPwd = $("#txtNewPwd").val();
        var confirmNewPwd = $("#txtConfirmNewPwd").val();
        
        if (oldPwd == "" || newPwd == "" || confirmNewPwd=="") {
            $.jBox.tip("You cannot leave your password empty", 'error');
            return false;
        }
        if (oldPwd.length < 4 || oldPwd.length > 16) {
            $.jBox.tip("The length of the old password should be between 4 and 16 and it is case sensitive", 'error');
            return false;
        }
        if (newPwd.length < 4 || newPwd.length > 16) {
            $.jBox.tip("The length of the new password should be between 4 and 16 and it is case sensitive", 'error');
            return false;
        }
        if (newPwd != confirmNewPwd) {
            $.jBox.tip("The old password and the new password does not match", 'error');
            return false;
        }

       /* studentAccount.changePassword(oldPwd, newPwd, function (data) {
            var obj = $.parseJSON(data);
            if (obj.ok) {
                jBox.alert(obj.message, "notice");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                jBox.tip(obj.message, 'error');
            }
        });
       */
       $(document).ready(function(){
    	        $.post("changePassword",
    	        {
    	          oldPassword: oldPwd,
    	          newPassword: newPwd
    	        },
    	        function(data,status){
    	            alert("Data: " + data + "\nStatus: " + status);
    	        });
    	});
    }