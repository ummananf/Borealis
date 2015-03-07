<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>announcements</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
</head>
<body>

<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
                
<h2 class="pathNavigator">my info &gt; annoucement</h2>
<div class="changeViewMainArea">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="myInfo">myInfo</a> </li>
    <li><a class="tab2" onclick="" href="classInfo">class info</a></li>
    <li><a class="tab2" onclick="" href="messages">messages</a></li>
    <li><a class="tab2" onclick="" href="announcements">annoucement<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="appeals">appeals</a></li>
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
<jsp:include page="template/footer.jsp" />
</body>
</html>
