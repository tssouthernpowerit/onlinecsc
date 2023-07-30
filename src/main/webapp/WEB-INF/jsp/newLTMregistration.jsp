<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="stag" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>TSSPDCL-Apartment Connection Registration</title>
<!-- Fav Icon -->
<link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- Stylesheets -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&amp;display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/flaticon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/jquery-ui.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/color/theme-color.css" id="jssDefault" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap-float-label.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/whatsappchat.css" rel="stylesheet">
<!-- <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/additional-methods.js"></script>
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.js"></script> -->
</head>
<!-- page wrapper -->
<body>
   <div class="boxed_wrapper">
        <!-- preloader -->
        <div class="loader-wrap">
            <div class="preloader">
                <div class="preloader-close"><i class="fa fa-times"></i></div>
                <div id="handle-preloader" class="handle-preloader">
                    <div class="animation-preloader">
                        <div class="spinner"></div>
                        <div class="txt-loading">
                            <span data-text-preloader="T" class="letters-loading">
                                T
                            </span>
                            <span data-text-preloader="S" class="letters-loading">
                                S
                            </span>
                            <span data-text-preloader="S" class="letters-loading">
                                S
                            </span>
                            <span data-text-preloader="P" class="letters-loading">
                                P
                            </span>
                            <span data-text-preloader="D" class="letters-loading">
                                D
                            </span>
                            <span data-text-preloader="C" class="letters-loading">
                                C
                            </span>
                            <span data-text-preloader="L" class="letters-loading">
                                L
                            </span>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
        <!-- preloader end -->

        <!-- main header -->
        <header class="main-header">
           <!-- header-top -->
           <!-- <div class="header-top">
                <div class="top-inner clearfix">
                    <div class="left-column pull-left">
                        <ul class="info clearfix">
                            <li><i class="far fa-map-marker-alt"></i>Corporate Office, Mint Compound, HYDERABAD, TS</li>
                            <li><i class="far fa-clock"></i>Mon - Sat  9.00 - 18.00</li>
                            <li><i class="far fa-phone"></i><a href="tel:9999999999">+919999999999</a></li>
                        </ul>
                    </div>
                    <div class="right-column pull-right">
                        <ul class="social-links clearfix">
                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                            <li><a href="#"><span class="fab fa-instagram"></span></a></li>
                        </ul>
                       <div class="sign-box">
                            <a href="#"><i class="fas fa-user"></i>Sign In</a>
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- header-lower -->
            <div class="header-lower">
                <div class="outer-box">
                    <div class="main-box">
                        <div class="logo-box logo-box-left">
                            <figure class="logo"><a href="#"><img src="${pageContext.request.contextPath}/assets/images/logo.png" alt=""></a></figure>
                        </div>
                        <div class="logo-box logo-box-right">
                            <figure class="logo"><a href="#"><img src="${pageContext.request.contextPath}/assets/images/tsgovt.png" alt=""></a></figure>
                        </div>
                    </div>
                </div> 
            </div>

            <!--sticky Header-->
            <div class="sticky-header">
                <div class="outer-box">
                    <div class="main-box">
                        <div class="logo-box logo-box-left">
                            <figure class="logo"><a href="#"><img src="${pageContext.request.contextPath}/assets/images/logo.png" alt=""></a></figure>
                        </div>
                        <div class="logo-box logo-box-right">
                            <figure class="logo"><a href="#"><img src="${pageContext.request.contextPath}/assets/images/tsgovt.png" alt=""></a></figure>
                        </div>
                    </div>
                </div>
            </div>
            
        </header>
       
        <!--Page Title-->
        <section class="page-title-two bg-color-1 centred">
            <div class="auto-container">
                
                <div class="header-box-title">
                    <h1><i class="icon-1"></i>Apartment Connection Registration</h1>
                   <!--  కొత్త సర్వీస్ కనెక్షన్ నమోదు
                    नई सेवा कनेक्शन पंजीकरण -->
                    <!-- <div class="language-picker" id="languagePicker">
                        <button onclick="myFunction1()" class="dropbtn">
                            <i class="fa fa-globe"></i>
                            English
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div id="myDropdown1" class="dropdown-content">
                            <a href="#" id="en">English</a>
                            <a href="#" id="te">తెలుగు</a>
                            <a href="#" id="hi">हिंदी</a>
                        </div>
                    </div>
                    <div class="language-picker" id="languagePicker_Icon">
                        <button onclick="myFunction2()" class="dropbtn">
                            <i class="fa fa-globe"></i>
                        </button>
                       
                        <div id="myDropdown2" class="dropdown-content">
                            <a href="#" id="en">English</a>
                            <a href="#" id="te">తెలుగు</a>
                            <a href="#" id="hi">हिंदी</a>
                        </div>
                    </div> -->
                </div>
            </div>
        </section>
        <!--End Page Title-->
        <form name="newreg" id="newreg" method="POST">
		<input type="hidden" name="area_name" />
		<input type="hidden" name="section_code" />
		<input type="hidden" name="ero_code" />
		<input type="hidden" name="csc_number" />
		<input type="hidden" name="area_group" />
        <section class="category-section category-page mr-0 pt-60 pb-90">
            <div class="auto-container">
                <div class="wow slideInLeft animated" data-wow-delay="1000ms" data-wow-duration="1000ms">
                    <div class="container-fluid">
                    	<div class="rounded-box" style="padding:1rem;">
                    		<div class="row g-2">
                            	<div class="col-sm-12">
                            	
                                    <div class="row p-1 justify-content-center">
                                    	<div class="existing-services text-danger pt-2">
		                       				Are there any Service Connections Existing in the same premises with same Name and Address ?
		                       				<label class="radio-inline" for="scnoexty">
      											<input type="radio" name="scnoext" id="scnoexty" value="yes">Yes
    										</label>
    										<label class="radio-inline">
      											<input type="radio" name="scnoext" id="scnoextn" value="no">No
    										</label>
										    
				                      	</div>
                                	</div>
                                </div>
                           	</div>
                           	<div class="row g-2">
                            	<div class="col-sm-12">
                            	 	<div class="row d-flex justify-content-center p-2">
                                		<div class="form-group input-group col-sm-3" id="d-adjscno">
                                        	<label class="has-float-label">
                                           		<input class="form-control" type="text" id="adj_uscno" name="adj_uscno" placeholder=" "  maxlength="9" onblur="checkUSCNO(1,this.id,'');" onfocus="changeIcon('');" required/>
                                           		<span>Adjacent Unique Service Number</span>
                                        	</label>
                                        	<span class="input-group-addon">
                                        		<button class="search-button" type="button" data-toggle="tooltip" data-placement="bottom" title="Search Unique SC.No." onclick="checkUSCNO(1,'adj_uscno','');return true;" >
                                        		<span id='adj_icon'><i class='fa fa-search'></i></span>
                                        		<!--<span id='adj_icon'></span><i class="fa fa-search"></i>  -->
                                        		</button>
                                        	</span>
                                        </div>
                                        <div class="form-group input-group col-sm-2" id="d-secname">
                                   			<input class="form-control alert alert-primary custom-alert" type="text" id="adjsecname" name="adjsecname" value="Find your Section Name here" readonly/>
                                           	<!-- <button type="button" class="btn btn-primary custom-btn" id="adjsecname" name="adjsecname">Section Name</button> -->
                                        </div>
                                        <div class="form-group input-group col-sm-1 justify-content-center"  id="d-or">-OR-</div>
                                        <div class="form-group input-group col-sm-2" id="circle-div">
                                            <select class="floating-select" name="circle" id="circle"  
                                                onclick="this.setAttribute('value', this.value);"
                                                onchange="this.setAttribute('value', this.value); getSectionList(1);"
                                                value="">
                                                <option value=""></option>
                                            </select>
                                            <label class="floating-label eng">Circle/District</label>
                                            <label class="floating-label tel">ఏరియా/గ్రామం పేరు</label>
                                            <label class="floating-label hin">एरिया/गाँव नाम</label>
                                        </div> 
                                        <div id="section_spin" ></div> 
                                        <div class="form-group input-group col-sm-3" id="section-div">
                                            <select class="floating-select" name="section" id="section"  
                                                onclick="this.setAttribute('value', this.value);" 
                                                onchange="this.setAttribute('value', this.value); getAreaList(1);"
                                                value="">
                                                <option value=""></option>
                                            </select>
                                            <label class="floating-label eng">Section Name</label>
                                            <label class="floating-label tel">ఏరియా/గ్రామం పేరు</label>
                                            <label class="floating-label hin">एरिया/गाँव नाम</label>
                                        </div>
                                          
                                        <div class="form-group input-group col-sm-3"  id="d-noexistscnos">
                                        	<label class="has-float-label">
                                            	<input class="form-control" type="number" id="noscnos" name="noscnos" placeholder=" " maxlength="1"  data-toggle="tooltip" data-placement="left" />
                                               	<span>No.of Existing Service Connections</span>
                                          	</label>
                                        </div>	
                                        <div class="new_check_button" id="d-btn-check">
                                        	<button type="button" class="new_reg_btn">Check</button>
                                       	</div>
                                       	<div class="form-group">
                                        	<button  class="btn btn-light" type="button" data-placement="bottom" title="Help" data-toggle="modal" data-target="#modal-help"><i class="fa fa-question-circle fa-lg"></i></button>
                                         </div> 
                                    </div>
                                </div>       	
                            </div>           	
                            <span id="addscnos"></span>
                        </div>	       
                        <div id="form-container">        
                        <!-- <div class="row g-2 wow slideInLeft animated" data-wow-delay="00ms" data-wow-duration="2000ms"> -->
                        <div class="row g-2">
                            <div class="col-sm-6">
                                <div class="panel-heading eng">Builder Details</div>
                                <div class="panel-heading tel">దరఖాస్తుదారు వివరాలు</div>
                                <div class="panel-heading hin">आवेदक का विवरण</div>
                                <div class="rounded-box">
                                    <div class="form-group row p-3">
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-address-card-o"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="comp_name" name="comp_name" placeholder=" " />
                                                <span id="lan_comp_name">Company Name</span>
                                            </label>
                                         </div>
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-address-card-o"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="mch_id" name="mch_id" placeholder=" " />
                                                <span id="lan_mch_id">MCH Registration Id </span>
                                            </label>
                                         </div>
                                       <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="owner_name" name="owner_name" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_own_name">Name of the Owner</span>
                                            </label>
                                        </div> 
                                             
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="pan_no" name="pan_no" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_pan_no">PAN Number</span>
                                            </label>
                                        </div> 
                                        <div class="form-group input-group col-sm-6">
                                                <select class="floating-select" id="gstn_flag" name="gstn_flag" 
                                                    onclick="this.setAttribute('value', this.value);" 
                                                    onchange="this.setAttribute('value', this.value);gstnYes();"
                                                    value="">
                                                    <option value=""></option>
                                                    <option value="Y" >Yes</option>
                                                    <option value="N" >No</option>
                                                </select>
                                                <label class="floating-label eng">Is GSTIN Available?</label>
                                                <label class="floating-label tel">GSTIN అందుబాటులో ఉందా?</label>
                                                <label class="floating-label hin">क्या GSTIN उपलब्ध है?</label>
                                        </div>  
                                        <div class="form-group input-group col-sm-3">
                                               <label class="has-float-label">
                                                   <input class="form-control" type="text" id="gstno" name="gstno" placeholder=" "
                                                    onkeyup="this.value = this.value.toUpperCase();"  oncopy="return false" onpaste="return false" onblur="verifygst();" />
                                                    <span id="lan_gst"></span>
                                               </label>
                                        </div>    
                                        <div class="form-group input-group col-sm-3">
                                               <label class="has-float-label">
                                                   <input class="form-control" type="text" id="cnfmgstno" name="cnfmgstno" placeholder=" "
                                                    onkeyup="this.value = this.value.toUpperCase();" oncopy="return false" onpaste="return false" onblur="confirmgst();"/>
                                              		<span id="lan_con_gst"></span>
                                               </label>
                                         </div> 
                                    </div>
                                </div> 
                            </div> 
                            <div class="col-sm-6">
                                <div class="panel-heading">Apartment details</div>
                                <div class="rounded-box">
                                    <div class="form-group row p-3">      
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="apt_name" name="father_name" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_apt_name">Apartment Name</span>
                                            </label>
                                        </div> 
                                         <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="no_flats" name="father_name" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_no_flats">No. of Flats</span>
                                            </label>
                                        </div>   
                                        
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="dom_conn" name="father_name" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_dom_conn">No. of New Domestic Connections</span>
                                            </label>
                                        </div> 
                                         <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="dom_load" name="father_name" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_dom_load">Total New Domestic Contract Load</span>
                                            </label>
                                        </div> 
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="dom_conn" name="father_name" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_dom_conn">No. of New Commercial Connections</span>
                                            </label>
                                        </div> 
                                         <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="dom_load" name="father_name" placeholder=" " maxlength="35" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_dom_load">Total New Commercial Contract Load</span>
                                            </label>
                                        </div> 
                                        <div class="form-group input-group col-sm-6" id="area_code-div">
                                            <select class="floating-select" name="area_code" id="area_code"  
                                                onclick="this.setAttribute('value', this.value);" 
                                                onchange="this.setAttribute('value', this.value); getArea();"
                                                value="">
                                                <option value=""></option>
                                            </select>
                                            <label class="floating-label eng">Area/Village1</label>
                                            <label class="floating-label tel">ఏరియా/గ్రామం పేరు</label>
                                            <label class="floating-label hin">एरिया/गाँव नाम</label>
                                         </div>
                                         <div class="form-group input-group col-sm-6" id="area-div">
                                            <select class="floating-select" name="area" id="area"  
                                                onclick="this.setAttribute('value', this.value);" 
                                                onchange="this.setAttribute('value', this.value); getAreaName2();"
                                                value="">
                                                <option value=""></option>
                                            </select>
                                            <label class="floating-label eng">Area/Village2</label>
                                            <label class="floating-label tel">ఏరియా/గ్రామం పేరు</label>
                                            <label class="floating-label hin">एरिया/गाँव नाम</label>
                                        </div>
                                        <div class="form-group input-group col-sm-6">
                                           	<select class="floating-select" id="est_type" name="est_type" 
                                               onclick="this.setAttribute('value', this.value);" 
                                               onchange="this.setAttribute('value', this.value);"
                                               value="">
                                               <option value=""></option>
                                               <option value="Turn Key">Consumer</option>
                                               <option value="Department">Department</option>
                                            </select>
                                            <label class="floating-label eng">Work Execution by</label>
                                        </div> 										 
                                    </div>
                                </div>
                            </div>
                        </div>  
                        
                        <!-- <div class="row g-2 wow slideInLeft animated" data-wow-delay="00ms" data-wow-duration="2000ms"> -->
                        <div class="row g-2">
                            <div class="col-sm-6">
                                <div class="panel-heading eng">Apartment Address</div>
                                <div class="panel-heading tel">కనెక్షన్ కోసం చిరునామా</div>
                                <div class="panel-heading hin">कनेक्शन के लिए पता</div>

                                <div class="rounded-box">
                                    <div class="form-group row p-3">
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="conn_address1" name="conn_address1" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_con_addr1"></span>
                                            </label>
                                        </div>    
                                        <div class="form-group input-group col-sm-6">
                                            <!-- <span class="input-group-addon"><i class='fas fa-landmark'></i></span> -->
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="conn_address2" name="conn_address2" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_con_addr2"></span>
                                            </label>
                                        </div>    
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="conn_address3" name="conn_address3" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_con_addr3"></span>
                                            </label>
                                        </div>    
                                        <div class="form-group input-group col-sm-6">
                                            <!-- <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span> -->
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="conn_address4" name="conn_address4" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                <span id="lan_con_addr4"></span>
                                            </label>
                                        </div>
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-file-zip-o"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="number" id="conn_pincode" name="conn_pincode" placeholder=" "  onKeyPress="if(this.value.length==6) return false;"/>
                                                <span id="lan_con_pin"></span>
                                            </label>
                                        </div>    
                                        <div class="form-group input-group col-sm-6">
                                            <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span>
                                            <label class="has-float-label">
                                                <input class="form-control" type="text" id="mobileno" name="mobileno" placeholder="" value="${mobileno}" readonly/>
                                                <span id="lan_con_mobile"></span>
                                            </label>
                                        </div>      
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                            	<div class="panel-heading d-flex" style="flex-wrap: wrap; flex-direction: column;">
                            		<div>
	                            		<div class="eng pull-left">Address for Communication</div>
	                            		<div class="tel pull-left">కమ్యూనికేషన్ కోసం చిరునామా</div>
	                                	<div class="hin pull-left">संचार के लिए पता</div>
                                	</div>
        							<div class="custom-control custom-switch pull-right">
        								<input type="checkbox" class="custom-control-input heading" id="same_addr" name="same_addr" onclick="sameAddress();">
							        	<label class="custom-control-label heading" for="same_addr">Same as Apartment Address</label>
							    	</div>
        						</div>	
                                    <div class="rounded-box">
                                        <div class="form-group row p-3">
                                            <div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_address1" name="comm_address1" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                    <span id="lan_com_addr1"></span>
                                                </label>
                                            </div>    
                                            <div class="form-group input-group col-sm-6">
                                                <!-- <span class="input-group-addon"><i class='fas fa-landmark'></i></span> -->
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_address2" name="comm_address2" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                    <span id="lan_com_addr2"></span>
                                                </label>
                                            
                                            </div>    
                                                                              
                                            <div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_address3" name="comm_address3" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                    <span id="lan_com_addr3"></span>
                                                </label>
                                            </div>    
                                            <div class="form-group input-group col-sm-6">
                                                <!-- <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span> -->
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_address4" name="comm_address4" placeholder=" " maxlength="30" onkeyUp="this.value = this.value.toUpperCase();"/>
                                                    <span id="lan_com_addr4"></span>
                                                </label>
                                            </div>
                                            <div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-file-zip-o"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="number" id="comm_pincode" name="comm_pincode" placeholder=" " onKeyPress="if(this.value.length==6) return false;"/>
                                                    <span id="lan_com_pin"></span>
                                                </label>
                                            </div>    
                                            <div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_phoneno" name="comm_phoneno" onKeyPress="if(this.value.length==10) return false;" placeholder=" " value="${mobileno}"/>
                                                    <span id="lan_com_mobile"></span>
                                                </label>
                                            </div>      
                                        </div>
                                    </div>
                                </div>    
                            </div>
                         
                        	<!-- <div class="row g-2 wow slideInLeft animated" data-wow-delay="00ms" data-wow-duration="2000ms"> -->
                        	<div class="row g-2">
                            	<div class="col-sm-6">
	                                <div class="panel-heading eng">Occupancy Certificate</div>
	                                <div class="panel-heading tel">కనెక్షన్ వివరాలు</div>
	                                <div class="panel-heading hin">कनेक्शन का विवरण</div>
	                                <div class="rounded-box">
	                                    <div class="form-group row p-3">	
	                                    <div class="form-group input-group col-sm-12">
                                                <span id="lan_occ_cert">Do you want to Submit Self-Attested Copy of Occupancy Certificate  *  
                                                	<label class="radio-inline" for="occ_certy">
		      											<input type="radio" name="occ_cert" id="occ_certy" value="yes">Yes
		    										</label>
		    										<label class="radio-inline" for="occ_certn">
		      											<input type="radio" name="occ_cert" id="occ_certn" value="no">No
		    										</label>
                                                </span>                                        
                                        </div> 
                                        <div class="form-group input-group col-sm-12" id="occ_certn_div" style="display:none">
	                                        <div class="form-group input-group col-sm-12">
	                                                <span id="lan_com_mobile">Height is LESS than 10 Mtrs excluding Stilt Floor  
	                                                	<label class="radio-inline" for="scnoexty">
			      											<input type="radio" name="scnoext" id="scnoexty" value="yes">
			    										</label>
	                                                </span>  
	                                                <span id="lan_com_mobile">Non-Submission of Occupancy Certificate by the consumer
	                                                	<label class="radio-inline" for="scnoexty">
			      											<input type="radio" name="scnoext" id="scnoexty" value="yes">
			    										</label>
	                                                </span>                                        
	                                        </div>
                                        </div>  
                                         <div class="form-group input-group col-sm-12" id="occ_certy_div" style="display:none">                    
	                                    	<div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_phoneno" name="comm_phoneno" onKeyPress="if(this.value.length==10) return false;" placeholder=" " value="${mobileno}"/>
                                                    <span id="lan_com_mobile">Occupancy Certificate Number</span>
                                                </label>
                                            </div>
                                            <div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_phoneno" name="comm_phoneno" onKeyPress="if(this.value.length==10) return false;" placeholder=" " value="${mobileno}"/>
                                                    <span id="lan_com_mobile">Issued by(Authority)</span>
                                                </label>
                                            </div>
                                            <div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_phoneno" name="comm_phoneno" onKeyPress="if(this.value.length==10) return false;" placeholder=" " value="${mobileno}"/>
                                                    <span id="lan_com_mobile">Date of Issue</span>
                                                </label>
                                            </div>
                                            <div class="form-group input-group col-sm-6">
                                                <span class="input-group-addon"><i class="fa fa-mobile" style="font-size:20px"></i></span>
                                                <label class="has-float-label">
                                                    <input class="form-control" type="text" id="comm_phoneno" name="comm_phoneno" onKeyPress="if(this.value.length==10) return false;" placeholder=" " value="${mobileno}"/>
                                                    <span id="lan_com_mobile">No. of flats as per Certificate</span>
                                                </label>
                                            </div>                                    	                                            
                                      </div>
	                                   </div>
                                	</div>
                            	</div>
	                            <div class="col-sm-6">
	                                <div class="panel-heading eng">Document Details</div>
	                                <div class="panel-heading tel">రిజిస్ట్రేషన్ వివరాలు</div>
	                                <div class="panel-heading hin">रजिस्ट्रेशन का विवरण</div>
	                                    <div class="rounded-box">
	                                        <div class="form-group row p-3">
	                                        	
         
		       
	                                            <div class="form-group input-group col-sm-6">
	                                                <select class="floating-select" id="regdoc" name="regdoc" 
	                                                    onclick="this.setAttribute('value', this.value);" 
	                                                    onchange="this.setAttribute('value', this.value); RegisterDoc(1);"
	                                                    value="">
	                                                    <option value=""></option>
	                                                    <option value="Y" >Yes</option>
	                                                    <option value="N" >No</option>
	                                                </select>
	                                                <label class="floating-label eng">Registration Documents of Premises ?<span class='er'>*</span></label>
	                                                <label class="floating-label tel">ప్రాంగణాల రిజిస్ట్రేషన్ పత్రాలు ఉన్నాయా?</label>
	                                                <label class="floating-label hin">परिसर के पंजीकरण दस्तावेज़ हैं?</label>
	                                            </div> 
	                                           
	                                            <div class="form-group input-group col-sm-6">
	                                                <select class="floating-select" id="regdoctype" name="regdoctype" 
	                                                    onclick="this.setAttribute('value', this.value);" 
	                                                    onchange="this.setAttribute('value', this.value); changeIdNumLabel(1);"
	                                                    value="">
	                                                    <option value=""></option>
	                                                    <option value='Registered Sale Deed'>Registered Sale Deed</option>
	                          	                        <option value='Registered Gift Deed'>Registered Gift Deed</option>
								                        <option value='Registered Lease Deed'>Registered Lease Deed</option>
	                                                </select>
	                                                <label class="floating-label eng">Registration Document Type</label>
	                                                <label class="floating-label tel">నమోదు పత్రం రకం</label>
	                                                <label class="floating-label hin">पंजीकरण दस्तावेज़ प्रकार</label>
	                                            </div> 
	                                            <div class="form-group input-group col-sm-6">
	                                                <label class="has-float-label">
	                                                    <input class="form-control" type="text" id="regdocno" name="regdocno" placeholder=" "/>
	                                                    <span id="lan_doc_no">Sale Deed No.</span>
	                                                </label>
	                                            </div> 
	                                            <div class="form-group input-group col-sm-6">
	                                                <label class="has-float-label">
	                                                    <input class="form-control" type="text" id="plan_no" name="plan_no" placeholder=" "/>
	                                                    <span id="lan_plan_no">Approval Plan No.</span>
	                                                </label>
	                                            </div> 

		                                  	</div>
	                                    </div>
	                                </div>    
                             	</div>
                        		<!-- <div class="row g-2 wow slideInLeft animated" data-wow-delay="00ms" data-wow-duration="2000ms"> -->
                        		<div class="row g-2">
		                            <div class="col-sm-6">
		                                <div class="panel-heading eng">Documents Upload</div>
		                                <div class="panel-heading tel">డాక్యుమెంట్స్ అప్‌లోడ్</div>
		                                <div class="panel-heading hin">डॉक्यूमेंट अपलोड करें</div>
		                                <div class="rounded-box" style="min-height:20rem">
                                    		<div class="form-group row p-3">
		                                       <!--   <div class="form-group input-group col-sm-12">
		                                            <label class="has-float-label">  
		                                                <input type="file" name="applicant_photo" id="applicant_photo" accept="image/gif, image/jpeg">
		                                                <span style="padding-top:6px">Applicant Photo (JPG/JPEG)
		                                                    <span style="color:red">Max.Size 50KB</span>
		                                                </span>
		                                            </label>
		                                            
		                                        </div> -->
		                                        <div class="form-group input-group col-sm-12">
		                                            <label class="has-float-label">  
		                                                <input type="file" name="id_proof" id="id_proof" onchange="checkFile1()" accept="image/gif, image/jpeg">
		                                                <span id="id_doc_label" style="padding-top:6px">ID Proof Copy 
		                                                    <span style="color:red">(JPG/JPEG) Max.Size 100KB</span>
		                                                </span>
		                                            </label>
		                                        </div>
		                                        <div class="form-group input-group col-sm-12">
		                                            <label class="has-float-label">  
		                                                <input type="file" name="registration_proof" id="registration_proof"  onchange="checkFile2()" accept="application/pdf">
		                                                <span id="doctype" style="padding-top:6px">Registered Document 
		                                                	<span style="color:red">(PDF) Max.Size 5MB</span>
		                                                </span>
		                                            </label>
		                                        </div>
		                                        <!-- <div class="form-group input-group col-sm-12">
		                                            <label class="has-float-label">  
		                                                <input type="file" name="location_photo" id="location_photo" accept="image/gif, image/jpeg">
		                                                <span>Location Photo (JPG/JPEG)
		                                                    <span style="color:red">Max.Size 200KB</span>
		                                                </span>
		                                            </label>
		                                        </div>  -->    
                                    		</div>
                                		</div>
                            		</div>
                            		<div class="col-sm-6">
		                                <div class="panel-heading-payment eng">Required Payment</div>
		                                <div class="panel-heading-payment tel">అవసరమైన చెల్లింపు</div>
		                                <div class="panel-heading-payment hin">आवश्यक भुगतान</div>
		                                <div class="rounded-box" style="min-height:20rem">
                                        	<div class="container p-3">
		                                        <div class="row p-1" style="flex-wrap: unset;">
		                                            <div class="col-sm-8">Application Fee</div>
		                                            <div class="col-sm-4 text-right" id="af">0.00</div>
		                                        </div>
		                                        <div class="row p-1" style="flex-wrap: unset;">
		                                            <div class="col-sm-8">GST on Application Fee</div>
		                                            <div class="col-sm-4 text-right" id="afgst">0.00</div>
		                                        </div>
		                                        <div class="row p-1" style="flex-wrap: unset;">
		                                            <div class="col-sm-8">Security Deposit</div>
		                                            <div class="col-sm-4 text-right" id="sd">0.00</div>
		                                        </div>
		                                        <div class="row p-1" style="flex-wrap: unset;">
		                                            <div class="col-sm-8">Development Charges</div>
		                                            <div class="col-sm-4 text-right" id="dc">0.00</div>
		                                        </div>
		                                        <div class="row p-1" style="flex-wrap: unset;">
		                                            <div class="col-sm-8">GST on Development Charges</div>
		                                            <div class="col-sm-4 text-right" id="dcgst">0.00</div>
		                                        </div>
		                                        <div class="row p-1 bg-light" style="flex-wrap: unset;font-weight:bold">
		                                            <div class="col-sm-8">Total</div>
		                                            <div class="col-sm-4 text-right" id="tot">0.00</div>
		                                        </div>
                                    		</div>  
                                    		<div class="required-payment-footer bg-light col-sm-12 p-1">
                                    			Select Category, Sub-Category, Connected Load, Laying of Service Line Required(Y/N), Registration Documents of Premises (Y/N) to know your Registration Payment.
                                    		</div>  
                                		</div>
                                		
                            		</div>
                            	</div>  
		                        <div class="new_reg_button-container">
		                            <div style="display: flex;">
		                                <div class="new_reg__button">
		                                    <!-- <button type="button" class="new_reg_btn">OTP పంపండి</button> -->
		                                    <button type="button"  id="btnsubmit" class="new_reg_btn eng">Proceed</button>
		                                    <button type="button" class="new_reg_btn tel">కొనసాగండి</button>
		                                    <button type="button" class="new_reg_btn hin">आगे बढ़ना</button>
		                                </div>
		                            </div>
		                        </div>
                        	</div>               
                    	</div>
                    </div> 	
                </div>	
            </div>
            
        </section>
        </form>
	    <!-- category-section end -->
		<!-- main-footer -->
       	<footer class="main-footer">
           
           <div class="footer-bottom">
               <div class="auto-container">
                   <div class="inner-box clearfix">
                       <figure class="footer-logo"><a href="#"><img src="${pageContext.request.contextPath}/assets/images/footer-logo.png" alt=""></a></figure>
                       <div class="copyright pull-left">
                           <p><a href="#">TSSPDCL</a> &copy; 2008 All Right Reserved</p>
                       </div>
                       <ul class="footer-nav pull-right clearfix">
                           <li><a href="#">Terms of Service</a></li>
                           <li><a href="#">Privacy Policy</a></li>
                       </ul>
                   </div>
               </div>
           </div>
       	</footer>
       	<!-- main-footer end -->

        <!--Scroll to top-->
       <!--  <button class="scroll-top scroll-to-target" data-target="html">
            <span class="fa fa-angle-up"></span>
        </button> -->
    </div>
    <!-- <a id="whatsappChats" href="https://api.whatsapp.com/send?phone=919515022697" target="_blank" rel="nofollow" class="pushItDown">
        <img loading="lazy" src="${pageContext.request.contextPath}/assets/images/icons/whatsapp-icon.png" width="66" height="66">
        <span class="whatsappChatsText">Chat with us on <strong>WhatsApp</strong></span>
    </a> -->
    <!-- modal load calc begins -->
    <div class="modal fade" id="modal-load-calc"  role="dialog">
    	<!-- <div class="modal-dialog modal-lg  modal-dialog-centered">  for vertical center -->
    	<div class="modal-dialog modal-lg">
      		<div class="modal-content">
        	<!-- Modal Header -->
        		<div class="modal-header">
          			<h4 class="modal-title primary">Load Calculator</h4>
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
        		</div>
        
        		<!-- Modal body -->
        		<div class="modal-body">
         			<table class="table table-bordered table-hover" id="loadTable">
				    <thead>
				    <tr>
				        <th width="5%">Sl.No</th>
                  		<th width="30%">Appliance Type</th>
                  		<th width="15%">Wattage</br>(in Watts)</th>
                  		<th width="15%">Numbers</th>
                  		<th width="15%">Total Load</br>(in Watts)</th>
                  		<th width="10%">Add</th>
                  		<th width="10%">Delete</th>
				    </tr>
				    </thead>
    				<tbody>
    				</tbody>
    				<tfoot>
    				<tr>
    					<input type="hidden" name="gTotal" id="gTotal" value="0" />
       					<th colspan="5" class="text-right bg-light">Total Connected Load </th>
       					<th colspan="2" class="bg-light"><span id="loadTotal">0</span>&nbsp;(in Watts)</th>
    				</tr>
					</tfoot>
  					</table>
        		</div>
        
		        <!-- Modal footer -->
		        <div class="modal-footer justify-content-right">
		          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		          <button type="button" class="btn btn-danger" data-dismiss="modal" onClick="captureLoad()" id="capture">Capture</button>
		       
		        </div>
        	</div>
    	</div>
  	</div> 	
  	<!--  modal help -->
  	<div class="modal fade" id="modal-help"  role="dialog">
    	<!-- <div class="modal-dialog modal-lg  modal-dialog-centered">  for vertical center -->
    	<div class="modal-dialog">
      		<div class="modal-content">
        	<!-- Modal Header -->
        		<div class="modal-header">
          			<h4 class="modal-title primary">Help</h4>
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
        		</div>
        
        		<!-- Modal body -->
        		<div class="modal-body">
         			
         			<div type="square">
         				<div>Please Enter your Adjacent Unique Service Number to find your Section Name</div>
         				<div class="text-center">-OR-</div> <br>
         				<div>Choose Circle/District to find your Section Name</div>  <br>      				
         			</div>
        		</div>
        	</div>
    	</div>
  	</div> 	
  	<div id="snackbar" style="display:none"></div>
  	<div id="snackbar1" style="display:none"></div>
    <!-- jquery plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
   	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>-->
    <script src="${pageContext.request.contextPath}/assets/js/owl.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/wow.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script> --%>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.fancybox.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/appear.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/isotope.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jQuery.style.switcher.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery_1.6.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/script/LTMscript.js"></script>
    <script src="${pageContext.request.contextPath}/script/loadcalculator.js"></script>
    <script src="${pageContext.request.contextPath}/script/validation.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	  	
    <script type="text/javascript">

    $(document).ready(function (event) {
    	
    	if(event.keyCode == 13) {
    		event.preventDefault();
    	    return false;
    	}
    	  	  	
    	$(window).scrollTop(0);
    	$("#form-container").hide();
    	$("#d-adjscno").hide();
    	$("#d-secname").hide();
    	$("#d-or").hide();
    	$("#d-noexistscnos").hide();
    	$("#d-btn-check").hide();
    	setIntialSetup(1);
    	
    	//$("#modal-load-calc").reload();
    	addNewAppliance();
    	//checkEmpty("idproof_type");
    	//checkEmpty("idproof_no");	
    	//checkEmpty("applicant_name");
    	//checkEmpty("father_name");
    	$("#scnoextn").prop("checked", true).trigger("click");
    	$("#serv_type").click();
    	$("#comnserv").click();
    	$("#sez").click();
    	
    	setTimeout(function() {
            $("#whatsappChats").show();
        }, 500);
    
    });
    </script>
    <script language="javascript">
    var screxflg="";
    $("#scnoexty,#scnoextn").click(function(){
		if ($("#scnoexty").prop("checked")) {
			
			$("#form-container").hide();
			$("#d-adjscno").hide();
			$("#d-secname").hide();
			$("#circle-div").hide();
			$("#section-div").hide();
			$("#d-or").hide();
			$("#d-noexistscnos").show();
			$("#d-btn-check").show();
			screxflg="Y";
		}
		if($("#scnoextn").is(":checked")) {
			//$("#noscno").prop( "placeholder", "No of Required Service Connections");
			//$("#noscno").val("");
			//$("#addscnos").html("");
			
			$("#d-noexistscnos").hide();
			$("#d-btn-check").hide();
			$("#addscnos").hide();
			$("#d-adjscno").show();
			$("#d-secname").show();
			$("#d-or").show();
			$("#circle-div").show();
			$("#section-div").show();
			screxflg="";
		}
	});
    //occ 
    $("#occ_certy,#occ_certn").click(function(){
		if ($("#occ_certy").prop("checked")) {

			$("#occ_certy_div").show();
			$("#occ_certn_div").hide();	
			
		}
		if($("#occ_certn").is(":checked")) {	
			$("#occ_certn_div").show();	
			$("#occ_certy_div").hide();	
		}
	});
    /* $('#idproof_type').change(function(){
    	var idtype = $(this).val();
    	alert(idtype);
	    $('#idproof_no').on('keypress', function(){
	    	//onKeyPress="if(this.value.length==10) return false;
	        var charLength = $(this).val().length;
	        //alert(charLength);
	        
	        if(idtype == "Aadhar copy"){
	        	if(charLength == 12){
	        		return false;
	        	}
	        }	
	        else if(idtype == "PAN Card"){
	        	if(charLength == 10){
	        		return false;
	        	}
	        }
	    });
    });	   */  
    
    $("#same_addr").click(function(){
        if($(this).prop("checked") == true){
            $("#comm_address1").val($("#conn_address1").val());
            $("#comm_address2").val($("#conn_address2").val());
            $("#comm_address3").val($("#conn_address3").val());  
            $("#comm_address4").val($("#conn_address4").val()); 
            $("#comm_pincode").val($("#conn_pincode").val()); 
            $("#comm_phoneno").val($("#mobileno").val()); 
	    }else {
	    	$("#comm_address1").val('');
            $("#comm_address2").val('');
            $("#comm_address3").val('');  
            $("#comm_address4").val(''); 
            $("#comm_pincode").val(''); 
            $("#comm_phoneno").val(''); 
	    }
  	});
    
    var srflg="";
   	$("#noscnos").blur(function(){
   		//$("#addscnos").html("");	
		//if ($("#scnoext1").prop("checked")) {
		addscnos="";			
		if($("#noscnos").val()<5){
			nsc=$("#noscnos").val();
			
	 		addscnos+="<div class='row g-2'><div class='col-sm-12'>";
	 		addscnos+="<div class='row d-flex justify-content-center p-1'>";
	 		addscnos+="<div class='form-group input-group col-sm-12'>";		 		
	 		for(var i=1;i<=nsc;i++){
				addscnos+="<div class='col-md-3'>";
				addscnos+="<label class='has-float-label'>";
				addscnos+="<input type='text' name='ukscnos"+i+"' id='ukscnos"+i+"' class='form-control' size='9' placeholder=' ' required onBlur='checkUSCNO(1,this.id,"+i+")' onfocus='changeIcon(this.id);'>"  ;
				addscnos+="<span>"+i+".Unique Service No.</span>";
				addscnos+="</label>";
				addscnos+="<div class='input-group-append'>";
				addscnos+="<button class='search-button' type='button' onclick='checkUSCNO(1,'ukscnos"+i+"'),"+i+"));return true;'>";
				addscnos+="<span id='wr"+i+"'><i class='fa fa-search'></i></span>";
				//addscnos+="<span id='wr"+i+"'></span>";
				addscnos+="</button>";
				addscnos+="<input type='hidden' name='billStatus"+i+"' id='billStatus"+i+"' > </div>";
				addscnos+="<input type='hidden' name='category"+i+"' id='category"+i+"' > </div>";
			}
			addscnos+="</div></div></div></div>";	
			
			$('#addscnos').html(addscnos);
			$("#addscnos").show();
			//$("#noscnos").prop('readonly', true);
			getDefaultLanguage1();
			$("#form-container").hide();
			$("#area-div").hide();
		}else {			
			addscnos+="<div class='row g-2'><div class='col-sm-12'>";
			addscnos+="<div class='row d-flex justify-content-center p-1'>";
			addscnos+="<div class='form-group col-md-11 alert alert-danger custom-alert' role='alert'>";
			addscnos+="<i class='fa fa-exclamation-triangle fa-lg' aria-hidden='true'></i><strong>Warning!&nbsp;</strong> As there are already 5 Existing Services, please Register under <a href='http://117.239.151.73:9999/CSCReg/' target='_blank'>LTM New Service Registration</a>";
			addscnos+="</div></div></div></div>";	
			$("#addscnos").html(addscnos);
			$("#addscnos").show();
			$("#form-container").hide();
			srflg="";
		}
	});
   	
    $('#en').click(function() {
       
        $('.tel').css('display', 'none');
        $('.hin').css('display', 'none');
        $('.eng').show();
        getDefaultLanguage1();                                    
    });

    $('#te').click(function() {
        $('.eng').css('display', 'none');
        $('.hin').css('display', 'none');
        $('.tel').show();
        getTeluguLanguage();
    });

    $('#hi').click(function() {
        $('.eng').css('display', 'none');
        $('.tel').css('display', 'none');
        $('.hin').show();
        getHindiLanguage();
    });
    
    
    $("#btnsubmit").click(function(e){
    	//alert("hi");
    	/*if($("#idproof_no").val() == '' || $("#idproof_no").val().length == 0)
    	{
    		$("#idproof_no").prop("class","form-control error");
    		return false;	
    	}*/
    	finalSubmit(1);
    }); 
    </script>    
    
    <script language="javascript">
    function myFunction1() {
        //alert("myDropdown1");
        document.getElementById("myDropdown1").classList.toggle("show");
       
    }
    
    function myFunction2() {
        //alert("myDropdown2");
        document.getElementById("myDropdown2").classList.toggle("show");
    }
  
    // Close the dropdown if the user clicks outside of it
    /* window.onclick = function(event) {
    
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
           
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
        
    } */

    </script>
    
</body><!-- End of .page_wrapper -->
</html>
