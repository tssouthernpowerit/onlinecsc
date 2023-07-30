package com.tsspdcl.onlinecsc.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.tsspdcl.onlinecsc.model.AdditionalPaymentModel;
import com.tsspdcl.onlinecsc.model.AreaData;
import com.tsspdcl.onlinecsc.model.CircleListModel;
import com.tsspdcl.onlinecsc.model.EbsResponseModel;
import com.tsspdcl.onlinecsc.model.GovtCodeModel;
import com.tsspdcl.onlinecsc.model.HodCodeModel;
import com.tsspdcl.onlinecsc.model.MunicipalCodeModel;
import com.tsspdcl.onlinecsc.model.PreReqInputModel;
import com.tsspdcl.onlinecsc.model.PreReqModel;
import com.tsspdcl.onlinecsc.model.SectionListModel;
import com.tsspdcl.onlinecsc.model.SubCatModel;
import com.tsspdcl.onlinecsc.model.SupplyNatureModel;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class DBMethods {
	
	public String checkReg(String login_regno) {
						
		String response = "";
		CSCDB db = new CSCDB();
		ResultSet rs= null;
		try(Connection con = db.getConnection()){			
			Statement stmt=con.createStatement();   		
     		String qry = "SELECT NRREGNO,MOBILENO FROM NEWCONNECTION_REGISTER WHERE NRREGNO='"+login_regno+"' and status is null";
     		rs=stmt.executeQuery(qry);
     		
			if(rs.next()) {
				response = rs.getString(2) ;
			}
			else{
				response = "";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return response;
	}
	
	public PreReqModel genPreReq(PreReqInputModel prim) {
		CSCDB db = new CSCDB();
		ResultSet rs = null;
		double af = 0.0, afgst = 0.0, secdp= 0.0, totamt=0.0;
        double dc = 0.0, dcgst = 0.0;
        double load = 0.00;
		DecimalFormat df = new DecimalFormat("0.00"); 
		PreReqModel prm = new PreReqModel();
		try(Connection con = db.getConnection()){
			Statement stmt = con.createStatement();
			String qry = "SELECT APP_FEE, APP_FEE_GST, SEC_DEP, DEV_CH, DEV_CH_GST FROM INITIAL_PAYMT WHERE CAT = '"+prim.getCategory()+"' and "
							+ "	SUBCAT = '"+prim.getSubcategory()+"' ";
			rs=stmt.executeQuery(qry);
			if(rs.next()) {
				if(prim.getCategory().equals("3") || prim.getCategory().equals("5")) {
					load = prim.getLoad();
				}else {
					load = Math.ceil(0.001*prim.getLoad());
				}
				af = rs.getDouble(1);
				afgst = rs.getDouble(2);
				if(prim.getRegdoc().equals("N"))
					secdp = load*3*rs.getDouble(3);
				else
					secdp = load*rs.getDouble(3);				
				dc = load*rs.getDouble(4);
				dcgst  = load*rs.getDouble(5);				
				totamt = af + afgst + secdp + dc + dcgst ;
				
				if(prim.getExtension().equals("Y") & !prim.getCategory().equals("5")) {
					secdp = 0.00; dc = 0.00; dcgst = 0.00; totamt = af + afgst; 
				}
				
				prm.setAf_pre(df.format(af));
				prm.setAfgst_pre(df.format(afgst));
				prm.setSd_pre(df.format(secdp));
				prm.setDc_pre(df.format(dc));
				prm.setDcgst_pre(df.format(dcgst));
				prm.setTot_pre(df.format(totamt));
				
				//repeat
				prm.setAf(df.format(af));
				prm.setAfgst(df.format(afgst));
				prm.setSd(df.format(secdp));
				prm.setDc(df.format(dc)); 
				prm.setDcgst(df.format(dcgst));
				prm.setTot(df.format(totamt));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return prm;
	}
	
	public EbsResponseModel checkUscno(String uscno) {
		CSCDB db = new CSCDB();
		ResultSet rs, rs1, rs2, rs3, rs4, rs5, rs6, rs7= null, rs8= null;
		String qry, qry1, qry2, qry3, qry4, qry5 = "", qry6 = "", qry7 = "", qry8 = "";
		String seccd = "",erouser = "", subdivcd = "";
		ArrayList<AreaData> ad_Array=new ArrayList<AreaData>();
		EbsResponseModel erm = new EbsResponseModel();
				
		try(Connection con = db.getConnection()){
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();
			Statement stmt4 = con.createStatement();
			Statement stmt5 = con.createStatement();
			Statement stmt6 = con.createStatement();
			Statement stmt7 = con.createStatement();
			Statement stmt8 = con.createStatement();
			qry = "SELECT A.CTUKSECCD FROM corporate.all_consumer@ebsrodbl A WHERE  A.CTUKSCNO='"+uscno+"'";
			rs=stmt.executeQuery(qry);
			if(rs.next()) {

				seccd = rs.getString(1);
				erm.setEbs_resp("VALID");

				qry1 = "select uk_seccd,secname,erocd from all_section where uk_seccd='"+seccd+"' ";			
				rs1=stmt1.executeQuery(qry1);
				if(rs1.next()) {
					erm.setSection_code(rs1.getString(1));
					erm.setSection_name(rs1.getString(2));
					erm.setEro_code(rs1.getString(3));
					//System.out.println(erm.getSection_code() + "  " + erm.getEro_code());
				}
				qry2 = "SELECT DISTINCT EROUSERORA FROM COREROS@intcsc_dblink,(SELECT uk_seccd,secname,A.EROCD FROM all_section A WHERE uk_seccd="+seccd+") WHERE ERONO=EROCD" ;
				rs2=stmt2.executeQuery(qry2);
				if(rs2.next()) {
					erouser = rs2.getString(1);						
				}
				qry3 = "SELECT DISTINCT AREACODE,AREANAME,NVL(AREAGROUP,'M') FROM ALL_SECTION,"+erouser+".AREA@intcsc_dblink WHERE AREASECCD=SECCD AND UK_SECCD="+seccd+" ORDER BY AREACODE,AREANAME";		
				rs3=stmt3.executeQuery(qry3);
				while(rs3.next()) {
					AreaData adObj = new AreaData();
					adObj.setArea_code(rs3.getString(1));
					adObj.setArea_name(rs3.getString(2));
					adObj.setArea_group(rs3.getString(3));
					ad_Array.add(adObj);												
				}				
				erm.setArea_data(ad_Array);
				
				qry4 = "SELECT SUBDIVCD FROM all_section where uk_seccd='"+seccd+"'";
				rs4=stmt4.executeQuery(qry4);
				if(rs4.next()) {
						subdivcd = rs4.getString(1);
				}
				qry5 = "SELECT CSCNO from ALL_SUBDIVISION  where UK_SUBDIV='"+subdivcd+"' ";
				rs5=stmt5.executeQuery(qry5);
				if(rs5.next()) {
						erm.setCsc_number(rs5.getString(1));
				}
				
				qry6 = "select ctareacd FROM corporate.all_consumer@ebsrodbl  WHERE CTUKSCNO='"+uscno+"' ";
				rs6=stmt6.executeQuery(qry6);
				int areacd ;
				if(rs6.next()) {
						erm.setAdj_area_code(rs6.getString(1));
						areacd = rs6.getInt(1);
				}
				qry7 = "SELECT DISTINCT AREANAME,NVL(AREAGROUP,'M') FROM ALL_SECTION,"+erouser+".AREA@intcsc_dblink "
						+ "WHERE AREASECCD=SECCD AND UK_SECCD='"+seccd+"' AND AREACODE='"+rs6.getString(1)+"' ";	
				System.out.println(qry7); 
				rs7=stmt7.executeQuery(qry7);
				if(rs7.next()) {
						erm.setAdj_area_name(rs7.getString(1));
						erm.setAdj_area_group(rs7.getString(2));
				}
				qry8 = "SELECT  CTBILSTAT, CTCAT FROM corporate.all_consumer@ebsrodbl  WHERE CTUKSCNO='"+uscno+"' ";	 
				rs8=stmt8.executeQuery(qry8);
				if(rs8.next()) {
						erm.setBillstatus(rs8.getString(1));
						erm.setBillcategory(rs8.getString(2));
				}
				
			}
			else{
				erm.setEbs_resp("INVALID");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return erm;
	}
	
	
	public AreaData getAreaName1(String uscno,String areacd) {
		CSCDB db = new CSCDB();
		ResultSet rs,rs2, rs3 = null;
		String qry, qry2, qry3;
		String seccd = "",erouser = "";
				
		AreaData ad = new AreaData();
		
		try(Connection con = db.getConnection()){
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();

			qry = "SELECT A.CTUKSECCD FROM corporate.all_consumer@ebsrodbl A WHERE  A.CTUKSCNO='"+uscno+"' ";
			rs=stmt.executeQuery(qry);
			if(rs.next()) {
				seccd = rs.getString(1);
				//System.out.println("seccd ---"+seccd+" --- areacd ---"+areacd);
				qry2 = "SELECT DISTINCT EROUSERORA FROM COREROS@intcsc_dblink,(SELECT uk_seccd,secname,A.EROCD FROM all_section A "
						+ "WHERE uk_seccd="+seccd+") WHERE ERONO=EROCD" ;
				rs2=stmt2.executeQuery(qry2);				
				if(rs2.next()) {
					erouser = rs2.getString(1);
				}
				
				qry3 = "SELECT DISTINCT AREANAME,NVL(AREAGROUP,'M') FROM ALL_SECTION,"+erouser+".AREA@intcsc_dblink "
						+ "WHERE AREASECCD=SECCD AND UK_SECCD="+seccd+" AND AREACODE="+areacd+"";		
				rs3=stmt3.executeQuery(qry3);
				if(rs3.next()) {
					ad.setArea_name(rs3.getString(1));
					ad.setArea_group(rs3.getString(2));												
				}											
			}

		}catch(Exception e) {
			e.printStackTrace();
			}
		return ad;
	}

	public ArrayList<CircleListModel>  getCircleList() {
		CSCDB db = new CSCDB();
		
		ResultSet rs = null;
		String qry = "";
		ArrayList<CircleListModel> cr_Array=new ArrayList<CircleListModel>();
				
		try(Connection con = db.getConnection()){
			Statement stmt = con.createStatement();
			qry = "SELECT CIRCLE_NAME,CIRCLE_ID FROM CIRCLE where circle_id in('03','17','28','14','05','04','08','10','01','26','09','29','18','21','20','16','15','12','19','27','11') "
					+ " ORDER BY CIRCLE_NAME";		
			rs=stmt.executeQuery(qry);
			while(rs.next()) {
				CircleListModel crObj = new CircleListModel();
				crObj.setCircle_name(rs.getString(1));
				crObj.setCircle_id(rs.getString(2));
				cr_Array.add(crObj);												
			}				

		}catch(Exception e) {
			e.printStackTrace();
		}
		return cr_Array;
	}
	
		
	public ArrayList<SectionListModel>  getSectionList(String circle_id) {
		CSCDB db = new CSCDB();
		
		ResultSet rs = null;
		String qry = "";
		ArrayList<SectionListModel> sc_Array=new ArrayList<SectionListModel>();
				
		try(Connection con = db.getConnection()){
			Statement stmt = con.createStatement();
			qry = "SELECT SECNAME,UK_SECCD FROM ALL_SECTION where CIRCD = "+circle_id+" ORDER BY SECNAME";		
			rs=stmt.executeQuery(qry);
			while(rs.next()) {
				SectionListModel scObj = new SectionListModel();
				scObj.setSection_name(rs.getString(1));
				scObj.setSection_id(rs.getString(2));
				sc_Array.add(scObj);												
			}				

		}catch(Exception e) {
			e.printStackTrace();
		}
		return sc_Array;
	}
	
	
	public EbsResponseModel getAreaList(String section_id) {
		CSCDB db = new CSCDB();
		ResultSet rs, rs1, rs2, rs3, rs4, rs5= null;
		String qry, qry1, qry2, qry3, qry4, qry5 = "";
		String seccd = "",erouser = "", subdivcd = "";
		ArrayList<AreaData> ad_Array=new ArrayList<AreaData>();
		EbsResponseModel erm = new EbsResponseModel();
				
		try(Connection con = db.getConnection()){
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();
			Statement stmt4 = con.createStatement();
			Statement stmt5 = con.createStatement();

			qry1 = "select uk_seccd,secname,erocd from all_section where uk_seccd='"+section_id+"' ";			
			rs1=stmt1.executeQuery(qry1);
			if(rs1.next()) {
				erm.setSection_code(rs1.getString(1));
				erm.setSection_name(rs1.getString(2));
				erm.setEro_code(rs1.getString(3));
				//System.out.println(erm.getSection_code() + "  " + erm.getEro_code());
			}
			qry2 = "SELECT DISTINCT EROUSERORA FROM COREROS@intcsc_dblink,(SELECT uk_seccd,secname,A.EROCD FROM all_section A WHERE uk_seccd="+section_id+") WHERE ERONO=EROCD" ;
			rs2=stmt2.executeQuery(qry2);
			if(rs2.next()) {
				erouser = rs2.getString(1);						
			}
			qry3 = "SELECT DISTINCT AREACODE,AREANAME,NVL(AREAGROUP,'M') FROM ALL_SECTION,"+erouser+".AREA@intcsc_dblink WHERE AREASECCD=SECCD AND UK_SECCD="+section_id+" ORDER BY AREACODE,AREANAME";		
			rs3=stmt3.executeQuery(qry3);
			while(rs3.next()) {
				AreaData adObj = new AreaData();
				adObj.setArea_code(rs3.getString(1));
				adObj.setArea_name(rs3.getString(2));
				adObj.setArea_group(rs3.getString(3));
				ad_Array.add(adObj);												
			}				
			erm.setArea_data(ad_Array);
			
			qry4 = "SELECT SUBDIVCD FROM all_section where uk_seccd='"+section_id+"'";
			rs4=stmt4.executeQuery(qry4);
			if(rs4.next()) {
					subdivcd = rs4.getString(1);
			}
			qry5 = "SELECT CSCNO from ALL_SUBDIVISION  where UK_SUBDIV='"+subdivcd+"' ";
			rs5=stmt5.executeQuery(qry5);
			if(rs5.next()) {
					erm.setCsc_number(rs5.getString(1));
			}
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return erm;
	}
	
	
	public AreaData getAreaName2(String area_code, String section_code) {
		CSCDB db = new CSCDB();
		ResultSet rs,rs2, rs3 = null;
		String qry, qry2, qry3;
		String erouser = "";
				
		AreaData ad = new AreaData();
		
		try(Connection con = db.getConnection()){
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();

			qry2 = "SELECT DISTINCT EROUSERORA FROM COREROS@intcsc_dblink,(SELECT uk_seccd,secname,A.EROCD FROM all_section A "
					+ "WHERE uk_seccd="+section_code+") WHERE ERONO=EROCD" ;
			rs2=stmt2.executeQuery(qry2);				
			if(rs2.next()) {
				erouser = rs2.getString(1);
			}
			qry3 = "SELECT DISTINCT AREANAME,NVL(AREAGROUP,'M') FROM ALL_SECTION,"+erouser+".AREA@intcsc_dblink "
					+ "WHERE AREASECCD=SECCD AND UK_SECCD="+section_code+" AND AREACODE='"+area_code+"' ";		
			rs3=stmt3.executeQuery(qry3);
			if(rs3.next()) {
				ad.setArea_name(rs3.getString(1));
				ad.setArea_group(rs3.getString(2));												
			}											

		}catch(Exception e) {
			e.printStackTrace();
			}
		return ad;
	}
	
	
	public ArrayList<MunicipalCodeModel> genMunicipalCode(){
		
		CSCDB db = new CSCDB();
		ResultSet rs= null;
		String qry = "";
		ArrayList<MunicipalCodeModel> arrM = new ArrayList<>();		
		
		try(Connection con = db.getConnection()){
			Statement stmt=con.createStatement();
			qry = "SELECT mcode,mname from muncipality  order by mcode";			
			rs=stmt.executeQuery(qry);
			while(rs.next()) {
				MunicipalCodeModel mc = new MunicipalCodeModel();
				mc.setMCode(rs.getString(1));
				mc.setMName(rs.getString(2));
				arrM.add(mc);											
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return arrM;			
	}
	
	public ArrayList<SubCatModel> genSubCategory(String category){
		
		CSCDB db = new CSCDB();
		ResultSet rs= null;
		String qry = "";
		ArrayList<SubCatModel> arrSubCat = new ArrayList<>();		
		
		try(Connection con = db.getConnection()){
			Statement stmt=con.createStatement();
			//System.out.println("category...."+category);
			if(category.equals("5")){
				qry="SELECT scsubcat,scdesc from subcategory where sccat='"+category+"' and RECORD_STATUS='ACTIVE'  and scsubcat<>'31' order by scsubcat";
			}else if(category.equals("3")){
				qry="SELECT scsubcat,scdesc from subcategory where sccat='"+category+"' and RECORD_STATUS='ACTIVE'  and scsubcat<>'5' order by scsubcat";
			}else {
				qry="SELECT scsubcat,scdesc from subcategory where sccat='"+category+"' and RECORD_STATUS='ACTIVE'  order by scsubcat";
			}
			//System.out.println("qry...."+qry);
			rs=stmt.executeQuery(qry);
			while(rs.next()) {
				SubCatModel sbc = new SubCatModel();
				sbc.setSubCatCode( rs.getString(1));
				sbc.setSubCatDesc(rs.getString(2));
				arrSubCat.add(sbc);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		//System.out.println(arrSubCat);
		return arrSubCat;			
	}
	
	
	public ArrayList<GovtCodeModel> genGovtList(){
		
		CSCDB db = new CSCDB();
		ResultSet rs= null;
		String qry = "";
		ArrayList<GovtCodeModel> arrGovt = new ArrayList<>();		
		
		try(Connection con = db.getConnection()){
			Statement stmt=con.createStatement();
			qry = "SELECT distinct SECTDEPTCD,SECTDEPTNAME from govtcode  order by SECTDEPTNAME";			
			rs=stmt.executeQuery(qry);
			while(rs.next()) {
				GovtCodeModel gvc = new GovtCodeModel();
				gvc.setGovCode(rs.getString(1));
				gvc.setGovCodeDesc(rs.getString(2));
				arrGovt.add(gvc);											
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return arrGovt;			
	}
	
	public ArrayList<HodCodeModel> genHodList(String govtcd){
		
		CSCDB db = new CSCDB();
		ResultSet rs= null;
		String qry = "";		
		ArrayList<HodCodeModel> arrHod = new ArrayList<>();
		
		try(Connection con = db.getConnection()){
			Statement stmt=con.createStatement();
			qry = "SELECT HODDEPTCD, HODDEPTNAME  from govtcode where SECTDEPTCD='"+govtcd+"'  order by HODDEPTNAME";
			
			rs=stmt.executeQuery(qry);
			while(rs.next()) {
				HodCodeModel  hdc = new HodCodeModel();
				hdc.setHodCode(rs.getString(1));
				hdc.setHodCodeDesc(rs.getString(2));
				arrHod.add(hdc);													
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return arrHod;		
	}
	
public ArrayList<SupplyNatureModel> genSupplyNature(){
		
		CSCDB db = new CSCDB();
		ResultSet rs= null;
		String qry = "";		
		ArrayList<SupplyNatureModel> arrSupNat = new ArrayList<>();
		
		try(Connection con = db.getConnection()){
			Statement stmt=con.createStatement();
			qry = "SELECT STCODE,STDESC from servtype  order by stdesc";
			
			rs=stmt.executeQuery(qry);
			while(rs.next()) {
				SupplyNatureModel  sn = new SupplyNatureModel();
				sn.setSupNatureCode(rs.getString(1));
				sn.setSupNatureDesc(rs.getString(2));
				arrSupNat.add(sn);													
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		//System.out.println(arrSupNat);
		return arrSupNat;		
	}



public String genOTP(String mobileno) {
	String msgtype = "Registration";
	try
	{
		int randomPIN=2205;
		randomPIN = (int) (Math.random() * 9000) + 1000;
		//System.out.println("Randonm PIN.."+randomPIN);;
		String otp = String.valueOf(randomPIN);
		System.out.println(otp);
		SMSSender.sendMsg(mobileno, "Dear Customer, OTP for "+msgtype+" is : "+randomPIN);
		return otp;
	}
	catch(Exception ex)
	{
		System.out.println(ex.getMessage());
		return "";
	}
}



public String HmacSHA256(String message, String secret) {
    try {
      Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
      SecretKeySpec secret_key = new SecretKeySpec(secret.getBytes(), "HmacSHA256");
      sha256_HMAC.init(secret_key);
      byte[] raw = sha256_HMAC.doFinal(message.getBytes());
      StringBuffer ls_sb = new StringBuffer();
      for (int i = 0; i < raw.length; i++)
        ls_sb.append(char2hex(raw[i])); 
      return ls_sb.toString();
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } 
  }

 public String char2hex(byte x) {
	    char[] arr = { 
	        '0', '1', '2', '3', 
	        '4', '5', '6', '7', 
	        '8', '9', 
	        'A', 'B', 
	        'C', 'D', 'E', 'F' };
	    char[] c = { arr[(x & 0xF0) >> 4], arr[x & 0xF] };
	    return new String(c);
	  }
}


