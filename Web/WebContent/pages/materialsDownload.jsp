

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<title>material download</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
<link href="Style/start.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
</head>
<body>



<jsp:include page="template/header_nav.jsp" />



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
            <li><strong>Course：</strong>
                
                <a href="#">
                    Comp 2160</a>
                
                <a href="#">
                    Comp 2140</a>
                
                <a href="#">
                    Comp 3430</a>
                
                <a href="#">
                    Comp 4350 </a>
                
                <a href="#">
                    Comp 4190</a>
                
                <a href="#">
                    Comp 4430</a>
            </li>
            <li><strong>type:</strong>
                
                <a href="#">
                    notes</a>
                
                <a href="#">
                    homework</a>
                
                <a href="#">
                    readings</a>
                
                <a href="#">
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
                    <a href='StudentMaterial.jsp?page=2' target='_self'>2</a>
                </div>

                <div class=''>
                    <a href='StudentMaterial.jsp?page=3' target='_self'>3</a>
                </div>

                <div class=''>
                    <a href='StudentMaterial.jsp?page=2' target='_self'>next</a>
                </div>

                <div class=''>
                    <a href='StudentMaterial.jsp?page=3' target='_self'>last</a>
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
<jsp:include page="template/footer.jsp" />
</body>
</html>
