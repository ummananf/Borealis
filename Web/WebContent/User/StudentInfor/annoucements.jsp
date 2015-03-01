

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>announcements</title><link href="../../Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="../../Style/start.css" rel="stylesheet" type="text/css" />
    <script src="../../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../../Script/Common.js" type="text/javascript"></script>
    <script src="../../Script/Data.js" type="text/javascript"></script>
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
                            <a href="messages.jsp">messages</a></div>
                        <div>
                            <a href="annoucements.jsp">dean's info</a></div>
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
                            <a href="../../EducationCenter/registerCourses.jsp">register courses</a></div>
						<div>
                            <a href="../../EducationCenter/myExam.jsp">my exam</a></div>
                        <div>
                            <a href="../../EducationCenter/grade.jsp">my grade</a></div>
                        <div>
                            <a href="../../EducationCenter/books.jsp">books &amp; materials</a></div>
                    </div>
                    <div class="ta1">
                        <strong>learning center</strong><div class="leftDecoration2">
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
                
<h2 class="pathNavigator">my info &gt; annoucement</h2>
<div class="changeViewMainArea">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="../../MyInfo/main.jsp">myInfo</a> </li>
    <li><a class="tab2" onclick="" href="../../MyInfo/classInfo.jsp">class info</a></li>
    <li><a class="tab2" onclick="" href="messages.jsp">messages</a></li>
    <li><a class="tab2" onclick="" href="annoucements.jsp">annoucement<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="../../MyInfo/appeals.jsp">appeals</a></li>
</ul>

</div>
<div class="workingSpace">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:left;" width="5%">#</th>
            <th style="text-align:left;" width="10%">type</th>
            <th width="15%">title</th>
            <th width="20%">content</th>
            <th style="text-align:left;" width="10%">timestamp</th>
            <th style="text-align:left;" width="8%">operation</th>
        </tr>
        
        <tr style="height: 28px" class="tdbg" align="left">
            <td colspan="13" align="left" style="color: Red; font-weight:bold;">no announcements found for now</td>
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
