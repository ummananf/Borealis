

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>personal info</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
   
</head>
<body>


<jsp:include page="body.jsp" />



            <div class="rightbox">
                
<h2 class="pathNavigator">my info &gt; personal info &nbsp;&nbsp;&nbsp;</h2>       
<div class="changeViewMainArea">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="main">personal info</a> </li>
    <li><a class="tab2" onclick="" href="classInfo">class info</a></li>
    <li><a class="tab2" onclick="" href="messages">messages</a></li>
    <li><a class="tab2" onclick="" href="announcements">announcements<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="appeals">appeals</a></li>
</ul>

</div>
<div class="workingSpace">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" width="129">name</td>
            <td width="99">xxx</td>
            <td align="right" width="101">student Id</td>
            <td width="168">77xxxxx</td>
            
            <td width="326" rowspan="9"><div align="center"><img id="pic_face"  height="160" width="120" src="images/Student/photo.jpg"/ style="padding:2px 2px 5px; border:1px #ddd solid;"></div>&nbsp;</td>
        </tr>
        <tr>
            <td align="right">sex</td>
            <td></td>
            <td align="right">umnetID</td>
            <td></td>
        </tr>
        <tr>
            <td align="right">student type</td>
            <td></td>
            <td align="right">major</td>
            <td></td>
        </tr>
        <tr>
            <td align="right">specialization</td>
            <td></td>
            <td align="right">minor</td>
            <td></td>
        </tr>
        <tr>
            <td align="right">Ungrad/Grad</td>
            <td></td>
            
            <td align="right">entrance Time</td>
            <td></td>
        </tr>
        <tr>
            <td align="right">graduation time</td>
            <td></td>
            <td align="right">status</td>
            <td></td>
        </tr>
        
        <tr>
            <td colspan="4" align="left"><strong>View/Update E-mail Addresses</strong></td>
            
        </tr>
        <tr>
            <td align="right">phone number</td>
            <td>&nbsp;</td>
            <td align="right">alternate phone </td>
            <td></td>
           
        </tr>
        <tr>
            <td align="right">emergency contact</td>
            <td></td>
            <td align="right">email</td>
            <td></td>
            
        </tr>
        <tr>
            <td align="right">addr</td>
            <td colspan="4"></td>
        </tr>
        <tr align="center">
            <td colspan="5" height="40">
                <div align="center">
                    
                    <input type="button" id="button2" value="change contact info" onclick="submitMail()" class="input2" />
                </div>
            </td>
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
