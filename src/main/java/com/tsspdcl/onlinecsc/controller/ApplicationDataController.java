package com.tsspdcl.onlinecsc.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Collections;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tsspdcl.onlinecsc.model.AdditionalPaymentModel;
import com.tsspdcl.onlinecsc.model.ApplicationDataModel;
import com.tsspdcl.onlinecsc.services.AdlPayUpdate;
import com.tsspdcl.onlinecsc.services.CSCDB;
import com.tsspdcl.onlinecsc.services.InsertNR;
import com.tsspdcl.onlinecsc.services.SMSSender;
import com.tsspdcl.onlinecsc.services.UpdateNR;

@Controller
@RequestMapping(path="")
public class ApplicationDataController {
	final static Logger logger = Logger.getLogger(MainController.class);
	
	@RequestMapping(path = "/save", method = RequestMethod.POST, consumes = { MediaType.MULTIPART_FORM_DATA_VALUE ,
																			MediaType.APPLICATION_FORM_URLENCODED_VALUE})
	public String insert(@ModelAttribute ApplicationDataModel AppData, HttpServletRequest request) {
		
		InsertNR in = new InsertNR();
		
		try {
			in.insert(AppData, request);
		} catch (Exception e) {
			logger.warn("Exception in ApplicationDataController in insert method  " + e.getLocalizedMessage());
			e.printStackTrace();
			return "error";
		}
		
		return "RegistrationPmt";
		
	}
	
	@RequestMapping(path = "/save1", method = RequestMethod.POST, consumes = { MediaType.MULTIPART_FORM_DATA_VALUE ,
			MediaType.APPLICATION_FORM_URLENCODED_VALUE})
	public String update(@ModelAttribute ApplicationDataModel AppData, HttpServletRequest request) {
		
		UpdateNR up = new UpdateNR();
		up.update(AppData, request);
		
		return "RegistrationPmt";
		
	}
	
