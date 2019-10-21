<%@ page import="com.srkr.star.*,java.sql.*"%>
<!DOCTYPE jsp>
<html>
<head><title>Reply Doubts</title>

<script type="text/javascript">

</script>
<style>
textarea
{
	background:#D0D0D0
}
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
	
	width:30%;
	margin-left:0px;
	border:none;
	outline:none;
	height:30px;
		background:#2B3856;
	color:#fff;
	font-size:18px;
	border-radius:20px;
	
	
}
  input[type="submit"]:hover
{
	cursor:pointer;
	background:#ffc107;
	color:white;'
}
.border
{
	
	border: ridge 2px;
    	background:#659EC7;
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
 	font-size:22px;
 	background:#659EC7;
 	color:white;
 	min-height:60px;
 }
 .answer
 {
 	min-height:30%;
 	width:100%;
 	margin-top:-20;
 	border-bottom:none;
 	font-size:22px;
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
<body  bgcolor="#728EB2">
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
<a href="cse.jsp">Computer Science</a>

<a  href="CseAskDoubt.jsp">Ask a Doubt</a>
 

<a href="CseReplyDoubt1.jsp">Reply to a Doubt</a>


<a href="CseViewDoubt1.jsp">View Doubts</a>

<a href="BranchSelection.jsp">Branch Selection</a>

<a href="Logout.jsp">LogOut</a>

</div>
<br>
<div align="center">

<form action="CseReplyDoubt1.jsp" method="post">
<select name="subject">
							<option>--------Select Subject------</option>
							<option>English-1</option>
							<option>Mathematics-1</option>
							<option>Mathematics-2</option>
							<option>Engineering Physics</option>
							<option>C-language</option>
							<option>Environmental Studies</option>
							<option>English-2</option>
							<option>Mathematics-3</option>
							<option>Engineering Chemistry</option>
							<option>Object Oriented Programming through C++</option>
							<option>Elements of Electronics Engineering</option>
							<option>Engineering Drawing</option>
							<option>Data Structures</option>
							<option>Elements of Electronic Engineering</option>
							<option>Discrete Mathematical Structures</option>
							<option>Object Oriented Programming</option>
							<option>Digital Logic Design</option>
							<option>Operating System</option>
							<option>Computer Organization</option>
							<option>Microprocessors</option>
							<option>Data Communications</option>
							<option>Advanced Data Structures</option>
							<option>Computer Graphics</option>
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
				ResultSet rs=st.executeQuery("select * from cseAskDoubt where subject='"+subject+"'");
				
				
				while(rs.next())
				{%>
					<div  class="border" >
						<form action="CseReplyDoubt1.jsp"  method="post" autocomplete="off">
							<div align="left" class="border1">
								<p class="regNo"><%= rs.getString("regNo") %></p>
								<p class="date"><%= rs.getString("askDoubt_date") %></p>
							</div>
							<textarea name="doubt" class="doubt" readonly><%= rs.getString("doubt") %></textarea>
							
							<br/>
							<br/>
							 <textarea name="answer" rows="" cols="" placeholder="Enter your answer" class="answer"></textarea><br/><br/>
							<script src="autosize.js"></script>
							<script>
								autosize(document.querySelectorAll('textarea'));
							</script>
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
		CseReplyDoubt c=new CseReplyDoubt();
		c.setCseReplyDoubt( regNo,subject, doubt,answer);
		out.println("<script type=\"text/javascript\">");
		out.println("confirm('Posting is successfull  Click ok');");
		out.println("location='cse.jsp';");
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