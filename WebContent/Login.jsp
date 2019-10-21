<%@page import="com.srkr.star.Login" contentType="text/html" pageEncoding="UTF-8"%>  
<jsp:useBean id="form" class="com.srkr.star.Login" scope="request">  
        <jsp:setProperty name="form" property="errorMessages" value='<%= errorMap %>'/>  
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>

<style>
				
				marquee
				{
					font-size:20px;
					margin-left:218px;
					margin-right:227px;
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
    			margin-left:218px;
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
 				
  				margin-top:-5px;
  				margin-left:218px;
  				width:67.10%;
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
			.title
			{
			
				
				margin-top:-20px;
				margin-left:218px;
				margin-bottom:0px;
				
			}
 		.outerBox
 		{
            border:2px none;
         	width:65.60%;
            margin-top:10px; 
			margin-left:218px;
			padding:15px 10px;
			background-color:#659EC7;
			
		}

		label
 		{
			font-family:Arial;
			line-spacing:10px;
			width:300px;
			font-size:18px;
			color:white;
			margin-left:5px;
			margin-right:0;
			letter-spacing:1.5px;
 		}
 		input[type="text"],input[type="password"]
		{
	
	margin-left:0px;
	border:none;
	outline:none;
	font-align:center;
	font-size:16px;
	text-align:center;
	padding:6px;
	border-radius:25px;
	cursor:pointer;
	caret-color:blue;
 }
input[type="submit"],input[type="reset"]
{
	
	 padding:6px 164px;
	 margin-left:3px;
	 border-radius:20px;
	 background:#2B3856;
	 text-decoration:none;
	 font-size:15px;
	 outline:none;
	 color:white;
}
input[type="submit"]:hover
{
	cursor:pointer;
	background:#2B3856;
	color:white;'
}
input[type="reset"]:hover
{
	cursor:pointer;
	background:#2B3856;
	color:white;	
}
.text2
{
	margin-left:-5px;
}
a
{
	text-decoration:none;
	font-size:18px;
	color:#2B3856;
}			
font
{
	color:yellow;
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
		</div><br>
		
		<div  class="title">
		
			<img src="login.png">
		
		</div>
		
		
	
	
	<%  
         if ("true".equals(request.getParameter("process"))) 
        	 
         {
        	 
    %>  
         <jsp:setProperty name="form" property="*" /> 
          
    <%  
         	if (form.process())
  		 	{  
  
				HttpSession hs=request.getSession();  

				hs.setAttribute("regNo",(String)request.getParameter("regNo")); 

				hs.setAttribute("password",(String)request.getParameter("password"));  

				response.sendRedirect("BranchSelection.jsp");  

  		 	}  
            
		}  
  
  
    %>    
	
	<br><br>
	<div class="outerBox">
	
	<form action='<%=request.getRequestURI()%>' method="POST" autocomplete="off">

	<table style="width:cover;"> 
	 
         <tbody>  
                                                                          
             <tr>  
                 <td><label>User ID<br></label></td>
             </tr>
             <tr>                     
                 <td><input type="text" name="regNo" value='<%=form.getRegNo()%>'size="40%" placeholder="Please Enter Your Registration Number" /></td> 
                                   
                 <td><font><%=form.getErrorMessage("regNo") %></font></td> 
             </tr>  
                             
             <tr>  
                 <td><label>Password</label></td>
             </tr>
             <tr>                      
                 <td><input type="password" name="password" value='<%=form.getPassword()%>' size="40%"  placeholder="please Enter Password"/></td>  
                                  
                 <td><font><%=form.getErrorMessage("password") %></font></td>  
             </tr>  
                              
         </tbody>  
     </table><br/>  
     
     <input type="submit" value="LogIn">
                      
     <input type="HIDDEN" name="process" value="true" >
     
     <!--  <input type="reset" value="Clear" >-->
      
     </form>
     
     <br>
                      
	<form action="Register.jsp" method="post">
	
		<input type="submit" value="Sign Up" style="padding:6px 157px;">
		
	</form>
	
	
	</div>

</body>

</html>

<%!
        java.util.Map errorMap = new java.util.HashMap(); 

        public void jspInit()  
        {  
              
            errorMap.put(Login.ERR_REGNO_BLANK, "PLEASE ENTER YOUR REGISTRATION NUMBER");
            
            errorMap.put(Login.ERR_REGNO_LENGTH, "LENGTH SHOULD BE 10");   
            
            errorMap.put(Login.ERR_REGNO_INVALID, "INVALID REGISTRATION NUMBER #");
            
            errorMap.put(Login.ERR_REGNO_NOTEXISTS, "REGISTRATION NUMBER DOES NOT EXISTS"); 
            
            errorMap.put(Login.ERR_PASSWORD_BLANK, "PLEASE ENTER YOUR PASSWORD");  
     
            errorMap.put(Login.ERR_PASSWORD_INCORRECT, "PASSWORD INCORRECT");  
            
        }   
%>  