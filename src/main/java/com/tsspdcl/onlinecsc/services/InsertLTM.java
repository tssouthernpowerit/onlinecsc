package com.tsspdcl.onlinecsc.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import com.tsspdcl.onlinecsc.model.LTMAppDataModel;

public class InsertLTM {

	public String FILE_DIRECTORY = "E:\\LTMFiles\\";
	CSCDB db = new CSCDB();
	
	SimpleDateFormat sdf1=new SimpleDateFormat("dd/MM/yy");
	java.util.Date dt3= new java.util.Date();
	String dt2=sdf1.format(dt3);
	String year=dt2.substring(6,8);


	public void insert(LTMAppDataModel AppData, HttpServletRequest request) throws Exception {
		String regformat="LTM"+year+AppData.getSection_code();
		String regId = year+AppData.getSection_code() + nextAPTVal(regformat);
		String regno= "LTM"+regId;

		
	}
	
	
	 public synchronized String nextAPTVal(String pstrSequenceName) {
		 String SEQ = "";
		 try(Connection con = db.getConnection()){
			    String querySEQ= "select nvl(max(substr(registration_number,9,4)),0)+1 from apartment_connection where registration_number like '" + pstrSequenceName + "%'";
				PreparedStatement psSEQ = con.prepareStatement(querySEQ);		
				ResultSet rs=psSEQ.executeQuery();
				if(rs.next()) {
					SEQ =  rs.getString(1);
				}
		    } catch (Exception e) {
		      System.out.print("\n SQLException in SequenceNumber\n" + e.getMessage());
		      return null;
		    } 
		 return SEQ;
	 }
		
}
