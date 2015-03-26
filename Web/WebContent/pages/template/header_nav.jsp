 		<script src="Script/extractInfo/welcomeTag.js"></script>
		<script src="Script/logout/logout.js"></script>
	    
	    <script>  
	    var persons = ${userInfo};  // get the session info 
        
        $(document).ready(function() {    	
        	parseWelcomeTag(persons);
        });
        
        </script>    
	    
	    
	    <div class="banner">
        <div class="bannerFrame">
            <div class="page">
                <div id="logo">
                    <a href="main">
                    <img src="images/Student/new_logo.png" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topOptions">

                    <div id="welcomeTag" align="right"></div>
                    <a onclick="logout()" href=" ">logout</a>
                </div>
                <div class="blog_nav">
                  <ul>
                    <li><a href="myInfo">Personal</a></li>
                    <li><a href="registerCourses">Academic</a></li>
                    <li><a href="progressBar">Progress</a></li>
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
                        <strong>Personal Center</strong>
                        <div class="leftDecoration">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                    	<div>
                            <a href="myInfo">My Info</a>
                        </div>
                    </div>
                    <div class="ta1">
                        <strong>Academic Center</strong>
                        <div class="leftDecoration2">
                        </div>
                    </div>

                    <div class="changeViewLeftArea">
                   		<div>
                            <a href="registerCourses">Register Courses</a>
                        </div>
                        <div>
                        	<a href="classInfo">My Courses</a>
                        </div>
						<div>
							<a href="grade">My Grades</a>
						</div>
                    </div>
                    <div class="ta1">
                        <strong>Progress Center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                    	<div>
                    	<a href="progressBar">Degree Progress</a>
                    	</div>
                    </div>
                   
                </div>
            </div>