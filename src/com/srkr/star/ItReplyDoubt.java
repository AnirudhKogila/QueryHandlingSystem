package com.srkr.star;

import java.sql.*;
public class ItReplyDoubt
{
	private boolean flag;
	
	public boolean setItReplyDoubt(String regNo,String subject,String doubt,String answer)
	{
		try
		{
				JdbcConnection jc=new JdbcConnection();
				Connection con=jc.getConnection();
				PreparedStatement ps = con.prepareStatement("INSERT INTO itReplyDoubt(regNo,subject,doubt,answer,replyDoubt_date) VALUES ('"+regNo+"','"+subject+"','"+doubt+"','"+answer+"',NOW())");
				ps.executeUpdate();
				flag=true;
		}
		catch(Exception e) 
		{
			System.out.println(e);
			flag=false;
		}
		return flag;
	}
}
