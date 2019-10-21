package com.srkr.star;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class Login 
{

	String regNo="";
	String password="";
	int i=0;
	
	public String getRegNo() 
    {  
        return regNo;  
    }  
  
    public void setRegNo(String regNo)
    {  
        this.regNo = regNo;  
    }  
    
    public String getPassword() 
    {  
        return password;  
    }  
  
    public void setPassword(String password) 
    {  
        this.password = password;  
    } 
    
    public static final Integer ERR_REGNO_BLANK = new Integer(1);
    public static final Integer ERR_REGNO_LENGTH = new Integer(2); 
    public static final Integer ERR_REGNO_NOTEXISTS = new Integer(3);
    public static final Integer ERR_REGNO_INVALID = new Integer(4);
    public static final Integer ERR_PASSWORD_BLANK = new Integer(5);  
    public static final Integer ERR_PASSWORD_INCORRECT = new Integer(6);
    
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
    	try
    	{
    		 JdbcConnection jc=new JdbcConnection();
   	       Connection con=jc.getConnection();
   	       Statement st=con.createStatement(); 
  
       
        	
        if(regNo.length()==0)  
        {  
        errorCodes.put("regNo",ERR_REGNO_BLANK);  
        }  
        else 
        {
            if(regNo.length()!=10)  
            {  
            errorCodes.put("regNo",ERR_REGNO_LENGTH);  
            }
            else
            {
            	try  
         	   	{  
         		   
         	       ResultSet rs=st.executeQuery("select * from  login where regNo='"+regNo+"'");  
         	       if(rs.next())
         	       {
         	    	   i=1;
         	       }
         	       if(i==0)
         	       {
         	    	  errorCodes.put("regNo",ERR_REGNO_NOTEXISTS);  
         	       }
         	       rs.close();
         	   	}  
         	   	catch(NumberFormatException e)  
         	   	{  
         		   errorCodes.put("regNo",ERR_REGNO_INVALID);  
         	   	}  
            }
        }
	    	
        if(password.length()==0)  
        {  
        errorCodes.put("password",ERR_PASSWORD_BLANK);  
        }
        else
        {
        	try  
     	   	{  
     		  
     	       
     	       ResultSet rs1=st.executeQuery("select * from  login where regNo='"+regNo+"'");
     	       if(rs1.next())
     	       {
     	    	   if(!(rs1.getString(3).equals(password)))
     	    	   {
     	    		   errorCodes.put("password",ERR_PASSWORD_INCORRECT); 
     	    	   }
     	       }
     	       rs1.close();
     	   	}  
     	   	catch(Exception e)  
     	   	{  
     		   System.out.println(e);
     	   	}  
        }
    	}
    	catch(Exception e)  
 	   	{  
 		   System.out.println(e);
 	   	}  
        return errorCodes.size() == 0;   	
	    	
	}
    public boolean process() throws SQLException 
    {  
        if (!isValid()) 
        {  
            return false;  
        }

        regNo="";
        password="";
        
        errorCodes.clear();
        return true;
    }
    
}
	 