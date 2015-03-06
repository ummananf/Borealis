

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>my grade</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script> 
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    

    
    <script src="Script/Base.js" type="text/javascript"></script>
</head>
<body>


<jsp:include page="body.jsp" />



            <div class="rightbox">
       
    <h2 class="pathNavigator">
        academic center &gt; my grade</h2>
    <div class="changeViewMainArea">
        <ul>
              <li><a class="tab1" href="registerCourses">Register Courses</a></li>
            <li><a class="tab2" href="myExam">my exams</a></li>
            <li><a class="tab1" href="grade">my grade</a></li>
            <li><a class="tab2" href="books">books & materials</a></li>
            
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
