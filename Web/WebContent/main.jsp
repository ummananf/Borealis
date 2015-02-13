<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	Borealis
</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.banner .bannerFrame .page .topOptions {
	font-family: Comic Sans MS, cursive;
}
.banner .bannerFrame .page .topOptions a {
	font-family: Comic Sans MS, cursive;
}
</style>
<script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    
<script src="Script/changeOption.js" type="text/javascript"></script>
<script src="Script/rl.js" type="text/javascript"></script>
</head>
<body>



    <div class="banner">
        <div class="bannerFrame">
            <div class="page">
                <div id="logo">
                    <a href="main.jsp">
                        <img src="images/Student/new_logo.png" alt="" width="165" height="48" />
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
                    77xxxxx student：xx，Welcome back！ <a href="MyInfo/main.jsp">MyInfo</a> <a href="User/StudentInfor/annoucements.jsp">
                        anouncement</a> <a href="User/Account/changePassword.jsp">change psw</a> <a onclick="loginOut()"
                            href="javascript:">logout</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="main.jsp">myInfo</a></li>
                        <li><a href="EducationCenter/grade.jsp">services</a></li>
                        <li><a href="MyAccount/tuition.jsp">tuition</a></li>
                        <li><a href="OnlineTeaching/materialsDownload.jsp">materials</a></li>
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
                            <a href="MyInfo/main.jsp">my info</a></div>
                        <div>
                            <a href="MyInfo/classInfo.jsp">class info </a>
                        </div>
                        <div>
                            <a href="User/StudentInfor/messages.jsp">messages</a></div>
                        <div>
                            <a href="User/StudentInfor/annoucements.jsp">dean's info</a></div>
                        <div>
                            <a href="MyInfo/appeals.jsp">appeals</a></div>
                    </div>
                    <div class="ta1">
                        <strong>academic center</strong>
                        <div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="EducationCenter/myExam.jsp">my exam</a></div>
                        <div>
                            <a href="EducationCenter/grade.jsp">my grade</a></div>
                        <div>
                            <a href="EducationCenter/books.jsp">books &amp; materials</a></div>
                    </div>
                    <div class="ta1">
                        <strong>learning center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="OnlineTeaching/materialsDownload.jsp"> material download</a></div>
                        <div>
                            <a href="OnlineTeaching/progressBar.jsp">progress bar</a></div>
                    </div>
                   
                    <div class="ta1">
                        <strong>finance center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="MyAccount/tuition.jsp">check tuition</a></div>
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
        My Zone</h2>

    <div class="innerMainFrame">
        <div class="innerMainFrameTopLeft" style="margin: 0 27px 15px 0;">
            <div class="topLeftFrame">
                <p>
                    You have <span class="red">0</span> annoucements <span class="red">0 </span>unread
                </p>
                <p>
                    You have <span class="red">0 </span>messages <span class="red">0</span> appeals <span class="red">
                        0 </span>opinions
</p>
                <p>&nbsp; </p>
                <div class="btright">
                    <a href="User/StudentInfor/messages.jsp">
                        <img src="images/Student/default/bt_bzr.jpg" alt="send messages to prof" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh2">
            <div class="topLeftFrame">
                <p>
              You have <span class="red">0</span> exams <a href="EducationCenter/myExam.jsp" class="red">check exam schedule</a></p>
                <p>
                   <font color="#FFFF33"> You passed</font> <span class="red">0 </span>courses.&nbsp; There are <span class="red">13</span> in total <a href="EducationCenter/grade.jsp" class="red">check grade</a>
                </p>
                <p>
              <font color="#FFFF00">You need to buy </font> <span class="red">0 </span>books. <a href="EducationCenter/books.jsp" class="red">check booklist</a></p>
                <div class="btright">
                    <a href="EducationCenter/myExam.jsp">
                        <img src="images/Student/default/bt_jw.jpg" alt="academic center" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh3" style="margin: 0 27px 15px 0;">
            <div class="topLeftFrame">
                <p align="center">
                    <a href="">sample exams</a></p>
                <p align="center">
                    <a href="">exercises</a>
                </p>
                <p align="center">
                    <a href="">online homeworks</a></p>
                <div class="btright">
                    <a href="">
                        <img src="images/Student/default/bt_ks.jpg" alt="exam" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh4">
            <div class="topLeftFrame">
                <p>
                    You should pay $<span class="blue">7800.00</span> ，paid $<span class="green">3700.00</span></p>
                    <p>
                    owned $ <span class="red">4100.00</span></p>
                <p>
                    You have <span class="red">3</span> financial rewards to be checkout</p>
                
                <div class="btright">
                    <a href="MyAccount/tuition.jsp">
                        <img src="images/Student/default/bt_cw.jpg" alt="finance cne" width="121" height="25" /></a></div>
            </div>
        </div>
    </div>

    <div class="xxlc">
        <strong class="lcbt">Security track:</strong>
    </div>
    <div class="lcbiao">
        <div class="lctime">
            2015-02-01</div>
        <div class="lctime">
            2015-02-02</div>
        <div class="lctime">
             2015-02-03</div>
        <div class="lctime2">
            2015-02-04</div>
        <div class="lctime">
             2014-02-05</div>
        <div class="lctime">
             2014-02-06</div>
        <div class="lctime">
             2014-02-07</div>
    </div>
    <div class="xxjl">
    
        <div align="center">
        <span>
            18:10 login
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            18:20 logout
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            20:06 login
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            20:50 logout
            
              <a></a>
             
              </span>
            </div>
           
           
    </div>

            </div>
        </div>
        <div class="footer">
            <p align="center">
                &copy;copyright 2015 borealis </p>
        </div>
    </div>
	<div style="text-align:center;">
</div>
</body>
</html>
