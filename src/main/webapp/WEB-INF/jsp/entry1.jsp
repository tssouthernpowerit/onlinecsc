<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="stag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TSSPDCL-New Service Registration</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="${pageContext.request.contextPath}/script/script.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body onload="mainFunction()">
	<form name="f2" method="POST">
	<input type="hidden" name="area_name">
	<input type="hidden" name="section_code">
	<input type="hidden" name="ero_code">
	<input type="hidden" name="csc_number">
	<input type="hidden" name="area_group">
	
	<input type="hidden" id="xarea_code" value="${adm.area_code}">
	<input type="hidden" id="xidproof_type" value="${adm.idproof_type}">
	<input type="hidden" id="xcategory" value="${adm.category}">
	<input type="hidden" id="xsub_category" value="${adm.sub_category}">
	<input type="hidden" id="xserv_type" value="${adm.serv_type}">
	<input type="hidden" id="xgov_code" value="${adm.gov_code}">
	<input type="hidden" id="xhod_code" value="${adm.hod_code}">
	<input type="hidden" id="xmunicipality" value="${adm.municipality}">
	<input type="hidden" id="xcons_status" value="${adm.cons_status}">
	<input type="hidden" id="xgstn_flag" value="${adm.gstn_flag}">
	<input type="hidden" id="xsupply_nature" value="${adm.supply_nature}">

	<input type="hidden" id="xgender" value="${adm.gender}">
	<input type="hidden" id="xsocial_grp" value="${adm.social_grp}">
	<input type="hidden" id="xphase" value="${adm.phase}">
	<input type="hidden" id="xlocation_type" value="${adm.location_type}">
	<input type="hidden" id="xsez" value="${adm.sez}">
	<input type="hidden" id="xcomnserv" value="${adm.comnserv}">
	<input type="hidden" id="xregdoc" value="${adm.regdoc}">
	<input type="hidden" id="xregdoctype" value="${adm.regdoctype}">
	<input type="hidden" id="xextension" value="${adm.extension}">
	
	<input type="hidden" id="regno" value="${adm.regno}" name="regno">
	<input type="hidden" id="xaphotoUrl" value="${adm.aphotoUrl}">
	<input type="hidden" id="xiproofUrl" value="${adm.iproofUrl}">
	<input type="hidden" id="xsdeedUrl" value="${adm.sdeedUrl}">
	<input type="hidden" id="xlphotoUrl" value="${adm.lphotoUrl}">
		
    <div class="topbar"></div>
    <div class="navbar"> <h3>LT - New Service Connection Registration</h3> </div>
    <div class="login-unit">
        <div class="login-section">
            <div class="quest-div-top">Any existing service connections in the same premises on the applicant name and address ?</div>
            <div class="button-div1">
                <button type="button" class="btn-yn" onclick="showYes()"> Yes</button> &nbsp; &nbsp;<button type="button"class="btn-yn" onclick="showNo()">No</button>
            </div>

            <div class="existdiv" id="yesdiv" style="display: none;">
                <div class="row">
                    <div class="floating-label-content fl1">
                        <label class="label1">No.of Existing Service Connections</label> 
                        <input class="input-text1" type="number" id="existcount" maxlength="1"  oninput="generateBox()">
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content" id="uksc-div1" style="display: none;">
                        <input class="floating-input" type="text" id="uksc1" placeholder=" ">
                        <label class="floating-label" id="uksc-label1"></label>
                    </div>
                    <div class="floating-label-content" id="uksc-div2" style="display: none;">
                        <input class="floating-input" type="text" id="uksc2" placeholder=" ">
                        <label class="floating-label"  id="uksc-label2"></label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content" id="uksc-div3" style="display: none;">
                        <input class="floating-input" type="text" id="uksc3" placeholder=" ">
                        <label class="floating-label"  id="uksc-label3"></label>
                    </div>
                    <div class="floating-label-content" id="uksc-div4" style="display: none;">
                        <input class="floating-input" type="text" id="uksc4" placeholder=" ">
                        <label class="floating-label"  id="uksc-label4"></label>
                    </div>
                </div>
            </div>
            <div class="existdiv" id="nodiv" style="display: none;">
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="adj_uscno" id="adj_uscno" value="${adm.adj_uscno}" 
                        												placeholder="test" oninput="checkUSCNO(1);">
                        <label class="floating-label">Neighbouring Unique Service No.</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="section" id="section" value="${adm.section_name}" readonly>
                        <label class="floating-label">Section</label>
                    </div>
                </div>

            </div>

            <div class="section-input">

                <div class="subheader">Applicant Details</div>               
                <div class="row">
                    <div class="floating-label-content">
                        <select class="floating-select" name="idproof_type" id="idproof_type"	onclick="this.setAttribute('value', this.value);" 
                        																		onchange="this.setAttribute('value', this.value);
                        																					changeIdNumLabel(1);">
                            <option value=""></option>
							<option value='Aadhar copy'>Aadhar copy</option>
                       		<option value='Driving Licence'>Driving Licence</option>
                       		<option value='PAN Card'>PAN Card </option>
                       		<option value='Ration Card'>Ration Card </option>
                       		<option value='Voter Card'>Voter Card</option>
                       		<option value='Passport'>Passport</option>
                        </select>
                        <label class="floating-label">Select ID Proof Type</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="idproof_no" id="idproof_no" value="${adm.idproof_no}">
                        <label class="floating-label" id="idproof_num_label">ID Proof Number</label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="applicant_name" id="applicant_name" value="${adm.applicant_name}">
                        <label class="floating-label" id = "applicant_name_label">Applicant's Name as in ID Proof</label>
                    </div>
                    <div class="floating-label-content">
                        <select class="floating-select" name="gender" id="gender"   onclick="this.setAttribute('value', this.value);" 
                        															onchange="this.setAttribute('value', this.value);" >
                        	
                        	<option value=""></option>														
                            <option value="Mr">Mr</option>
                       		<option value="Mrs">Mrs</option>
                       		<option value="Miss">Miss</option>
                       		<option value="Others">Others</option>
                        </select>
                        <label class="floating-label">Select Gender</label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="father_name" id="father_name" value="${adm.father_name}">
                        <label class="floating-label">Name of Father/Husband</label>
                    </div>
                    <div class="floating-label-content">
                        <select class="floating-select" name="social_grp" id="social_grp" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);">
                            <option value=""></option>
                            <option value="SC" >SC</option>
                            <option value="ST" >ST</option>
                            <option value="OBC" >OBC</option>
                            <option value="GENERAL" >General</option>
                        </select>
                        <label class="floating-label">Social Group</label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="section1" id="section1" value="${adm.section_name}" readonly>
                        <label class="floating-label">Section</label>
                    </div>
                    <div class="floating-label-content">
                        <select class="floating-select" name="area_code" id="area_code"  onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);
                        																								getArea();"
                        																 >
                            <option value="${adm.area_code}">${adm.area_name}</option>
                        </select>
                        <label class="floating-label">Select Area</label>
                    </div>
                </div>

                <div class="subheader">Address of Connection</div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="conn_address1" id="conn_address1" value="${adm.conn_address1}">
                        <label class="floating-label">Door No. , Building Name</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="conn_address2" id="conn_address2" value="${adm.conn_address2}">
                        <label class="floating-label">Street</label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="conn_address3" id="conn_address3" value="${adm.conn_address3}">
                        <label class="floating-label">Village/City</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="conn_address4" id="conn_address4" value="${adm.conn_address4}">
                        <label class="floating-label">Mandal</label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="pincode" id="pincode" value="${adm.pincode}">
                        <label class="floating-label">Pin Code</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text"  name="phoneno" id="phoneno" value="${adm.phoneno}">
                        <label class="floating-label">Phone Number</label>
                    </div>
                </div>

                <div class="subheader">Address for Communication</div>
                <div class="same-addr-label-div">
                    <label for="same_addr" class="label-checkbox1">Same as Connection Address</label>
                    <input type="checkbox" class="input-checkbox1" name="same_addr" id="same_addr" value="" onclick="sameAddress();">
                    
                </div>
                <div id="same-addr-div">
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="comm_address1" id="comm_address1" value="${adm.comm_address1}">
                        <label class="floating-label">Door No. , Building Name</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="comm_address2" id="comm_address2" value="${adm.comm_address2}">
                        <label class="floating-label">Street</label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="comm_address3" id="comm_address3" value="${adm.comm_address3}">
                        <label class="floating-label">Village/City</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="comm_address4" id="comm_address4" value="${adm.comm_address4}">
                        <label class="floating-label">Mandal</label>
                    </div>
                </div>
                <div class="row">
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="comm_pincode" id="comm_pincode"  value="${adm.comm_pincode}">
                        <label class="floating-label">Pin Code</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" type="text" name="comm_phoneno" id="comm_phoneno"  value="${adm.comm_phoneno}">
                        <label class="floating-label">Phone Number</label>
                    </div>
                </div>
                </div>

                <div class="subheader">Connection Details</div>
                <div class="row">
                    <div class="floating-label-content">
                        <select class="floating-select" name ="category" id="category" onclick="this.setAttribute('value', this.value);" 
                        															   onchange="this.setAttribute('value', this.value);
                        																					getSubCategory(1);">
                            <option value=""></option>
                            <option value='1' >1-DOMESTIC</option>
       						<option value='2' >2-NON-DOMESTIC AND COMMERCIAL</option>
       						<option value='3' >3-INDUSTRIAL</option>
       						<option value='4' >4-COTTAGE INDUSTRIES AND DHOBIGHATS</option>
       						<option value='5' >5-AGRICULTURAL</option>
       						<option value='6' >6-LOCALBODIES-STREETLIGHT/PWS SCHEME</option>
       						<option value='7' >7-GENERAL PURPOSE</option>
       						<option value='8' >8-TEMPORARY SUPPLY</option>
       						<option value="9" >9-EV CHARGING STATIONS</option>
                        </select>
                        <label class="floating-label">Category</label>
                    </div>
                    <div class="floating-label-content" id="subcat-div">
                        <select class="floating-select" name="sub_category" id="sub_category" onclick="this.setAttribute('value', this.value);"
                        																	  onchange="this.setAttribute('value', this.value);
                        																								getCode1(1);">
                            <option value=""></option>
                        </select>
                        <label class="floating-label">Sub-Category</label>
                    </div>
                </div>
                
                <div class="row">           
                    <div class="floating-label-content">
                        <input class="floating-input" name="conn_load" id="conn_load" type="text" value="${adm.contract_load}">
                        <label class="floating-label" id="load-label">Connected Load in Watts</label>
                    </div>                               
                    <div class="floating-label-content" id="serv-type-div">
                        <select class="floating-select" name="serv_type" id="serv_type" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);
                        																						getCode2(1);">
                        																						 
                            <option value=""></option>
                            <option value="G" >Government</option>
             				<option value="NG" >Non-Government</option>
             				<option value="D" >Department (TSSPDCL)</option>
                        </select>
                        <label class="floating-label">Service Type</label>
                    </div>
                    
                </div>
                <div class="row" id="gov-hod-div" style="display:none">
                	<div class="floating-label-content">
                        <select class="floating-select" name="gov_code" id="gov_code" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);
                        																						getHodCode(1);" >
                        																						
                            <option value=""></option>
                        </select>
                        <label class="floating-label">Government Code</label>
                    </div>
                    <div class="floating-label-content">
                        <select class="floating-select" name="hod_code" id="hod_code" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" >
                        																
                            <option value=""></option>
                        </select>
                        <label class="floating-label">HOD Code</label>
                    </div>                   
                </div>
                <div class="row" id="temp-date-div" style="display:none">
                    <div class="floating-label-content">
                        <input class="floating-input" name="temp_fmdt" id="temp_fmdt" type="text" placeholder=" " data-inputmask-alias="datetime" 
                        																						  data-inputmask-inputformat="dd/mm/yyyy" 
                        																						  value="${adm.temp_fmdt}" data-mask disabled>
                        <label class="floating-label">Temp. Supply From date: in DD/MM/YYYY format</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" name="temp_todt" id="temp_todt" type="text" placeholder=" " data-inputmask-alias="datetime" 
                        																						  data-inputmask-inputformat="dd/mm/yyyy" 
                        																						  value="${adm.temp_todt}" data-mask disabled>
                        <label class="floating-label">Temp. Supply To date: in DD/MM/YYYY format</label>
                    </div>
                </div>
                <div class="row">
                	<div class="floating-label-content" >
                        <select class="floating-select" name="phase" id="phase"  onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" 
                        																>
                            <option value=""></option>
                            <option value="1" >1</option>
							<option value="3" >3</option>
                        </select>
                        <label class="floating-label">Phase</label>
                    </div>
                    <div class="floating-label-content">
                        <select class="floating-select" name="location_type" id="location_type" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" 
                        																>
                            <option value=""></option>
                            <option value="1" >Urban</option>
							<option value="2" >Rural</option>
                        </select>
                        <label class="floating-label">Location Type</label>
                    </div>                   
                </div>
                <div class="row">
                	<div class="floating-label-content" >
                        <select class="floating-select" name="sez" id="sez"  onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" 
                        																>
                            <option value=""></option>
                            <option value="Y" >Yes</option>
							<option value="N" >No</option>
                        </select>
                        <label class="floating-label">Is Special Economic Zone (SEZ) ?</label>
                    </div>
                    <div class="floating-label-content">
                        <select class="floating-select" name="comnserv" id="comnserv" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" 
                        																>
                            <option value=""></option>
                            <option value="Y" >Yes</option>
							<option value="N" >No</option>
                        </select>
                        <label class="floating-label">Is Common Service ?</label>
                    </div>                   
                </div>
                <div class="row">
                	<div class="floating-label-content" id="constatus-div" style="display:none;">
                        <select class="floating-select" name="cons_status" id="cons_status" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" 
                        																>
                            <option value=""></option>
                            <option value="1">Individual</option>
                            <option value="2">Registered PartnerShip</option>
                            <option value="3">UnRegistered PartnerShip</option>
                            <option value="4">Private Company</option>
                            <option value="5">Limited Company</option>
                            <option value="7">Any Other</option>
                            <option value="8">Government Institutions</option>
                        </select>
                        <label class="floating-label">Consumer Status</label>
                    </div>
                    <div class="floating-label-content" id="gstn-y-n-div" style="display:none">
                        <select class="floating-select" name="gstn_flag" id="gstn_flag" onclick="this.setAttribute('value', this.value);"
                        														onchange="this.setAttribute('value', this.value);
                        																							gstnYes();">
                            <option value=""></option>
                            <option value="Y" >Yes</option>
							<option value="N" >No</option>
                        </select>
                        <label class="floating-label">GSTIN Available ?</label>
                    </div> 
                </div>
                
                
                <div class="row" id="gstn-y-div" style="display:none">
                    <div class="floating-label-content">
                        <input class="floating-input" name="gstno" id="gstno" type="text" value="${adm.gstno}" onkeyup="this.value = this.value.toUpperCase();" 
                        																				  oncopy="return false" onpaste="return false">
                        <label class="floating-label">GSTN Number</label>
                    </div>
                    <div class="floating-label-content">
                       <input class="floating-input" name="cnfmgstno" id="cnfmgstno" type="text" value="${adm.gstno}" onkeyup="this.value = this.value.toUpperCase();" 
                        																				  oncopy="return false" onpaste="return false">
                        <label class="floating-label">Confirm GSTN Number</label>
                    </div>
                </div>
                
                 <div class="row">
                	<div class="floating-label-content" id="municipal-div" style="display:none">
                        <select class="floating-select" name="municipality" id="municipality"  onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" 
                        																>
                            <option value=""></option>
                        </select>
                        <label class="floating-label">Municipality</label>
                    </div>
                    <div class="floating-label-content" id="eqpoints-div" style="display:none">
                            <input class="floating-input" name="eqpoints" id="eqpoints" type="text" value="${adm.eqpoints}">
                        	<label class="floating-label">EQ Points</label>
                    </div> 
                </div>
                <div class="row">
                	<div class="floating-label-content">
                        <select class="floating-select" name="extension" id="extension" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);
                        																							estimateReq();">
                            <option value=""></option>
                            <option value="Y" >Yes</option>
							<option value="N" >No</option>
                        </select>
                        <label class="floating-label">Laying of Service Line Required ?</label>
                    </div>
                    <div class="floating-label-content">
                        <select class="floating-select" name="regdoc" id="regdoc" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);
                        																								RegisterDoc(1);" >
                            <option value=""></option>
                            <option value="Y" >Yes</option>
							<option value="N" >No</option>
                        </select>
                        <label class="floating-label">Registration Documents of Premises ?</label>
                    </div>                   
                </div>
                <div class="row" id="reg-doc-div1" style="display:none">
                    <div class="floating-label-content">
                        <select class="floating-select" name="regdoctype" id="regdoctype" onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" 
                        																>
                            <option value=""></option>
                            <option value='Registered Sale Deed'>Registered Sale Deed</option>
                          	<option value='Registered Gift Deed'>Registered Gift Deed</option>
							<option value='Registered Lease Deed'>Registered Lease Deed</option>
                        </select>
                        <label class="floating-label">Registration Document Type</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" name="regdocno" id="regdocno" type="text" value="${adm.regdocno}">
                        <label class="floating-label">Document Number</label>
                    </div>
                </div>
                <div class="row" id="reg-doc-div2" style="display:none">
                    <div class="floating-label-content">
                        <input class="floating-input" id="regdocdate" name="regdocdate" type="text" value="${adm.regdocdate}">
                        <label class="floating-label">Document Date</label>
                    </div>
                    <div class="floating-label-content">
                        <input class="floating-input" name="regdocpfc" id="regdocofc" type="text" value="">
                        <label class="floating-label">Registered Office</label>
                    </div>
                </div>
                <div class="row">
                	<div class="floating-label-content" id="nature_div" style="display:none">
                        <select class="floating-select" name="supply_nature" id="supply_nature"  onclick="this.setAttribute('value', this.value);"
                        																onchange="this.setAttribute('value', this.value);" >
                            <option value=""></option>
                        </select>
                        <label class="floating-label">Nature of Premises</label>
                    </div>                  
                </div>
                
                <div class="row">
                    <div class="row-section">
                        <div class="subheader sh1">Upload Documents</div>
                        <div class="div11">
	                        <div class="file-label-div">Applicant Photo ( JPG, max-size : 50KB )</div>
	                        <div class="file-input-div">
	                        	<input type="file" name="applicant_photo" id="applicant_photo" value=""  onchange="hidePreview(this.id)">	                        																	                        																
	                        	<a href ="getDocument/${adm.regno}/aphoto" class="GFG" id="preview1" target="new" style="display:none">preview</a>
	                        	<!--  <button type="button" id="loadimage_btn" onclick="loadInputFieldToPreview();"></button>
	                        	<img src id="image_preview" alt="img"> -->
	                        </div>
	                        <div class="file-label-div">Aadhar Copy ( JPG, max-size : 100KB )</div>
	                        <div class="file-input-div">
	                        	<input type="file" name="id_proof" id="id_proof" value="" onchange="hidePreview(this.id)">
	                       		<a href ="getDocument/${adm.regno}/iproof" class="GFG" id="preview2" target="new" style="display:none">preview</a>	                        	
	                        </div>
	                        <div class="file-label-div" id="p_doc"></div>
	                        <div class="file-input-div">
	                        	<input type="file" name="premises_proof" id="premises_proof" value="" onchange="hidePreview(this.id)">
	                        	<a href ="getDocument/${adm.regno}/sdeed" class="GFG" id="preview3" target="new" style="display:none">preview</a>
	                        </div>
	                        <div class="file-label-div">Location Photo (JPG, max-size : 200KB )</div>
	                        <div class="file-input-div">
	                        	<input type="file" name="location_photo" id="location_photo" value="" onchange="hidePreview(this.id)">
	                        	<a href ="getDocument/${adm.regno}/lphoto" class="GFG" id="preview4" target="new" style="display:none">preview</a>
	                        </div>
	                    </div>
                    </div>
                    <div class="row-section">
                        <div class="subheader sh1">Required Payment</div>
    					<div class="div11">
	                        <div class="fee-row">
	                            <div class="fee-column f-col1">Application Fee</div>
	                            <div class="fee-column f-col2" id="af"></div>
	                        </div>
	                        <div class="fee-row">
	                            <div class="fee-column f-col1">Application Fee GST</div>
	                            <div class="fee-column f-col2" id=afgst></div>
	                        </div>
	                        <div class="fee-row">
	                            <div class="fee-column f-col1">Security Deposit</div>
	                            <div class="fee-column f-col2" id="sd"></div>
	                        </div>
	                        <div class="fee-row">
	                            <div class="fee-column f-col1">Development Charges</div>
	                            <div class="fee-column f-col2" id="dc"></div>
	                        </div>
	                        <div class="fee-row">
	                            <div class="fee-column f-col1">Development Charges GST</div>
	                            <div class="fee-column f-col2" id="dcgst"></div>
	                        </div>
	                        <div class="fee-row total">
	                            <div class="fee-column f-col1">Total</div>
	                            <div class="fee-column f-col2" id="tot"></div>
	                        </div>
                    	</div>
                    </div>
                </div>
                
                
                
                
                
                <div class="button-div1 last">
                    <button type="button" class="btn-yn" onclick="finalSubmit(2);">Proceed</button>
                </div>
                
                
            </div>
        </div>
    </div>
    
    
    <script>
        AOS.init();
     </script> 
    </form>
</body>
</html>