	@RequestMapping(path = "/save2", method = RequestMethod.POST)
	public String AdditionalPay(@RequestParam String nrno, HttpServletRequest request) {
		
		AdlPayUpdate apu = new AdlPayUpdate();
		try {
			apu.update(nrno, request);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		//System.out.println(nrno);
		
		return "AdditionalPmt";
		
	}
	
	
	/*@RequestMapping(path = "/receipt", method = RequestMethod.POST)
	public String update(@RequestParam("msg") String resmsg) {
		
		String title="";
		java.util.Date now = new java.util.Date();
		DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
		String s1 = df.format(now);
		String [] curryear=s1.split("/");
		//String chksum=(String)session.getAttribute("cheksum");
		
		String [] resparam=resmsg.split("\\|");
		String regno=resparam[1];
		String trnsid=resparam[2];
		String pdamt=resparam[4];
		String trnsdt=resparam[13];
		String athstat=resparam[14];
		String bankcd=resparam[5];	
		
		CSCDB db = new CSCDB();
		try(Connection con = db.getConnection()){
			String name="",cmobile="",email="",category="",contld="",cscno="",rsd="",rdc="",raf="",seccd="",unitcd="",sapseccd="",resdt="",regdt="",fname="",connadd="",phase="",secname="", prno="",ddamt="",prdt="",catcode="",socialgp="",scheme="",ctscno="",purpose="",metric="",reqld="",status="",afgst="",dcgst="",paidamt="",cscmailid="",etype="",advcc="0";
			double gst=0.0,dcsgst=0.0,dccgst=0.0,othchgs=0.0,othcgst=0.0,othsgst=0.0;
			paidamt=Double.parseDouble(pdamt)+"";
			
			Statement stmt=con.createStatement();
			ResultSet rs=null;
			if(regno.startsWith("NT"))
			{
				rs=stmt.executeQuery("select nrcscno,nrregno,to_char(nrregdate,'dd/mm/yyyy'),APPLICANT_NAME,MOBILENO,EMAILID,APPL_FEES,0,0,decode(catcode,1,'DOMESTIC',2,'NON-DOMESTIC AND COMMERCIAL',3,'INDUSTRIAL',4,'COTTAGE INDUSTRIES AND DHOBIGHATS',5,'AGRICULTURAL',6,'STREET LIGHT PWS',7,'GENERAL PURPOSE',8,'TEMPORARY SUPPLY',''),CONNECTLD,a.SECCD,b.unitcd,b.sap_seccd,to_char(resolveDate(sysdate,2),'dd/mm/yyyy'),'',connadd1||','||connadd2||','||connadd3||','||connadd4,phase,secname,APPL_FEES,to_char(sysdate,'DD-MM-YYYY'),catcode,' ',' ',a.scno,nvl(status,0),nvl(APPL_FEES_GST,0),'0','0','0','0', nvl(c.mail_id,'N'),'N',0 from netmtr_register a,all_section b,CSCMASTER c where a.seccd=b.uk_seccd and a.nrcscno= c.cscno and nrregno='"+regno+"'");
				purpose="NetMtrConn";
				title="Net Meter";
			}
			else if(regno.startsWith("NR"))
			{
				rs=stmt.executeQuery("select nrcscno,nrregno,to_char(nrregdate,'dd/mm/yyyy'),APPLICANT_NAME,MOBILENO,EMAILID,APPL_FEES,DEVLOPCHRGS,SECURITYDEP,decode(catcode,1,'DOMESTIC',2,'NON-DOMESTIC AND COMMERCIAL',3,'INDUSTRIAL',4,'COTTAGE INDUSTRIES AND DHOBIGHATS',5,'AGRICULTURAL',6,'STREET LIGHT PWS',7,'GENERAL PURPOSE',8,'TEMPORARY SUPPLY',''),CONTRACTLD||' '||METRIC,a.SECCD,b.unitcd,b.sap_seccd,to_char(resolveDate(sysdate,2),'dd/mm/yyyy'),FATHER_NAME,connadd1||','||connadd2||','||connadd3||','||connadd4,phase,secname,ddamount,to_char(sysdate,'DD-MM-YYYY') ,catcode, a.SOCIALGROUP,nvl(a.SCHEME,' '),' ',nvl(status,0),nvl(APPL_FEES_GST,0),nvl(dcgst,0),'0','0','0', nvl(c.mail_id,'N'),'N',0 from newconnection_register a,all_section b,CSCMASTER c where a.seccd=b.uk_seccd and a.nrcscno=c.cscno and nrregno='"+regno+"'");
				purpose="NewConnection";
				title="New Service Connection";
			}
			else if(regno.startsWith("LTM"))
			{
				rs=stmt.executeQuery("select a.cscno,registration_number,to_char(registration_on,'dd/mm/yyyy'),APARTMENT_NAME,MOBILE,' ' EMAIL,APP_FEE,0,0,no_of_flats,DOMESTIC_LOAD,a.office_id,b.unitcd,b.sap_seccd,'','','Apartment Registration',no_of_conn_reqd,secname,APP_FEE+nvl(AF_CGST,0)+nvl(AF_SGST,0),to_char(sysdate,'DD-MM-YYYY') ,nvl(category_id,0),nvl(commercial_load,0),nof_domestic_con,nof_commercial_con,nvl(status,0),nvl(AF_CGST,0)+nvl(AF_SGST,0),0 dcgst,'0','0','0', nvl(c.mail_id,'N'),'N',0 from apartment_connection a,all_section b,CSCMASTER c where a.office_id=b.uk_seccd and a.CSCNO= c.cscno and registration_number='"+regno+"'");
				purpose="LTM Registration";
			}
			else
			{
				rs=stmt.executeQuery("select a.cscno,complaint_no,to_char(complaint_given_on,'dd/mm/yyyy'),NAME,MOBILE_NO,EMAIL,nvl(APP_FEE,0),nvl(DEV_CHRGS,0),nvl(SECURITY_DEPOSIT,0),decode(category_id,1,'DOMESTIC',2,'NON-DOMESTIC AND COMMERCIAL',3,'INDUSTRIAL',4,'COTTAGE INDUSTRIES AND DHOBIGHATS',5,'AGRICULTURAL',6,'STREET LIGHT PWS',7,'GENERAL PURPOSE',8,'TEMPORARY SUPPLY',''),CONTRACTED_LOAD,a.SECCD,b.unitcd,b.sap_seccd,decode(complaint_natureid,47,cons_new_name,''),complaint_natureid,c.complaint_nature,phase,secname,tobe_paid_amt,to_char(sysdate,'DD-MM-YYYY') ,category_id, nvl(reqd_load,0),decode(nvl(reqd_category_id,0),1,'DOMESTIC',2,'NON-DOMESTIC AND COMMERCIAL',3,'INDUSTRIAL',4,'COTTAGE INDUSTRIES AND DHOBIGHATS',5,'AGRICULTURAL',6,'STREET LIGHT PWS',7,'GENERAL PURPOSE',8,'TEMPORARY SUPPLY',''),a.scno,nvl(status,0),nvl(APPL_FEES_GST,0),nvl(dcgst,0),nvl(a.amount,0),nvl(a.oth_cgst,0),nvl(a.oth_sgst,0), nvl(d.mail_id,'N'),nvl(a.type,'N'),nvl(adv_cc_ch,0) from complaint_details a,all_section b,complaint_nature c,CSCMASTER d where a.seccd=b.uk_seccd and a.complaint_natureid=c.id and a.cscno= d.cscno and complaint_no='"+regno+"'");
				purpose="Complaint";
			}
			
			if(rs.next())
			{
				regdt=rs.getString(3);
				name=rs.getString(4);
				cmobile=rs.getString(5);
				email=rs.getString(6);
				category=rs.getString(10);
				contld=rs.getString(11);
				cscno=rs.getString(1);
				rsd=rs.getString(9);
				rdc=rs.getString(8);
				raf=rs.getString(7);
				seccd=rs.getString(12);
				unitcd=rs.getString(13);
				sapseccd=rs.getString(14);
				resdt=rs.getString(15);
				fname=rs.getString(16);
				connadd=rs.getString(17);
				phase=rs.getString(18);
				secname=rs.getString(19);
				ddamt=rs.getString(20);
				prdt=rs.getString(21);
				catcode=rs.getString(22);
				socialgp=rs.getString(23);
				scheme=rs.getString(24);
				ctscno=rs.getString(25);
				status=rs.getString(26);
				afgst=rs.getString(27);
				dcgst=rs.getString(28);
				gst=(Double.parseDouble(afgst)/2);

				if(raf.equals("29.5")||raf.equals("29.50"))
					raf="25";
				if(raf.equals("59")||raf.equals("59.0"))
					raf="50";
				if(raf.equals("2950")||raf.equals("2950.0"))
					raf="2500";
				if(raf.equals("17700")||raf.equals("17700.0"))
					raf="15000";
		
				if(Double.parseDouble(dcgst)>0)
				{
					dccgst=(Double.parseDouble(dcgst)/2);
					dcsgst=(Double.parseDouble(dcgst)/2);
				}
				othchgs=Double.parseDouble(rs.getString(29));
				othcgst=Double.parseDouble(rs.getString(30));
				othsgst=Double.parseDouble(rs.getString(31));
				cscmailid=rs.getString(32);
				etype=rs.getString(33);
				advcc=rs.getString(34);
				if(catcode.equals("3")||catcode.equals("4"))
				{
					metric="HP";
				}
				else
				{
					metric="Watts";
				}

				if(regno.startsWith("CC")||regno.startsWith("AL"))
				{
					title=connadd;
					reqld=socialgp;
				}

				ResultSet rsdup=stmt.executeQuery("SELECT ID FROM PAYMENT_MASTER WHERE TREFNO='"+trnsid+"' AND CASHIER_ID=9");

				if(!rsdup.next())
				{
					ResultSet rs1=stmt.executeQuery("SELECT WEBPMTNO_GEN_SEQ.NEXTVAL FROM DUAL");
					rs1.next();
					String islno=rs1.getString(1);
					prno=cscno+curryear[2]+leftPadding(islno,6);
					//System.out.println("prno:"+prno);
					String iqry="";
					String ieqry="";

					if(status.equals("2"))
					{

					}
					else
					{
						iqry="INSERT INTO PAYMENT_MASTER(ID,PAYMENT_MODE,AMOUNT,CHEQUE_DD_NUMBER,CHEQUE_DD_DATE,BANK_NAME,PRNO, PR_DATE, SECURITY_DEPOSIT,DEVELOPMENT_CHARGES,APP_FEE,CASHIER_ID,REG_NO,created_by,CREATE_DATE, CSCNO,office_id,applicant_name,prno_at,PURPOSE,unitcd,sap_seccd,onlinebank_code,issent,trefno,AFCGST,AFSGST,DC_CGST,DC_SGST,other_amount, oth_cgst, oth_sgst,adv_cc_ch) VALUES('"+prno+"','net','"+pdamt+"',substr('"+trnsid+"',5), TO_DATE('"+trnsdt+"','DD-MM-YYYY HH24:MI:SS'),'106','"+prno+"',sysdate,'"+rsd+"','"+rdc+"', '"+raf+"','9','"+regno+"',9,SYSDATE,'"+cscno+"','"+seccd+"','"+name+"','NET','"+purpose+"',"+unitcd+","+sapseccd+",'"+bankcd+"','Y','"+trnsid+"',"+gst+","+gst+","+dccgst+","+dcsgst+","+othchgs+","+othcgst+","+othsgst+","+advcc+")";

						ieqry="INSERT INTO PAYMENT_MASTER_EBS(ID,PAYMENT_MODE,AMOUNT,CHEQUE_DD_NUMBER,CHEQUE_DD_DATE,BANK_NAME,PRNO, PR_DATE, SECURITY_DEPOSIT,DEVELOPMENT_CHARGES,APP_FEE,CASHIER_ID,REG_NO,created_by,CREATE_DATE, CSCNO,office_id,applicant_name,prno_at,PURPOSE,unitcd,sap_seccd,onlinebank_code,AFCGST,AFSGST,DC_CGST,DC_SGST,other_amount, oth_cgst, oth_sgst,adv_cc_ch) VALUES('"+prno+"','net','"+pdamt+"','"+trnsid+"', TO_DATE('"+trnsdt+"','DD-MM-YYYY HH24:MI:SS'),'106','"+prno+"',sysdate,'"+rsd+"','"+rdc+"', '"+raf+"','9','"+regno+"',9,SYSDATE,'"+cscno+"','"+seccd+"','"+name+"','NET','"+purpose+"',"+unitcd+","+sapseccd+",'"+bankcd+"',"+gst+","+gst+","+dccgst+","+dcsgst+","+othchgs+","+othcgst+","+othsgst+","+advcc+")";
			
						String uqry="";
						if(regno.startsWith("NR"))
						{
							String regstatus="4";
							if(catcode.equals("5"))
							regstatus="1";
							//uqry="update newconnection_register b set status=0,tobereL_dt=resolveDate(sysdate,(select decode(type,'Y',15,decode(a.location_type,1,2,7)) from  newconnection_register a where a.nrregno=b.nrregno)), ESCALATION1_DT=resolveDate(sysdate,(select decode(type,'Y',7,decode(a.location_type,1,1,3)) from  newconnection_register a where a.nrregno=b.nrregno)), ESCALATION2_DT=resolveDate(sysdate,(select decode(type,'Y',12,decode(a.location_type,1,1,5)) from  newconnection_register a where a.nrregno=b.nrregno)),int_pay_rec='Y' where nrregno='"+regno+"'";
							uqry="update newconnection_register b set status=0,tobereL_dt=resolveDate(sysdate,(select decode(type,'Y',15,7) from  newconnection_register a where a.nrregno=b.nrregno)), ESCALATION1_DT=resolveDate(sysdate,(select decode(type,'Y',7,3) from  newconnection_register a where a.nrregno=b.nrregno)), ESCALATION2_DT=resolveDate(sysdate,(select decode(type,'Y',12,5) from  newconnection_register a where a.nrregno=b.nrregno)),int_pay_rec='Y' where nrregno='"+regno+"'";
						}
						else if(regno.startsWith("NT"))
						{
							uqry="update NETMTR_REGISTER set STATUS=0,TOBETFDATE=resolvedate(sysdate,10),TOBETFADEDT=resolvedate(sysdate,10),TFLEVEL='ADE' where nrregno='"+regno+"'";
						}
						else if(regno.startsWith("LTM"))
						{
							uqry="update apartment_connection set STATUS=0,int_pay_rec='Y',int_paid_dt=sysdate,escalation1_dt=resolvedate(sysdate,3),escalation2_dt=resolvedate(sysdate,7), escalation3_dt=resolvedate(sysdate,15) where registration_number='"+regno+"'";
						}
						else
						{
							String st3[]={"19","20","22","46","58","61","65","71","72","73","76","77","82","83","93","94","95","96","97","98","99","100","101","102"};
							String st1[]={"24","40","53","54","59","67","69","62","70","78","64","45"};
							Vector vst1= new Vector();
							Vector vst3= new Vector();
							Collections.addAll(vst1, st1);
							Collections.addAll(vst3, st3);
							String cond="STATUS=0";
							//if(fname.equals("24")||fname.equals("40")||fname.equals("53")||fname.equals("54")||fname.equals("59")||fname.equals("67")||fname.equals("69"))
							if(vst1.contains(fname))
							{
								cond="STATUS=1";
							}
							if(vst3.contains(fname))
							{
								cond="STATUS=3";
							}
							if(fname.equals("40"))
							{
								if(etype.equals("N"))
								{
									cond="STATUS=3";
								}
							}
							uqry="update complaint_details set "+cond+",int_pay_rec='Y' where complaint_no='"+regno+"'";
							//System.out.println("uqry:"+uqry);
						}
						stmt.addBatch(iqry);
						stmt.addBatch(ieqry);
						stmt.addBatch(uqry);
						if(regno.startsWith("NR") && catcode.equals("5"))
						{
							Statement stmtagl=con.createStatement();
							ResultSet rsno=stmtagl.executeQuery("select max(slno)+1 from agl_seniority where seccd="+seccd);
							rsno.next();
							String agl_slno=rsno.getString(1);
							String exclude="";
							if(scheme.equals("J")||scheme.equals("CLD"))
								exclude="Y";
							stmt.addBatch("insert into agl_seniority(seccd,nrregno,nrregdate,caste,scheme,slno,exclude,issap)  values("+seccd+",'"+regno+"',sysdate,'"+socialgp+"','"+scheme+"',"+agl_slno+",'"+exclude+"','N')");
							rsno.close();
							stmtagl.close();
						}
					}
					stmt.executeBatch();
					con.commit();
					rs1.close();

					Statement stmtdiv=con.createStatement();
					ResultSet rsdiv=stmtdiv.executeQuery("select division_name,mobileno,mailid from division where division_cd=(select divcd from all_subdivision where uk_subdiv=(select subdiv from all_section where uk_seccd="+seccd+"))");
					rsdiv.next();
					try
					{
						String smsmess="";
						if(regno.startsWith("NT"))
						{
							smsmess="Dear Consumer, amount of Rs."+paidamt+" is received for Net Metering Application Reg.No."+regno;
						}
						else if(regno.startsWith("NR"))
						{
							smsmess="Dear Consumer, amount of Rs."+paidamt+" is received for New Service Application Reg.No."+regno;
						}
						else if(regno.startsWith("AL"))
						{
							smsmess="Dear Consumer, amount of Rs."+paidamt+" is received for extension of load with Reg.No."+regno;
						}
						else
						{
							smsmess="Dear Consumer, amount of Rs."+paidamt+" is received against the Reg.No."+regno;
						}
						System.out.println("*************    SMS online reg *************"+cmobile+", "+smsmess);
						String res_sms=SMSSender.sendMsg(cmobile,smsmess);
						System.out.println("res_sms res:"+res_sms);
						System.out.println("*************    SMS online end *************");
					}catch(Exception exsms){System.out.println("---------regpmtsms:"+exsms.getMessage());}
					if(regno.startsWith("NR"))
					{
						try
						{
							SendMail sm1=new SendMail(rsdiv.getString(3),"Online Registration of new service connection with No."+regno+" through TSSPDCL webportal on "+regdt+" -Regd.","To\nThe Divisional Engineer,\nOperation,\n"+rsdiv.getString(1)+"\n\n Sir,\n\n Name:"+name+" From:"+email+",Mobile:"+cmobile+"\n\n New Service connection request through TSSPDCL webportal with No."+regno+" has been registered with category "+category+",Contracted load "+contld+" and amount of Rs."+pdamt+".\n\n You are requested to arrange to cause necessary instruction for release of service on or before "+resdt+".\n\n Thanking you.",null);
							boolean bde=sm1.send();
			
							SendMail sm2=new SendMail(email,"TSSPDCL online New Service connection request  -Regd.","Dear "+name+"\n\n\tYour new connection request through TSSPDCL webportal has been registered with "+regno+".\nPlease submit self attested documents to departmental staff along with signed acknowledgement at the time of fixing of meter. In case of any grievance you are requested to contact DE/Op/"+rsdiv.getString(1)+", Mobile No."+rsdiv.getString(2)+" and Mail ID "+rsdiv.getString(3)+" for further correspondence.\n\n\tThanking you",null);
							boolean bcons=sm2.send();
							//System.out.println("bcons:"+bcons);
							//SendMail sm3=new SendMail("customerservice@tssouthernpower.com","Online Registration of new service connection with No."+regno+" through TSSPDCL webportal on "+regdt+" -Regd.","To\nThe Divisional Engineer,\nOperation,\n"+rsdiv.getString(1)+"\n\n Sir,\n\n Name:"+name+" From:"+email+",Mobile:"+cmobile+"\n\n New Service connection request through TSSPDCL webportal with No."+regno+" has been registered with category "+category+",Contracted load "+contld+" and amount of Rs."+pdamt+".\n\n You are requested to arrange to cause necessary instruction for release of service on or before "+resdt+".\n\n Thanking you.",null);
							//boolean bcsc=sm3.send();

							Statement stmtaao=con.createStatement();
							ResultSet rsaao=stmtaao.executeQuery("select ero_name,mobileno,mailid from ero_code where erocd=(select erocd from all_section where uk_seccd="+seccd+")");
							rsaao.next();

							SendMail sm4=new SendMail(rsaao.getString(3),"Online Registration of new service connection with No."+regno+" through TSSPDCL webportal on "+regdt+" -Regd.","To\nThe Divisional Engineer,\nOperation,\n"+rsdiv.getString(1)+"\n\n Sir,\n\n Name:"+name+" From:"+email+",Mobile:"+cmobile+"\n\n New Service connection request through TSSPDCL webportal with No."+regno+" has been registered with category "+category+",Contracted load "+contld+"and amount of Rs."+pdamt+".\n\n You are requested to arrange to cause necessary instruction for release of service on or before "+resdt+".\n\n Thanking you.",null);
							boolean baao=sm4.send();

							//SendMail sm5=new SendMail("cgmfin@tssouthernpower.com","Online Registration of new service connection with No."+regno+" through TSSPDCL webportal on "+regdt+" -Regd.","To\nThe Divisional Engineer,\nOperation,\n"+rsdiv.getString(1)+"\n\n Sir,\n\n Name:"+name+" From:"+email+",Mobile:"+cmobile+"\n\n New Service connection request through TSSPDCL webportal with No."+regno+" has been registered with category "+category+",Contracted load "+contld+"and amount of Rs."+pdamt+".\n\n You are requested to arrange to cause necessary instruction for release of service on or before "+resdt+".\n\n Thanking you.",null);
							//boolean bcgm=sm5.send();

						}
						catch(Exception exsms)
						{System.out.println(exsms.getMessage());exsms.printStackTrace();}
						rsdiv.close();
						try
						{
							String regsapres="N";
							String ipaysapres=NRRegistration.initPay(con,regno);
							if(ipaysapres.equals("9"))
							regsapres=NRRegistration.registerCon(con,regno);

							if(catcode.equals("5"))
							{
								String srsapres=NRRegistration.aglSeniority(con,regno);
							}
							System.out.println(regno+" NR reg:"+regsapres+" ipmt:"+ipaysapres);
						}catch(Exception exsap){System.out.println("nrexsap:"+exsap.getMessage());}
					}
					if(regno.startsWith("CC")||regno.startsWith("AL"))
					{
						try
						{
							String regsapres="N";
							String ipaysapres=CCRegistration.initPay(con,regno);
							if(ipaysapres.equals("9"))
							regsapres=CCRegistration.registerCon(con,regno);
							System.out.println(regno+" CC reg:"+regsapres+" ipmt:"+ipaysapres);
						}catch(Exception exsap){System.out.println("ccexsap:"+exsap.getMessage());}
					}
					if(regno.startsWith("LTM"))
					{
						try
						{
							String regsapres="N";
							String ipaysapres=LTMRegistration.initPay(con,regno);
							if(ipaysapres.equals("9"))
							regsapres=LTMRegistration.registerCon(con,regno);
							System.out.println(regno+" LTM reg:"+regsapres+" ipmt:"+ipaysapres);
						}catch(Exception exsap){System.out.println("ltmexsap:"+exsap.getMessage());}
					}
				}
				else
				{
					System.out.println("-----------\nDuplicate call\n ---------\n"+regno);
				}
				rsdup.close();
			}
			else
			{
				System.out.println("--------- NO REG FOUND ---------");
			}
			con.commit();
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "RegistrationPmt";
		
	}
	
	
	String leftPadding(String str1,int x)
	{
		String ipadding="";
		for(int i=1;i<=x-str1.length();i++)
		{
			ipadding+="0";
		}

		return (ipadding+str1);
	}
	/*@PostMapping(path = "/save",consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
			public void handleBrowserSubmissions(ApplicationDataModel AppData) throws Exception {
			    // Save feedback data
			System.out.println(AppData.getApplicant_name());
		
		InsertNR in = new InsertNR();
		in.insert(AppData);
		//return "redirect:/feedback/success";
			   
			}
	
	/*@GetMapping("/feedback/success")
	public ResponseEntity<String> getSuccess() {
	    return new ResponseEntity<String>("Thank you for submitting feedback.", HttpStatus.OK);
	}*/
	

}
