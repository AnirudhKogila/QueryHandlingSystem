<%@page import="com.srkr.star.Register" contentType="text/html" pageEncoding="UTF-8"%>  
<jsp:useBean id="form" class="com.srkr.star.Register" scope="request">  
        <jsp:setProperty name="form" property="errorMessages" value='<%= errorMap %>'/>  
</jsp:useBean>  
  
<html>
<head>
	<title>Registration form</title>
<style type="text/css">
font
{
	letter-spacing:2px;
	color:orange;
}
marquee
				{
					font-size:20px;
					margin-left:218px;
					margin-right:211px;
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
    			margin-left:218px;
    			margin-bottom:5px;
    			float:left;
   				z-index: +1;
    			background:red;
    			border:none;
			}
		
			
			
			.title
			{
				width:90%;
				height:150%;
				margin-top:2px;
				margin-left:218px;
				
			}
input[type="text"],input[type="password"]
 {
	
	margin-left:0px;
	border:none;
	outline:none;
	font-align:center;
	font-size:16px;
	text-align:center;
	padding:5px;
	border-radius:25px;
	cursor:pointer;
	caret-color:red;
 }
input[type="submit"],input[type="reset"]
{
	
	 padding:6px 155px;
	 margin-left:200px;
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

p.text1
{
	text-align:center;
	font-size:20px;
	margin-right:60px;
	margin-top:10px;
	color:blue;
			
}
.outerBox{
            border:2px none;
            background-color:#659EC7;
            border-color:#1589FF; 
			margin-left:218px;
			margin-right:210px;
			
			margin-top:-810px;
			padding:10px 10px;
			
			
			}
p.text1
{
	text-align:right;
	font-size:20px;
	margin-right:60px;
	margin-top:10px;
	color:blue;
			
}
label
{
	font-family:Arial;

	width:300px;
	font-size:20px;
	color:white;
	margin-left:0px;
	margin-right:0;
	letter-spacing:1.5px;
}
.select
 {
	
	border-bottom-width:1.8px;
	font-align:center;
	font-size:16px;
	text-align:center;
	padding:6px;
	border-radius:25px;
	cursor:pointer;
	outline:none;
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
		</div>
		
		<div  class="title">
		
	
			<img src="login.png">
		
		</div>
		
		
	
<div>
	
	<%
          
        if ("true".equals(request.getParameter("process"))) {  
   %>  
            <jsp:setProperty name="form" property="*" />  
    <%  
              
            if (form.process())
  
            {  
  
				HttpSession hs=request.getSession();  
				hs.setAttribute("firstName",(String)request.getParameter("firstName"));  
				hs.setAttribute("lastName",(String)request.getParameter("lastName")); 
				hs.setAttribute("regNo",(String)request.getParameter("regNo")); 
				hs.setAttribute("branch",(String)request.getParameter("branch"));  
				hs.setAttribute("year",(String)request.getParameter("year"));  
				hs.setAttribute("email",(String)request.getParameter("email"));  
				hs.setAttribute("mobile",(String)request.getParameter("mobile"));  
				hs.setAttribute("userName",(String)request.getParameter("userName"));  
				hs.setAttribute("password",(String)request.getParameter("password"));  
				hs.setAttribute("confirmPassword",(String)request.getParameter("confirmPassword"));  
				
				//response.sendRedirect("Login.jsp");  
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Registration is successfull  Click ok to Login');");
				out.println("location='Login.jsp';");
				out.println("</script>");
   }  
            
}  
  
  
    %>    
      

	
	
	
	<div class="outerBox">
		 <form action='<%=request.getRequestURI()%>' method="POST" autocomplete="off">
			  <table style="width:cover;">  
                              <tbody>  
                              <tr>  
                                  <td><label>First Name</label></td>  
                                  <td><input type="text" name="firstName" value='<%=form.getFirstName()%>' size="40%" placeholder="Please Enter Your First Name"/></td>  
                                  <td><font><%=form.getErrorMessage("firstName") %></font></td>  
                              </tr>
                              <tr>
                              	<td></td>
                              </tr>  
                              <tr>  
                                  <td><label>Last Name</label></td>  
                                  <td><input type="text" name="lastName" value='<%=form.getLastName()%>' size="40%" placeholder="Please Enter Your Surname"/></td>  
                                  <td><font><%=form.getErrorMessage("lastName") %></font></td>  
                              </tr>                                                           
                              <tr>  
                                  <td><label>Reg Number</label></td>  
                                  <td><input type="text" name="regNo" value='<%=form.getRegNo()%>'size="40%" placeholder="Please Enter Your Registration Number" /></td>  
                                  <td><font><%=form.getErrorMessage("regNo") %></font></td>  
                              </tr>  
                              
                              <tr>  
                                  <td><label>Branch</label></td>  
                                  <td><select name="branch" required class="select">  
                                         <option value="" disabled selected>Select Branch</option>
										 <option >Computer Science</option>
										 <option >Civil</option>
										 <option >Electronic</option>
										 <option >Electrical</option>
										 <option >Information Technology</option>
										 <option >Mechanical</option>
                                      </select></td>  
                              </tr>
                               <tr>  
                                  <td><label>Year</label></td>  
                                  <td><select name="year" required class="select">  
                                    	<option value="" disabled selected>Select Year</option>
										<option >First Year</option>
										<option >Second Year</option>
										<option >Third Year</option>
										<option >Fourth Year</option>
                                      </select></td>  
                              </tr>
                              <tr>  
                                  <td><label>Email ID</label></td>  
                                  <td><input type="text" name="email" value='<%=form.getEmail()%>' size="40%" placeholder="Please Enter Your Email"/></td>  
                                  <td><font><%=form.getErrorMessage("email") %></font></td>  
                              </tr>
                              <tr>  
                                  <td><label>Mobile Number</label></td>  
                                  <td><input type="text" name="mobile" value='<%=form.getMobile()%>' size="40%"  placeholder="Please Enter Your Mobile Number"/></td>  
                                  <td><font><%=form.getErrorMessage("mobile") %></font></td>  
                              </tr>    
                               <tr>  
                                  <td><label>User Name</label></td>  
                                  <td><input type="text" name="userName" value='<%=form.getUserName()%>' size="40%" placeholder="Please Enter  Username"/></td>  
                                  <td><font><%=form.getErrorMessage("userName") %></font></td>  
                              </tr>  
                               <tr>  
                                  <td><label>Password</label></td>  
                                  <td><input type="password" name="password" value='<%=form.getPassword()%>' size="40%"  placeholder="please Enter New Password"/></td>  
                                  <td><font><%=form.getErrorMessage("password") %></font></td>  
                              </tr>  
                              <tr>  
                                  <td><label>Re Enter Password</label></td>  
                                  <td><input type="password" name="confirmPassword" value='<%=form.getConfirmPassword()%>' size="40%" placeholder="Please Re-Type password" /></td>  
                                  <td><font><%=form.getErrorMessage("confirmPassword") %></font></td>  
                              </tr>    
                          </tbody>  
                      </table>  
  						<br/>
  						
                      <input type="submit" value="Register" size="22%"><br> 
                      
                              
                      <input type="HIDDEN" name="process" value="true" >
                      
			
			
		</form>
		<form action="Login.jsp" method="post">
	
		<input type="submit" value="Log In" style="padding:6px 162px;">
		
	</form>
		
		
	</div>
</div>
</body>

</html>


<%!
        // Define error messages  
        java.util.Map errorMap = new java.util.HashMap();  
        public void jspInit()  
                         {  
            errorMap.put(Register.ERR_FIRST_NAME_BLANK, "PLEASE ENTER YOUR FIRST NAME");  
            errorMap.put(Register.ERR_LAST_NAME_BLANK, "PLEASE ENTER YOUR LAST NAME");  
            errorMap.put(Register.ERR_REGNO_BLANK, "PLEASE ENTER YOUR REGISTRATION NUMBER");
            errorMap.put(Register.ERR_REGNO_LENGTH, "LENGTH SHOULD BE 10");  
            
            errorMap.put(Register.ERR_REGNO_EXISTS, "REGISTRATION NUMBER ALREDY EXISTS"); 
            errorMap.put(Register.ERR_REGNO_INVALID, "INVALID REGISTRATION NUMBER #");
            errorMap.put(Register.ERR_BRANCH_BLANK, "PLEASE SELECT YOUR BRANCH"); 
            errorMap.put(Register.ERR_YEAR_BLANK, "PLEASE SELECT YEAR");
            errorMap.put(Register.ERR_EMAIL_BLANK, "PLEASE ENTER YOUR EMAIL ID");
            errorMap.put(Register.ERR_EMAIL_EXISTS, "EMAIL ALREDY EXISTS"); 
            errorMap.put(Register.ERR_EMAIL_INVALID, "INVALID EMAIL ID");
            errorMap.put(Register.ERR_MOBILE_BLANK, "PLEASE ENTER YOUR MOBILE NUMBER");  
            errorMap.put(Register.ERR_MOBILE_LENGTH, "LENGTH SHOULD BE 10");  
            errorMap.put(Register.ERR_MOBILE_EXISTS, "MOBILE NUMBER ALREDY EXISTS"); 
            errorMap.put(Register.ERR_MOBILE_INVALID, "INVALID MOBILE NUMBER #");
            errorMap.put(Register.ERR_USER_NAME_LENGTH, "MINIMUM 8 CHARACTERS"); 
            errorMap.put(Register.ERR_PASSWORD_BLANK, "PLEASE ENTER YOUR PASSWORD");  
            errorMap.put(Register.ERR_PASSWORD_LENGTH, "LENGTH SHOULD BE 6 OR MORE");  
            errorMap.put(Register.ERR_CONFIRM_PASSWORD_BLANK, "PLEASE RE ENTER YOUR PASSWORD");  
            errorMap.put(Register.ERR_CONFIRM_PASSWORD_MATCH, "PASSWORD DOES NOT MATCH");  
          
            
                         }   
        %>  