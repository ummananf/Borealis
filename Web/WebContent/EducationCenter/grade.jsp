

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>my grade</title><link href="../Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="../Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="../Style/start.css" rel="stylesheet" type="text/css" />
    <script src="../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script> 
    <script src="../Script/Common.js" type="text/javascript"></script>
    <script src="../Script/Data.js" type="text/javascript"></script>
    

    
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
                    
					77xxxxx student：xx，Welcome back！ 
					<a href="../MyInfo/main.jsp">MyInfo</a> 
					<a href="../User/StudentInfor/annoucements.jsp">
                        anouncement
					</a> <a href="../User/Account/changePassword.jsp">change psw</a> 
					<a onclick="loginOut()" href="javascript:">logout</a>
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
        academic center &gt; my grade</h2>
    <div class="changeViewMainArea">
        <ul>
            <li><a class="tab2" href="myExam.jsp">my exams</a></li>
            <li><a class="tab1" href="grade.jsp">my grade</a></li>
            <li><a class="tab2" href="books.jsp">books & materials</a></li>
            
        </ul>
    </div>
    <div class="workingSpace">
        <div class="tis red">
            Notices: Please check your grade carefully, and report as soon as possible if you dectect any error</div>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                 <tr> 
                    <th width="162" valign="top" scope="col">
                        <div class="crn">
                            CRN</div>
                     </th>
                     <th width="278">
                        <div class="courseName">
                             Course Name</div>
                      </th>
                      <th width="262">
                      	<div class="grade">
                        	Grade
                        </div>
                      </th>
                      <th width="122">
                   	  <div align="center">operation</div></th>
                 </tr>
                    <tr>
                    	<td>
                        <div align="center">00001 </div></td>
                        <td>
                        <div align="center">Comp 1260 </div></td>
                        <td align="center">
                        <div align="center">A+ </div></td>
                        <td>
                        <button onclick=""> 
                        	appeal
                        </button>
                        <button onclick="">
                        	accept
                        </button>
                        </td>
                    </tr>
                    	
                    <tr>
                    	<td>
                        <div align="center">00002 </div></td>
                        <td align="center">
                         <div align="center">Comp 1270 </div></td>
                         <td><div align="center">A+</div></td>
                         <td>
                         	<button onclick="">
                        	appeal
                        	</button>
                        	<button onclick="">
                        	accept
                        	</button>
                         </td>
                    </tr>
                    <tr>
                    	<td>
                        <div class="crn" align="center">
                            00003</div>
                        </td>
                        <td>
                        <div class="courseName" align="center">Comp 2140</div>
                        </td>
                        <td>
                        <div align="center">A+ </div></td>
                        <td>
                        	<button onclick="">
                        	appeal
                        	</button>
                        	<button onclick="">
                        	accept
                        	</button>
                        </td>
                    </tr>
                    
                   <tr>
                    	<td>
                        <div class="crn" align="center">
                            00004</div>
                        </td>
                        <td>
                        <div class="courseName" align="center">Comp 2160</div>
                        </td>
                        <td>
                        <div align="center">A+ </div></td>
                        <td>
                        	<button onclick="">
                        	appeal
                        	</button>
                        	<button onclick="">
                        	accept
                        	</button>
                        </td>
                    </tr>
                    
                   <tr>
                    	<td>
                        <div class="crn" align="center">
                            00005</div>
                        </td>
                        <td>
                        <div class="courseName" align="center">Comp 2280</div>
                        </td>
                        <td>
                        <div align="center">A+ </div></td>
                        <td>
                        	<button onclick="">
                        	appeal
                        	</button>
                        	<button onclick="">
                        	accept
                        	</button>
                        </td>
                    </tr>
                    
                    <tr>
                    	<td>
                        <div class="crn" align="center">
                            00006</div>
                        </td>
                        <td>
                        <div class="courseName" align="center">Comp 2190</div>
                        </td>
                        <td>
                        <div align="center">A+ </div></td>
                        <td>
                        	<button onclick="">
                        	appeal
                        	</button>
                        	<button onclick="">
                        	accept
                        	</button>
                        </td>
                    </tr>
                </tr>
                
                <tr align="center">
                    <td colspan="15">
                        <div style="color: #ff0000; font-weight: bold;">
                            no other info</div>
                    </td>
                </tr>
                
            </tbody>
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
