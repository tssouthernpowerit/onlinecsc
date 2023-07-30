package com.tsspdcl.onlinecsc.services;

import java.sql.Connection;
import java.sql.Statement;

public class SMSlog {

	
	public void InsertSMSLog(String mobileno,String msg,String user,String ack)
	{
		CSCDB db = new CSCDB();
		try(Connection con =db.getConnection()){
			Statement stmt=con.createStatement();
						
			String sql="insert into route_sms_log(mobileno,message,createdby,ack) values ("+mobileno+",'"+msg+"','"+user+"','"+ack+"')";
			int i=stmt.executeUpdate(sql);

		} catch(Exception ex) {
				System.out.println("\n Error In SMSlog Class : "+ex.getMessage()+" \n");
		}
	}
	
}
