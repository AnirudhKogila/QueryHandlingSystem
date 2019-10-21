package com.srkr.star;
import java.sql.*;  
import java.util.*;

  
public class Register
{  
	boolean flag;
	String firstName="";  
	String lastName="";  
	String regNo="";  
	String branch="";  
	String year="";  
	String email="";  
	String mobile="";  
	String userName="";  
	String password="";
	String confirmPassword="";

    public String getFirstName() 
    {  
        return firstName;  
    }  
  
    public void setFirstName(String firstName) 
    {  
        this.firstName = firstName;  
    }  
  
    public String getLastName() 
    {  
        return lastName;  
    }  
  
    public void setLastName(String lastName) 
    {  
        this.lastName = lastName;  
    }  
  
    public String getRegNo() 
    {  
        return regNo;  
    }  
  
    public void setRegNo(String regNo)
    {  
        this.regNo = regNo;  
    }  
  
    public String getBranch() 
    {  
        return branch;  
    }  
  
    public void setbranch(String branch) 
    {  
        this.branch = branch;  
    }  
  
    public String getYear() 
    {  
        return year;  
    }  
  
    public void setYear(String year)
    {  
        this.year = year;  
    }  
    public String getEmail()
    {  
        return email;  
    }  
  
    public void setEmail(String email) 
    {  
        this.email = email;  
    }  
  
    public String getMobile() 
    {  
        return mobile;  
    }  
  
    public void setMobile(String mobile) 
    {  
        this.mobile = mobile;  
    }  
  
    public String getUserName() 
    {  
        return userName;  
    }  
  
    public void setUserName(String userName)
    {  
        this.userName = userName;  
    }  
    public String getPassword() 
    {  
        return password;  
    }  
  
    public void setPassword(String password) 
    {  
        this.password = password;  
    } 
    public String getConfirmPassword() 
    {  
        return confirmPassword;  
    }  
  
    public void setConfirmPassword(String confirmPassword)
    {  
        this.confirmPassword = confirmPassword;  
    }  
  
    public static final Integer ERR_FIRST_NAME_BLANK = new Integer(1);  
    public static final Integer ERR_LAST_NAME_BLANK = new Integer(2);
    public static final Integer ERR_REGNO_BLANK = new Integer(3);
    public static final Integer ERR_REGNO_LENGTH = new Integer(4);  
    public static final Integer ERR_REGNO_EXISTS = new Integer(5);  
    public static final Integer ERR_REGNO_INVALID = new Integer(6);  
    public static final Integer ERR_BRANCH_BLANK = new Integer(7);  
    public static final Integer ERR_YEAR_BLANK = new Integer(8);  
    public static final Integer ERR_EMAIL_BLANK = new Integer(9);  
    public static final Integer ERR_EMAIL_EXISTS = new Integer(10);  
    public static final Integer ERR_EMAIL_INVALID = new Integer(11); 
    public static final Integer ERR_MOBILE_BLANK = new Integer(12); 
    public static final Integer ERR_MOBILE_LENGTH = new Integer(13);  
    public static final Integer ERR_MOBILE_EXISTS = new Integer(14);  
    public static final Integer ERR_MOBILE_INVALID = new Integer(15); 
    public static final Integer ERR_USER_NAME_BLANK = new Integer(16);
    public static final Integer ERR_USER_NAME_LENGTH = new Integer(17);  
    public static final Integer ERR_PASSWORD_BLANK = new Integer(18);  
    public static final Integer ERR_PASSWORD_LENGTH = new Integer(19);  
    public static final Integer ERR_CONFIRM_PASSWORD_BLANK = new Integer(20);  
    public static final Integer ERR_CONFIRM_PASSWORD_MATCH = new Integer(21);  
  
  
    Map<String, Integer> errorCodes = new HashMap<String, Integer>();  
  
    Map<?, ?> msgMap;  
    public void setErrorMessages(Map<?, ?> msgMap)
    {  
        this.msgMap = msgMap;  
    }  
  
