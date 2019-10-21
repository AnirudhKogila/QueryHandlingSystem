package com.srkr.star;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MechAskDoubt 
{
	private boolean flag;
	public boolean setMechAskDoubt(String regNo,String subject,String doubt)
	{
		try
		{
			JdbcConnection jc = new JdbcConnection();
	    	Connection con =jc.getConnection();
	    	PreparedStatement ps=con.prepareStatement("insert into mechAskDoubt(regNo,subject,doubt,askDoubt_date) VALUES('"+regNo+"','"+subject+"','"+doubt+"',NOW())");
	    	 ps.executeUpdate();
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
