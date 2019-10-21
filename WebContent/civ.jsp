
<%@ page import="com.srkr.star.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>CIV Department</title>

<style>

body
{
	margin-left:218px;
	margin-right:243px;
}
marquee
				{
					font-size:20px;
					margin-right:-16px;
					margin-top:-5px;
					color:black;
				}

	 			 #blink_me 
	  			{
  					animation: blinker 1s linear infinite;
  					animation-duration: 1s;
				}

				@keyframes blinker 
				{
  			   100% {
    					opacity: 0;
  					}
				}
				.news
				{
				position:absolute;
				font-weight: 900;
   				text-align:center;
    			width: 10%;
    			height:4%;
    			color:white;
    			font-size:20px;
    			margin-top:-7px;
    			
    			margin-bottom:0px;
    			float:left;
   				z-index: +1;
    			background:red;
    			border:none;
			}
			.title
			{
			
				
				margin-top:-20px;
				
				margin-bottom:0px;
				
			}
			.navbar 
			{
  				overflow: hidden;
  				background-color: #3b5998;
 				
  				margin-top:-4px;
  				
  				width:102%;
			}

			.navbar a 	
			{
  				float: left;
  				display: block;
  				color: #f2f2f2;
  				text-align: center;
  				padding: 5px 19px;
  				text-decoration: none;
  				font-size: 18px;
			}

			.navbar a:hover 
			{
  				background: #ddd;
  				color: black;
			}
			.navbar a.active 
			{
    			background-color:black;
			}
			
</style>
</head>
<body>
	
<div>
		
		<p class="news"><span id="blink_me">Notifications</span></p>
		<span>	
		<marquee behavior="scroll" scrolldelay="100" scrollamount="3" onmouseover="this.stop();" onmouseout="this.start();">
		Class Work for BTech I,II,III years will commence from 21-10-2019</marquee>
		</span>
		</div><br>
		
		<div  class="title">
		
			<img src="login.png">
		
		</div>	
	


<div align="center" class="navbar" >
<a href="civ.jsp">Civil</a>

<a  href="CivAskDoubt.jsp">Ask a Doubt</a>
 

<a href="CivReplyDoubt1.jsp">Reply to a Doubt</a>


<a href="CivViewDoubt1.jsp">View Doubts</a>

<a href="BranchSelection.jsp">Branch Selection</a>

<a href="Logout.jsp">LogOut</a>

</div>

<div>
<h2>Programs:</h2>

<h3>Vision</h3>
<p>To envision a diverse and stimulating intellectual environment wherein faculty, students and staff can thrive and grow .</p>
<h3>Mission</h3>
<p>To educate students who promote global understanding of social, business, technical and human contexts and contribute to the development of society technologically without compromising with ethical and human values.</p>
<h4>PROGRAM EDUCATIONAL OBJECTIVES(PEOS)</h4>
<h4>PEO1:</h4>
<p>Graduates will have demonstrated a thorough grounding in the fundamental principles of Basic Sciences, English, other Engineering disciplines and practices of Computer Science.</p>
<h4>PEO2:</h4>
<p>Graduates will have undertaken complex problems and developed appropriate technical solutions.</p>
<h4>PEO3:</h4>
<p>Graduates will have demonstrated appropriate professional attitudes and ethics.</p>
</div>
</body>
</html> 