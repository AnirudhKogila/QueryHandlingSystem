<%@ page import="com.srkr.star.*,java.sql.*"%>

<!DOCTYPE jsp>

<html>

<head>

	
	
	<style type="text/css">
	
				marquee
				{
					font-size:20px;
					margin-left:227px;
					margin-right:222px;
					top:0px;
					color:white;
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
    			margin-top:0px;
    			margin-left:222px;
    			margin-bottom:5px;
    			float:left;
   				z-index: +1;
    			background:red;
    			border:none;
				}
				.title
			{
			
				
				margin-top:-14px;
				
				margin-bottom:0px;
				
			}
			.form
			{
				border:0px;
				padding:10px 400px;
				background-color:#659EC7;
			}
			
			input[type="submit"]
			{
				border:0px solid;
				background-color:#659EC7;
				padding:8px;
				width:67%;
				color:yellow;
				font-size:20px;
				margin-left:222px;
				border-radius:10px;
				
			}
			input[type="submit"]:hover
			{
				cursor:pointer;
				background:#2B3856;
				color:white;'
			}
		
	
	</style>
	
</head>

<body bgcolor="#728EB2">
		<div>
		
		<p class="news"><span id="blink_me">Notifications</span></p>
		<span>	
		<marquee behavior="scroll" scrolldelay="100" scrollamount="3" onmouseover="this.stop();" onmouseout="this.start();">
		Class Work for BTech I,II,III years will commence from 21-10-2019</marquee>
		</span>
		</div><br>
		
		<div  class="title" align="center">
		
			<img src="login.png">
		
		</div>
		<br>
		<br>
	<div>	
 	
	<form action="cse.jsp" method="post">

 	 	<input type="submit" value="Computer Science And Engineering" style="margin-left:">
 	 
 	</form>
		
	<form action="civ.jsp" method="post">
	
		<input type="submit" value="Civil Engineering">
	
	</form>
	
	<form action="ece.jsp" method="post">
	
		<input type="submit" value="Elecronics And Communication Engineering">
	
	</form>
	
	<form action="eee.jsp" method="post">
	
		<input type="submit" value="Electrical And Electronic Engineering">
	
	</form>
	
	<form action="it.jsp" method="post">
	
		<input type="submit" value="Information Technology">
	
	</form>
	
	<form action="mech.jsp" method="post">
	
		<input type="submit" value="Mechanical Engineering">
	
	</form>
	</div>
</body>

</html>