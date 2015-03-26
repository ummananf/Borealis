

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>messages</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Style/start.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    
   
        
<script type="text/javascript">
    // a sample JSON application
	
	function returnIndex() {
        window.location = "/Index.aspx";
    }
    function showMsg(msg, obj) {
        jBox.tip(msg);
        $("#" + obj).focus();
    }
    function saveClick(studentId) {
        var Ctitle = $("#Ctitle").val();   //messages title
        if (Ctitle == "" || Ctitle.length>20) {
            showMsg("Please enter your title which should be less than 20 characters", "Ctitle");
            return false;
        }
        var Ctype = $("#Ctype").val();  //message type
        if (Ctype == ("Unselected")) {
            showMsg("Please select your message type", "Ctype");
            return false;
        }
        var Ccontent = $("#Ccontent").val(); //message content
        if (Ccontent == "" || Ccontent.length>80) {
            showMsg("Please enter your message which should be less than 80 chars", "Ccontent");
            return false;
        }
        StudentCompain.insertCompain(studentId, Ctitle, Ctype, Ccontent, function (data) {
            var obj = $.parseJSON(data);
            if (obj.ok == true) {
                jBox.alert(obj.message, "notice");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                jBox.tip(obj.message);
            }
        });
    }
</script>
</head>
<body>


<jsp:include page="template/header_nav.jsp" />



            <div class="rightbox">
                
<h2 class="pathNavigator">my info &gt; messages</h2>
<div class="changeViewMainArea">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="myInfo">myInfo</a> </li>
    <li><a class="tab2" onclick="" href="classInfo">class info</a></li>
    <li><a class="tab1" onclick="" href="messages">messages</a></li>
    <li><a class="tab2" onclick="" href="announcements">announcements<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="appeals">appeals</a></li>
</ul>

</div>
<div class="workingSpace">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:center;" width="5%">#</th>
            <th style="text-align:center;" width="10%">type</th>
            <th width="15%">title</th>
            <th width="20%">content</th>
            <th style="text-align:center;" width="18%">timestamp</th>
            <th style="text-align:center;" width="13%">operation</th>
        </tr>
        
        <tr style="height: 28px" class="tdbg" align="center">
            <td colspan="13" align="left" style="color: Red; font-weight:bold;">no messages</td>
        </tr>
        
    </table>
</div>

<div class="workingSpace">
<h2 class="pathNavigator">send messages</h2>

    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">theme： </div></td>
            <td><input id="Ctitle" size="20" name="Ctitle" class="input_2"/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">message type： </div></td>
            <td>
                <select id="Ctype" name="Ctype">
                    <option value="Unselected">Please choose</option>
                    <option value="1">complain</option>
                    <option value="3">advice</option>
                    <option value="4">question</option>
                    <option value="5">other</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">content： </div></td>
            <td><textarea name="Ccontent" cols="80" rows="5" id="Ccontent" class="input_2"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <div align="center" >
                    <input type="submit" value="sumit" onclick="saveClick('7c50f70a-775b-4aef-8bf2-5010ec612c0d')" class="input2" />
                    <input type="submit" value="return" onclick="returnIndex()" class="input2" />
                </div>
            </td>
        </tr>
    </table>
</div>

            </div>
<jsp:include page="template/footer.jsp" />
</body>
</html>
