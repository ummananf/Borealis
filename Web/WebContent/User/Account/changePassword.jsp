

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>change password</title><link href="../../Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="../../Style/start.css" rel="stylesheet" type="text/css" />
    <script src="../../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../Script/Common.js" type="text/javascript"></script>
    <script src="../../Script/Data.js" type="text/javascript"></script>
    
    
<script type="text/javascript" language="javascript">
    function changePassword() {
        var oldPwd = $("#txtOldPwd").val();
        var newPwd = $("#txtNewPwd").val();
        var confirmNewPwd = $("#txtConfirmNewPwd").val();

        if (oldPwd == "" || newPwd == "" || confirmNewPwd=="") {
            $.jBox.tip("You cannot leave your password empty！", 'error');
            return false;
        }
        if (oldPwd.length < 6 || oldPwd.length > 16) {
            $.jBox.tip("The length of the old password should be between 6 and 16 and it is case sensitive！", 'error');
            return false;
        }
        if (newPwd.length < 6 || newPwd.length > 16) {
            $.jBox.tip("The length of the new password should be between 6 and 16 and it is case sensitive！", 'error');
            return false;
        }
        if (newPwd != confirmNewPwd) {
            $.jBox.tip("The old password and the new password does not match", 'error');
            return false;
        }

        studentAccount.changePassword(oldPwd, newPwd, function (data) {
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
    }
</script>

<style type="text/css">
    .txtinput1{width:180px;}
</style>
</head>
<body>

    <div class="banner">
        <div class="bannerFrame">
            <div class="page">
                <div id="logo">
                    <a href="../../main.jsp">
                        <img src="../../images/Student/new_logo.png" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topOptions">
                  <select name="select" style="font-size: 11px; background: #4991cf;
                        color: #fff;" onchange="changeCateory($(this))">
                      <option 
                            value="4"> part time</option>
                      <option selected='selected'
                            value="1"> full time</option>
                    </select>
                      77xxxxx student: xx，Welcome back！ <a href="../MyInfo/main.jsp">MyInfo</a> <a href="../User/StudentInfor/annoucements.jsp">
                        anouncement</a> <a href="../User/Account/changePassword.jsp">change psw</a> <a onclick="loginOut()"
                            href="javascript:">logout</a>
                </div>
                <div class="blog_nav">
                  <ul>
                    <li><a href="../../main.jsp">myInfo</a></li>
                    <li><a href="../../EducationCenter/grade.jsp">services</a></li>
                    <li><a href="../../MyAccount/tuition.jsp">tuition</a></li>
                    <li><a href="../../OnlineTeaching/materialsDownload.jsp">materials</a></li>
                  </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="mainArea">
            <div class="leftArea">
                <div class="leftAreaNavigate">
                    <div class="ta1">
                        <strong>personal center</strong>
                        <div class="leftDecoration">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="../../MyInfo/main.jsp">my info</a></div>
                        <div>
                            <a href="../../MyInfo/classInfo.jsp">class info </a>
                        </div>
                        <div>
                            <a href="../StudentInfor/messages.jsp">messages</a></div>
                        <div>
                            <a href="../StudentInfor/annoucements.jsp">dean's info</a></div>
                        <div>
                            <a href="../../MyInfo/appeals.jsp">appeals</a></div>
                    </div>
                    <div class="ta1">
                        <strong>academic center</strong>
                        <div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="../../EducationCenter/myExam.jsp">my exam</a></div>
                        <div>
                            <a href="../../EducationCenter/grade.jsp">my grade</a></div>
                        <div>
                            <a href="../../EducationCenter/books.jsp">books &amp; materials</a></div>
                    </div>
                    <div class="ta1">
                        <strong>learning center</strong>
                        <div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="../../OnlineTeaching/materialsDownload.jsp">material download</a></div>
                        <div>
                            <a href="../../OnlineTeaching/progressBar.jsp">progress bar</a></div>
                    </div>
                   
                    <div class="ta1">
                        <strong>finance center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="../../MyAccount/tuition.jsp">check tuition</a></div>
                    </div>
<div class="ta1">
                        <a href="http://www.google.ca" target="_blank"><strong>teaching system</strong></a>
                        <div class="leftDecoration2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
<h2 class="pathNavigator">my info &gt; change password</h2>
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
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2015 borealis</p>
        </div>
    </div>
</body>
</html>
