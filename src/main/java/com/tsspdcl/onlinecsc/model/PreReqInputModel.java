package com.tsspdcl.onlinecsc.model;

import lombok.Data;

@Data
public class PreReqInputModel {
	
	private String category;
	private String subcategory;
	private double load;
	private String regdoc;
	private String extension;
}
