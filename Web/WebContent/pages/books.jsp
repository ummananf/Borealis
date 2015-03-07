<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>books &amp; materials</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script> 
    <script src="Script/Base.js" type="text/javascript"></script>
</head>
<body>


	<jsp:include page="template/header_nav.jsp" />

            <div class="rightbox">
                
    <h2 class="pathNavigator">
         academic center &gt; books &amp; materials</h2>
    <div class="changeViewMainArea">
        <ul>
              <li><a class="tab1" href="registerCourses">Register Courses</a></li>
            <li><a class="tab2" href="myExam">my exams</a></li>
            <li><a class="tab2" href="grade">my grade</a></li>
            <li><a class="tab1" href="books">books &amp; materials</a></li>
            
        </ul>
    </div>
    <div class="workingSpace">
        <div class="tis red">
            Notices: Students are responsible for buying their own books and materials
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr style="height: 25px" align="center">
                    <th scope="col">
                        #
                    </th>
                    <th scope="col">
                        Name
                    </th>
                    <th scope="col">
                        ISBN
                    </th>
                    <th scope="col">
                    	Author(s)
                    </th>
                    <th scope="col">
                        Price
                    (in book store)</th>
                    <th scope="col">
                        Required/Optional
                    </th>
                </tr>
                
                <tr align="center">
                    <td>
                        1
                    </td>
                    <td>
                       HTML and CSS: Design and Build Websites 
                    </td>
                    <td>
                        978-1118008188 
                    </td>
                    
                    <td>
                        Jon Duckett
                    </td>
                    
                    <td>
                    	$17.39
                    </td>
                    <td>
                    	Require
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        2
                    </td>
                    <td>
                       Data Structures: Abstraction and Design Using Java
                    </td>
                    <td>
                         978-0470128701
                    </td>
                    
                    <td>
                         Paul A. T. Wolfgang 
                    </td>
                    
                    <td>
                         $128.11
                    </td>
                    <td>
                    	Require
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        3
                    </td>
                    <td>
                        Artificial Intelligence: The Basics
                  </td>
                    <td><strong></strong> 978-0415564830</td>
                    
                    <td><span>Kevin Warwick</span>
                        
                    </td>
                    
                    <td>
                        $96.77
                    </td>
                    <td>
                     Optional
                    </td>
                </tr>
                
               
            </tbody>
        </table>
    </div>

            </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
