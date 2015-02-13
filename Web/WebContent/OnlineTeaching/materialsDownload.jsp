

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>material download</title><link href="../Style/StudentStyle.css" rel="stylesheet" type="text/css" />
<link href="../Style/start.css" rel="stylesheet" type="text/css" />
<script src="../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script src="../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
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
                    <li><a href="../main.jsp">myInfo</a></li>
                    <li><a href="../EducationCenter/grade.jsp">services</a></li>
                    <li><a href="../MyAccount/tuition.jsp">tuition</a></li>
                    <li><a href="materialsDownload.jsp">materials</a></li>
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
                            <a href="../EducationCenter/myExam.jsp">my exam</a></div>
                        <div>
                            <a href="../EducationCenter/grade.jsp">my grade</a></div>
                        <div>
                            <a href="../EducationCenter/books.jsp">books &amp; materials</a></div>
                    </div>
                    <div class="ta1">
                        <strong>learning center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                        <div>
                            <a href="materialsDownload.jsp">material download</a></div>
                        <div>
                            <a href="progressBar.jsp">progress bar</a></div>
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
        learning center &gt; <a href="#">material download</a></h2>
    <div class="feilei">all materials</div>
    <input type="hidden" id="cValue" value="" />
    <div class="fllist">
        <script>
			  $('.selectpicker').selectpicker();
		</script>
        <ul>
            <li><strong>Course：</strong><a href="#" id="cAll" onclick='searchData("","c")'>all</a>
                
                <a href="#" id="8c7743e8-0818-41fa-bc86-44407ca2f773" onclick="searchData('8c7743e8-0818-41fa-bc86-44407ca2f773','c')">
                    Comp 2160</a>
                
                <a href="#" id="e3d9b090-9465-44a1-887c-90d74f7f7899" onclick="searchData('e3d9b090-9465-44a1-887c-90d74f7f7899','c')">
                    Comp 2140</a>
                
                <a href="#" id="f3b98347-fe96-49fc-b076-93bd5855341f" onclick="searchData('f3b98347-fe96-49fc-b076-93bd5855341f','c')">
                    Comp 3430</a>
                
                <a href="#" id="30cfc816-fbc4-4b62-b688-9be0d7b29401" onclick="searchData('30cfc816-fbc4-4b62-b688-9be0d7b29401','c')">
                    Comp 4350 </a>
                
                <a href="#" id="8757ba5a-64eb-4a4d-83f6-aa3740cf1a6f" onclick="searchData('8757ba5a-64eb-4a4d-83f6-aa3740cf1a6f','c')">
                    Comp 4190</a>
                
                <a href="#" id="989d8840-4db1-4081-8c2c-6374d26e5940" onclick="searchData('989d8840-4db1-4081-8c2c-6374d26e5940','c')">
                    Comp 4430</a>
            </li>
            <li><strong>type:</strong><a href="#" id="tAll" onclick="searchData('','t')">all</a>
                
                <a href="#" id="1" onclick="searchData('1','t')">
                    notes</a>
                
                <a href="#" id="2" onclick="searchData('2','t')">
                    homework</a>
                
                <a href="#" id="3" onclick="searchData('3','t')">
                    readings</a>
                
                <a href="#" id="4" onclick="searchData('4','t')">
                    practice exams</a>
                
            </li>
        </ul>
        <div class="workingSpace">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
                <tr>
                <th width="6%">#</th>
                    <th width="44%" style="padding-left: 20px;">
                        material name
                    </th>
                    <th width="20%" style="width: 15%; text-align: center;">
                        type
                    </th>
                    <th width="15%" style="width: 15%; text-align: center;">
                        time added
                    </th>
                    <th width="15%" style="width: 15%; text-align: center;">
                        operation
                    </th>
                </tr>
                
                <tr>
                <td>1</td>
                    <td class="xxleft">
                       Comp 2140 Assignment 1
                    </td>
                    <td>
                        homework
                    </td>
                    <td>
                        2015-2-11
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <button>
                            download
                            </button> </a>
                    </td>
                </tr>
                
                <tr>
                <td>2</td>
                    <td class="xxleft">
                       Comp 2140 Note 1
                    </td>
                    <td>
                        notes
                    </td>
                    <td>
                        2015-2-11
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <button>
                            download
                            </button> </a>
                    </td>
                </tr>
                
                <tr>
                <td>3</td>
                    <td class="xxleft">
                       Comp 2140 reading 1
                    </td>
                    <td>
                        readings
                    </td>
                    <td>
                        2015-2-12
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <button>
                            download
                            </button> </a>
                    </td>
                </tr>
                
               <tr>
                <td>4</td>
                    <td class="xxleft">
                       Comp 2140 practice exam
                    </td>
                    <td>
                        exams
                    </td>
                    <td>
                        2015-2-12
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <button>
                            download
                            </button> </a>
                    </td>
                </tr>
                
                <tr>
                <td>4</td>
                    <td class="xxleft">
                       Comp 3430 practice exam
                    </td>
                    <td>
                        exams
                    </td>
                    <td>
                        2015-2-12
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <button>
                            download
                            </button> </a>
                    </td>
                </tr>     
     
                
            </table>
            <div class='MainStyle'>
                <div class=''>
                    <a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=1' target='_self'>first</a>
                </div>
                
                <div class=''>
                    <a href='javascript:void(0)' target='_self'>previous</a>
                </div>
                
                <div class='NowItemStyle'>
                    <a href='javascript:void(0)' target='_self'>1</a>
                </div>

                <div class=''>
                    <a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=2' target='_self'>2</a>
                </div>

                <div class=''>
                    <a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=3' target='_self'>3</a>
                </div>

                <div class=''>
                    <a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=2' target='_self'>next</a>
                </div>

                <div class=''>
                    <a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=3' target='_self'>last</a>
                </div>

                <div class=''>
                    <b>xx</b> records in total
                </div>
                
                <div class=''>
                    <b>xx</b> records per page
                </div>

                <div class=''>
                    <b>1</b>/10  <!--Both 1 and 10 are dummy values-->
                </div>

                <div class='SearchStyle'>
                    <input type='text' id='page_search' onkeydown="if(event.keyCode == 13){page_searchIndex();}"/> <!--13 is the enter key-->
                </div>

                <div class=''>
                    <input type='button' value='Go' onclick="page_searchIndex()"/>
                </div>
            </div>
            <script>   
                 function page_searchIndex(){
                    var searchText = document.getElementById('page_search');       
                    var searchIndex = searchText != null && searchText.value != '' ? parseInt(searchText.value) : 0;  
                    if(searchIndex > 0 && searchIndex <= 10) {  // The 10 is a dummy value
                        //window.location=     
                    } else {            
                        alert('The request page is out of boundary');        
                    }    
                }
            </script>
        </div>
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
