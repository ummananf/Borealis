

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>my exam</title><link href="../Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="../Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="../Style/start.css" rel="stylesheet" type="text/css" />
    <script src="../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../Script/Common.js" type="text/javascript"></script>
    <script src="../Script/Data.js" type="text/javascript"></script>
    
    
    <link href="../Style/StudentStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Script/Base.js" type="text/javascript"></script>
</head>
<body>


    <div class="banner">
        <div class="bannerFrame">
            <div class="page">
                <div id="logo">
                    <a href="../main.jsp">
                    <img src="../images/Student/new_logo.png" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topOptions">
                    <select onchange="changeCateory($(this))" style="font-size: 11px; background: #4991cf;
                        color: #fff;">
                        
                        <option 
                            value="4">
                            part time</option>
                        
                        <option selected='selected'
                            value="1">
                            full time</option>
                        
                    </select>
                    77xxxxx student: xx，Welcome back！ <a href="../MyInfo/main.jsp">MyInfo</a> <a href="../User/StudentInfor/annoucements.jsp">
                        anouncement</a> <a href="../User/Account/changePassword.jsp">change psw</a> <a onclick="loginOut()"
                            href="javascript:">logout</a>
                </div>
                <div class="blog_nav">
                  <ul>
                    <li><a href="../main.jsp">myInfo</a></li>
                    <li><a href="../EducationCenter/grade.jsp">services</a></li>
                    <li><a href="../MyAccount/tuition.jsp">tuition</a></li>
                    <li><a href="../OnlineTeaching/materialsDownload.jsp">materials</a></li>
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
                            <a href="../MyInfo/main.jsp">my info</a></div>
                        <div>
                            <a href="../MyInfo/classInfo.jsp">class info </a>
                        </div>
                        <div>
                            <a href="../User/StudentInfor/messages.jsp">messages</a></div>
                        <div>
                            <a href="../User/StudentInfor/annoucements.jsp">dean's info</a></div>
                        <div>
                            <a href="../MyInfo/appeals.jsp">appeals</a></div>
                    </div>
                    <div class="ta1">
                        <strong>academic center</strong>
                        <div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="registerCourses.jsp">register courses</a></div>
						<div>
                            <a href="myExam.jsp">my exam</a></div>
                        <div>
                            <a href="grade.jsp">my grade</a></div>
                        <div>
                            <a href="books.jsp">books &amp; materials</a></div>
                    </div>
                    <div class="ta1">
                        <strong>learning center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="../OnlineTeaching/materialsDownload.jsp"> material download</a></div>
                        <div>
                            <a href="../OnlineTeaching/progressBar.jsp">progress bar</a></div>
                    </div>
                   
                    <div class="ta1">
                        <strong>finance center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="../MyAccount/tuition.jsp">check tuition</a></div>
                    </div>
<div class="ta1">
                        <a href="http://www.google.ca" target="_blank"><strong>teaching system</strong></a>
                        <div class="leftDecoration2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
    <h2 class="pathNavigator">
        academic center &gt; my exam</h2>
    <div class="changeViewMainArea">
        <ul>
            <li><a class="tab1" href="registerCourses.jsp">Register Courses</a></li>
            <li><a class="tab1" href="myExam.jsp">my exams</a></li>
            <li><a class="tab2" href="grade.jsp">my grade</a></li>
            <li><a class="tab2" href="books.jsp">books & materials</a></li>
            
        </ul>
    </div>
    <div class="workingSpace">
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th valign="top">
                    Course Name
                </th>
                
                <th valign="top">
                   Section
                </th>
                
                <th valign="top">
                   Location
                </th>
                
                <th valign="top">
                    Seating Plan
                </th>
                
                <th valign="top">
                    Time Slot
                </th>
                
                <tr>
                	<td align="center">
                    	Comp 2140
                    </td>
                    <td align="center">
                    	A01
                    </td>
                    <td align="center">
                    	Brown Gym
                    </td>
                    <td align="center">
                    	0-115
                    </td>
                    <td align="center">
                    	2:30-4:00
                    </td>
                </tr>
                
                 <tr>
                	<td align="center">
                    	Comp 2160
                    </td>
                    <td align="center">
                    	A02
                    </td>
                    <td align="center">
                    	Gold Gym
                    </td>
                    <td align="center">
                    	2-56
                    </td>
                    <td align="center">
                    	1:30-2:30
                    </td>
                </tr>
               <tr>
                	<td align="center">
                    	Comp 3430
                    </td>
                    <td align="center">
                    	A01
                    </td>
                    <td align="center">
                    	E2 755
                    </td>
                    <td align="center">
                    	2-56
                    </td>
                    <td align="center">
                    	1:30-2:30
                    </td>
                </tr>
               <tr>
                	<td align="center">
                    	Comp 4350
                    </td>
                    <td align="center">
                    	A01
                    </td>
                    <td align="center">
                    	E2 320
                    </td>
                    <td align="center">
                    	2-56
                    </td>
                    <td align="center">
                    	1:30-2:30
                    </td>
                </tr> 
                
                <tr>
                	<td align="center">
                    	Comp 4190
                    </td>
                    <td align="center">
                    	A01
                    </td>
                    <td align="center">
                    	E2 320
                    </td>
                    <td align="center">
                    	1-30
                    </td>
                    <td align="center">
                    	11:30-12:20
                    </td>
                </tr>   
                <th style="text-align: center;">
                    
                </th>
            </tr>
            
            <tr align="center">
                <td colspan="15">
                    <div style="color: #ff0000; font-weight: bold;">
                        No other special info</div>
                </td>
            </tr>
            
        </table>
        
    </div>
    <div class="tis red" style="color: #333; margin-bottom: 20px;">
        <p>
            <strong>Policy：</strong>
        </p>
        <p>
          Students must remain available until all examination and test obligations have been fulfilled   
        </p>
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