    public String getErrorMessage(String propName)
    {  
        Integer code = (Integer) (errorCodes.get(propName));  
        if (code == null) 
        {  
            return "";  
        } 
        else if (msgMap != null) 
        {  
            String msg = (String) msgMap.get(code);
            if (msg != null) 
            {  
                return msg;  
            }  
        }  
        return "Error";  
    }  
    public boolean isValid() throws SQLException 
    {  
  
        errorCodes.clear();  
  
        if(firstName.length()==0)  
        {  
        	errorCodes.put("firstName", ERR_FIRST_NAME_BLANK);  
        } 
   
   
        if(lastName.length()==0)  
        {  
        	errorCodes.put("lastName", ERR_LAST_NAME_BLANK);  
        } 
   
   
        if(regNo.length()==0)  
        {  
        	errorCodes.put("regNo",ERR_REGNO_BLANK);  
        }  
        else  
        	if(regNo.length()!=10)  
        	{  
        		errorCodes.put("regNo",ERR_REGNO_LENGTH);  
        	}  
        	else  
        	{  
        		try  
        		{  
        			JdbcConnection jc=new JdbcConnection();
        			Connection con=jc.getConnection();
        			Statement stm=con.createStatement();  
        			ResultSet rst=stm.executeQuery("select * from  registration where regNo='"+regNo+"'");  
        			if(rst.next())  
        			{  
        				errorCodes.put("regNo",ERR_REGNO_EXISTS);  
        			}  
        		}  
        		catch(NumberFormatException e)  
        		{  
        			errorCodes.put("regNo",ERR_REGNO_INVALID);  
        		}  
        	}
        if(branch=="Select Branch")  
        {  
        	errorCodes.put("branch", ERR_BRANCH_BLANK);  
        }  
   
   
        if(year=="Select Year")  
        {  
        	errorCodes.put("year", ERR_YEAR_BLANK);  
        }
   
   
        if (email.length() == 0) 
        {  
        	errorCodes.put("email", ERR_EMAIL_BLANK);  
        } 
        else if (!email.matches(".+@.+\\..+")) 
        {  
        	errorCodes.put("email", ERR_EMAIL_INVALID);  
        }
        else
        {
        	try  
        	{  
        		JdbcConnection jc=new JdbcConnection();
        		Connection con=jc.getConnection();
        		Statement stm=con.createStatement();  
        		ResultSet rst=stm.executeQuery("select * from  registration where email='"+email+"'");  
        		if(rst.next())  
        		{  
        			errorCodes.put("email",ERR_EMAIL_EXISTS);  
        		}  
        	}  
        	catch(NumberFormatException e)  
        	{  
        		errorCodes.put("regNo",ERR_EMAIL_INVALID);  
        	}  
        }
   
   
        if(mobile.length()==0)  
        {  
        	errorCodes.put("mobile",ERR_MOBILE_BLANK);  
        }  
        else  
        	if(mobile.length()!=10)  
        	{  
        		errorCodes.put("mobile",ERR_MOBILE_LENGTH);  
        	}  
        	else  
        	{  
        		try  
        		{  
        			JdbcConnection jc=new JdbcConnection();
        			Connection con=jc.getConnection();
        			Statement stm=con.createStatement();  
        			ResultSet rst=stm.executeQuery("select * from  registration where mobile='"+mobile+"'");  
        			if(rst.next())  
        			{  
        				errorCodes.put("mobile",ERR_MOBILE_EXISTS);  
        			}  
        		}  
        		catch(NumberFormatException e)  
        		{  
        			errorCodes.put("mobile",ERR_MOBILE_INVALID);  
        		}  
        	}
   
   
        if(userName.length()==0)  
        {  
        	errorCodes.put("userName",ERR_USER_NAME_BLANK);  
        }   
        if(userName.length()<8)  
        {  
        	errorCodes.put("userName",ERR_USER_NAME_LENGTH);  
        }  
      
   
        if(password.length()==0)  
        {  
        	errorCodes.put("password",ERR_PASSWORD_BLANK);  
        }  
        else  
        	if(password.length()<5)  
        	{  
        		errorCodes.put("password",ERR_PASSWORD_LENGTH);  
        	}
   
   
        if(confirmPassword.length()==0)  
        {  
        	errorCodes.put("confirmPassword",ERR_CONFIRM_PASSWORD_BLANK);  
        }  
        else  
        	if(!(password.equals(confirmPassword)))  
        	{  
        		errorCodes.put("confirmPassword",ERR_CONFIRM_PASSWORD_MATCH);  
        	}  
        
  
        return errorCodes.size() == 0;  
    }  
  
    public boolean process() throws SQLException 
    {  
        if (!isValid()) 
        {  
            return false;  
        }
        else
        {
            	
				try
            	{
            	JdbcConnection jc = new JdbcConnection();
            	Connection con =jc.getConnection();
            	PreparedStatement ps1 = con.prepareStatement("INSERT INTO login(regNo,username,password,registration_date) VALUES ('"+regNo+"','"+userName+"','"+password+"',NOW())");
        	    ps1.executeUpdate();
        	    PreparedStatement ps2 =  con.prepareStatement("INSERT INTO registration(regNo,firstname,lastName,email,mobile,branch,year,registration_date)"
        				+ " VALUES ('"+regNo+"','"+firstName+"','"+lastName+"','"+email+"','"+mobile+"','"+branch+"','"+year+"',NOW())");
        		ps2.executeUpdate();
        	    flag = true;
            	}
            	catch(Exception e)
            	{
                System.out.println(e);
                flag = false;
            	}
				
        return flag;
            	
        }
        

  
      
       
    }

	
}  