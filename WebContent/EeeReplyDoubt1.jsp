<%@ page import="com.srkr.star.*,java.sql.*"%>
<!DOCTYPE jsp>
<html>
<head><title>Reply Doubts</title>

<script type="text/javascript">

</script>
<style>

select
 {
	
	border-radius:10px;
	outline:none;
	color:black;
	font-size:16px;
	text-align:center;
	padding:5px;
	
 }
 
 
  input[type="submit"]
{
	
	width:40%;
	margin-left:0px;
	border:none;
	outline:none;
	height:30px;
		background:#ffc107;
	color:#fff;
	font-size:18px;
	border-radius:20px;
	
	
}
  input[type="submit"]:hover
{
	cursor:pointer;
	background:#2B3856;
	color:white;'
}
.border
{
	
	border: ridge 2px;
    	background:#008080;
    width: 100%;
    
    overflow: auto;
    margin:0;
		
	
}
.border1
{
	background:	#808080;
	width:13%;
	float:left;
}

.regNo
{
	color:white;
	margin:0px;
	font-size:20px;
	float:left:
}
.date
{
	font-size:16px;
	margin:0px;
	color:green;
	float:left:
}
.doubt
 {
 	outline:none;
 	border:none;
 	width:85%;
 	margin:0;
 	font-size:25px;
 	background:#008080;
 }
 .answer
 {
 	height:30%;
 	width:100%;
 	margin-top:-20;
 	border-bottom:none;
 	font-size:25px;
 }

 body
	{
	margin-left:218px;
	margin-right:226px;
	}
		
				marquee
				{
					font-size:20px;
					
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
					.navbar 
			{
  				overflow: hidden;
  				background-color: #3b5998;
 				
  				
  				width:100%;
			}

			.navbar a 	
			{
  				float: left;
  				display: block;
  				color: #f2f2f2;
  				text-align: center;
  				padding: 8px 19px;
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
		</div>
		
		<div  class="title">
		
			<img src="login.png">
		
		</div>
		<div align="center" class="navbar" >
<a href="eee.jsp">EEE</a>

<a  href="EeeAskDoubt.jsp">Ask a Doubt</a>
 

<a href="EeeReplyDoubt1.jsp">Reply to a Doubt</a>


<a href="EeeViewDoubt1.jsp">View Doubts</a>

<a href="BranchSelection.jsp">Branch Selection</a>

<a href="Logout.jsp">LogOut</a>

</div>
<br>
<div align="center">

<form action="EeeReplyDoubt1.jsp" method="post">
<select name="subject">
							<option>--------Select Subject------</option>
							
							<option>English-1</option>
							<option>Mathematics-1</option>
							<option>Engineering Mechanics</option>
							<option>Engineering Chemistry</option>
							<option>Mathematics-2</option>
							<option>Environmental Studies</option>
							<option>English-2</option>
							<option>Mathematics-3</option>
							<option>Engineering Physics</option>
							<option>Circuit Theory</option>
							<option>Computer Programming Using C</option>
							<option>Engineering Drawing</option>
							<option>Mathematical-4/option>
							<option>Network Analysis & Synthesis</option>
							<option>Electromagnetic Field Theory</option>
							<option>Electrical Measurments & Instruments</option>
							<option>Electronic Devices & Circuits</option>
							<option>Engineering Mechanics & Strength of Materials</option>
							<option>Electrical Machines-1</option>
							<option>Signals & Systems</option>
							<option>Analog Electric Circuits</option>
							<option>Prime Movers & Pumps</option>
							<option>Electrical Power Generation Transmission & Distribution</option>
							
							</select><br/><br/>
		<input type="submit" value="submit">
</form>
<br/>
<br/>
<% 
	String subject=request.getParameter("subject"); 
%>			
<% 
	
	if(subject!=null && subject!="")
	{
		try
		{
				JdbcConnection jc=new JdbcConnection();
				Connection con=jc.getConnection();
				Statement st =  con.createStatement();
				ResultSet rs=st.executeQuery("select * from eeeAskDoubt where subject='"+subject+"'");
				
				
				while(rs.next())
				{%>
					<div  class="border" >
						<form action="EeeReplyDoubt1.jsp"  method="post" autocomplete="off">
							<div align="left" class="border1">
								<p class="regNo"><%= rs.getString("regNo") %></p>
								<p class="date"><%= rs.getString("askDoubt_date") %></p>
							</div>
							<textarea name="doubt" class="doubt"><%= rs.getString("doubt") %></textarea>
							
							<br/>
							<br/>
							<textarea name="answer" rows="" cols="" placeholder="Enter your answer" class="answer"></textarea><br/><br/>
							
		        				<div align="center"><input type="submit" value="POST">
		        				</div>
		        		</form>
		        	</div><br/><br/>
		<%
		}
		}
		catch(Exception e)  
		{
			System.out.println(e);
			
		}
		   	 
	}

%>
<%

	
	String doubt=request.getParameter("doubt");
	String answer=request.getParameter("answer");
	String regNo=(String)session.getAttribute("regNo");
	if(regNo!=null && answer!=null && doubt!=null)
	{
		EeeReplyDoubt c=new EeeReplyDoubt();
		c.setEeeReplyDoubt( regNo,subject,doubt,answer);
		out.println("<script type=\"text/javascript\">");
		out.println("confirm('Posting is successfull  Click ok');");
		out.println("location='eee.jsp';");
		out.println("</script>");
	}
%>
	
		
</div>
	
</body>
</html>
<script>
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
