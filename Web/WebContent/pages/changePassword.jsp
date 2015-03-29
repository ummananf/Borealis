

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>change password</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />

    <script src="Script/libs/jquery-1.4.2.min.js"></script>
    <script src="Script/libs/jquery.jBox-2.3.min.js"></script> 
    <link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" />
     
<script type="text/javascript" src="Script/changeInfo/changePsw.js"></script>

<style type="text/css">
    .txtinput1{width:180px;}
</style>
</head>
<body>


<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
                
<h2 class="pathNavigator">Change Password</h2>
<div class="workingSpace">
<table border="0" cellspacing="0" cellpadding="0" width="500px" style="margin:30px auto 0px auto;">
    <tr align="center">
        <th style="width:20%; text-align:left;">original:</th>
        <td style="width:70%; text-align:left;"><input id="txtOldPwd" value="" type="password" class="input_2 txtinput1" /></td>
    </tr>
    <tr align="center">
        <th style="width:20%; text-align:left;">new :</th>
        <td style="width:70%; text-align:left;"><input id="txtNewPwd" value="" type="password" class="input_2 txtinput1" />&nbsp;&nbsp;6~16 characters</td>
    </tr>
    <tr align="center">
        <th style="width:20%; text-align:left;">confirm:</th>
        <td style="width:70%; text-align:left;"><input id="txtConfirmNewPwd" value="" type="password" class="input_2 txtinput1" /></td>
    </tr>
    <tr>
    <td colspan="2" style="text-align:center;"><input type="submit" id="btnSubmit" value="confirm" onclick="changePassword()" class="input2" /></td>
    </tr>
</table>
</div>

            </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
