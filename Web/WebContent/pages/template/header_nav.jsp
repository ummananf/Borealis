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
                    <li><a href="myInfo">my info</a></li>
                    <li><a href="grade">academics</a></li>
                    <li><a href="progressBar">progress</a></li>
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
                            <a href="myInfo">my info</a>
                        </div>
                        <div>
                        	<a href="classInfo">class info</a>
                        </div>
                        <div>                        </div>
                        <div>                        </div>
                        <div>                        </div>
                    </div>
                    <div class="ta1">
                        <strong>academic center</strong>
                        <div class="leftDecoration2">
                        </div>
                    </div>

                    <div class="changeViewLeftArea">
                   		<div>
                            <a href="registerCourses">register courses</a>
                        </div>
						<div>
							<a href="grade">gradebook</a>
						</div>
                        <div>                        </div>
                        <div>                        </div>
                    </div>
                    <div class="ta1">
                        <strong>learning center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                    	<div>
                    	<a href="progressBar">degree progress</a>
                    	</div>
                        <div>                        </div>
                    </div>
                   
                    <div class="ta1">
                        <strong>finance center</strong><div class="leftDecoration2">
                        </div>
                    </div>
                    <div class="changeViewLeftArea">
                    	<div>                        </div>
                   	</div>
					<div class="ta1">
						<strong>teaching system</strong>
                        <div class="leftDecoration2">
                        </div>
                    </div>
                </div>
            </div>