package com.tsspdcl.onlinecsc.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LTMAppDataModel {
	
	private String is_dbh;
	private String applicant_name;
	private String conn_address1;
	private String conn_address2;
	private String conn_address3;
	private String conn_address4;
	private String submission_on;
	private String conn_pincode;
	private String mobileno;
	private String email;
	private String comm_address1;
	private String comm_address2;
	private String comm_address3;
	private String comm_address4;
	private String comm_pincode;
	private String comm_phoneno;
	private String number_total_flats;
	private String number_dom_connections;
	private String number_com_connections;
	private String dom_load;
	private String com_load;
	private String est_type;
	private String gstn_flag;
	private String gstno;
	private String gstn_updated_on;
	private String extension;
	private String regdoc;
	private String regdoctype;
	private String regdocno;
	private String approval_plan_no;
	
	private String is_occupancy;
	private String occ_no;
	private String occ_issued_by;
	private String occ_issue_date;
	private String occ_flats;
	private String is_height_less;
	private String is_occ_submit_later;
	
	private String adj_uscno;
	private String  area_name;
	private String  area_code;
	private String  section_code;
	private String  ero_code;
	private String  csc_number;
	private String  area_group;
	
	private MultipartFile applicant_photo ;
	private MultipartFile id_proof;
	private MultipartFile premises_proof;
	private MultipartFile registration_proof;
	
}
