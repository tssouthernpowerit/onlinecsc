<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TSSPDCL-New Service Registration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="${pageContext.request.contextPath}/script/script.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<form name="f1">
    <div class="topbar"></div>
    <div class="navbar"> <h3>LT - New Service Connection Registration</h3> </div>
    <div class="login-unit" data-aos="zoom-in">
        <div class="login-section" id="prereq-y-n-div">
            <div>Want to check prerequisites before applying ?</div>
            <div class="button-div1">
                <button type="button" class="btn-yn" onclick="showEntryPreReq()"> Yes</button> &nbsp; &nbsp;<button type="button"class="btn-yn" onclick="showRegYesNo()">No</button>
            </div>
        </div>
    </div> 
    <div class="login-unit" id="entry-prereq-div" style="display: none;" >
        <div class="login-section">
        	<div>Choose your required category and load</div>
            <div class="row row-prereq">
                <div class="floating-label-content">
                    <select class="floating-select" name="category-prereq" id="category-prereq" onclick="this.setAttribute('value', this.value);" 
                    																		onchange="this.setAttribute('value', this.value);
                    																		 getSubCategoryPreReq()" value="">
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
                        <select class="floating-select" name="sub_category-prereq" id="sub_category-prereq" onclick="this.setAttribute('value', this.value);"
                        																	  				onchange="this.setAttribute('value', this.value);
                        																							changeMetricPreReq()" value="">
                            <option value=""></option>
                        </select>
                        <label class="floating-label">Sub-Category</label>
                </div>
            </div>
           	<div class="row">
           		<div class="floating-label-content">
                    <input class="floating-input" name="conn_load-prereq" id="conn_load-prereq" type="number" placeholder=" ">
                    <label class="floating-label" id="load-label-prereq">Connected Load in Watts</label>
               	</div>
                <div class="floating-label-content">
                    <select class="floating-select" name="regdoc-prereq" id="regdoc-prereq" onclick="this.setAttribute('value', this.value);"
                      																onchange="this.setAttribute('value', this.value);" value="">
                          <option value=""></option>
                          <option value="Y" >Yes</option>
						  <option value="N" >No</option>
                    </select>
                    <label class="floating-label">Registration Documents of Premises ?</label>
                </div>                
           	</div>

            <div class="button-div1">
                <button type="button" class="btn-yn" onclick="getPreReq()">Check</button>
            </div>
        </div>
    </div>
    <div class="login-unit" id="details-prereq-div" style="display: none;">
        <div class="login-section">
            <div class="row">
                <div class="row-section">
                    <div class="subheader">Required Payment</div>

                    <div class="fee-row">
                        <div class="fee-column f-col1">Application Fee</div>
                        <div class="fee-column f-col2" id="af_pre">25.00</div>
                    </div>
                    <div class="fee-row">
                        <div class="fee-column f-col1">Application Fee GST</div>
                        <div class="fee-column f-col2" id=afgst_pre>4.50</div>
                    </div>
                    <div class="fee-row">
                        <div class="fee-column f-col1">Security Deposit</div>
                        <div class="fee-column f-col2" id="sd_pre">200.00</div>
                    </div>
                    <div class="fee-row">
                        <div class="fee-column f-col1">Development Charges</div>
                        <div class="fee-column f-col2" id="dc_pre">1200.00</div>
                    </div>
                    <div class="fee-row">
                        <div class="fee-column f-col1">Development Charges GST</div>
                        <div class="fee-column f-col2" id="dcgst_pre">216.00</div>
                    </div>
                    <div class="fee-row total">
                        <div class="fee-column f-col1">Total</div>
                        <div class="fee-column f-col2" id="tot_pre">1645.50</div>
                    </div>
                    
                </div>
                <div class="row-section">
                    <div class="subheader">Required Documents</div>
                    <p>1.Applicant Photo (JPG, max-size : 50KB)</p>
                    <p>2.Aadhar Copy (JPG, max-size : 100KB)</p>
                    <p id="p_doc"></p>
                    <p>4.Premises Photo (JPG, max-size : 200KB)</p>
                </div>
            </div>
            <div class="note_prereq">If there is no existing service line near your premises, an estimate will be prepared for the extension of line. 
            In such case only application fee has to be paid at the time of registration. Security deposit and development charges
            will be collected along with estimate payment.</div>
        </div>
        
    </div>

	
	<div class="login-unit flex-unit" id="apply-div" data-aos="zoom-in" style="display: flex;">
        <div class="login-section section-flex-item">
            <div class="subheader">Apply Now</div>
            <div class="floating-label-content content1">
                <input class="floating-input" type="text" name="mobile_login"  id="mobile_login" placeholder=" " required>
                <label class="floating-label">Mobile Number</label>
            </div>
            <div class="button-div1">
                <button type="button" class="btn-yn" onclick="sendOTP()">Send OTP</button>
            </div>
            <div class="otp_block" data-aos="zoom-in" id="otp_block1" style="display: none;">              
                <div class="otp-div">
                	<div class="otp-subdiv">Enter the 4 digit OTP sent</div>
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(1)" id="a" maxlength="1">
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(2)" id="b" maxlength="1">
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(3)" id="c" maxlength="1">
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(4)" id="d" maxlength="1">
                    <div class="otp-subdiv" id="retry1" >You can resend OTP in <span id="countdownRetry"></span> sec</div>
                    <div class="resend-div" id="retry2" onclick="sendOTP();">
                   		<div>
                   			<img src="${pageContext.request.contextPath}/images/refresh-icon.png" alt="">
                   		</div>
                   		<div style="padding-top : 0.35rem">
                       		Resend
                       	</div>
                    </div>
                </div>
                <p id = "error_otp" class="bounce-error" style="display : none">Wrong OTP entered. Please try again.</p>
                <div class="button-div1">
                    <button type="button" class="btn-yn" id="verify-btn1" onclick="validateOTP(1)">Verify and Proceed</button>
                </div>               	                    	                    
            </div>
        </div>
        <div class="login-section section-flex-item">
        	<div class="subheader">Already Registered ?</div>
            <div class="floating-label-content content1">
                <input class="floating-input" name="login_regno" id="login_regno" type="text" placeholder=" " required>
                <label class="floating-label">Registration Number</label>
            </div>  
            <p id = "error_reg" class="bounce-error" style="display : none">Invalid Registration Number</p>
            <div class="button-div1">
                <button type="button" class="btn-yn" onclick="continueRegistration();">Continue from where you left</button>
            </div>
            <div class="otp_block" data-aos="zoom-in" id="otp_block2" style="display: none;">              
                <div class="otp-div">
                	<div class="otp-subdiv">Enter the 4 digit OTP sent to <span id="mbl_reg"></span></div>
                    <input class="input_otp_reg" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput2(1)" id="p" maxlength="1">
                    <input class="input_otp_reg" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput2(2)" id="q" maxlength="1">
                    <input class="input_otp_reg" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput2(3)" id="r" maxlength="1">
                    <input class="input_otp_reg" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput2(4)" id="s" maxlength="1">
                    <div class="otp-subdiv" id="retry1_reg" >You can resend OTP in <span id="countdownRetry_reg"></span> sec</div>
                    <div class="otp-subdiv" id="retry2_reg" >
                    	<span style="color: #1eb7e6;font-weight: bold;  opacity:1" onclick="continueRegistration()">
                    	<img src="${pageContext.request.contextPath}/images/refresh-icon.png" alt="">
                        <input type="hidden" value="service">
                        Resend</span>
                    </div>
                </div>
                <p class="bounce-error" id = "error_otp_reg" style="display : none">Wrong OTP entered. Please try again.</p>
                <div class="button-div1">
                    <button type="button" class="btn-yn" id="verify-btn2" onclick="validateOTP(2)">Verify and Proceed</button>
                </div>                    	                    
            </div>
        </div>
    </div> 




    <div class="login-unit" id="reg-y-n-div" style="display: none;">
        <div class="login-section">
            <div>Have you already registered for a New Connection ?</div>
            <div class="button-div1">
                <button type="button" class="btn-yn" onclick="showContinueReg()"> Yes</button> &nbsp; &nbsp;<button type="button"class="btn-yn" onclick="showFreshReg()">No</button>
            </div>
        </div>
    </div> 
    
    <div class="login-unit" id="reg-entry-div" style="display: none;" >
        <div class="login-section">
            <div class="floating-label-content">
                <input class="floating-input" type="text" placeholder=" ">
                <label class="floating-label">Registration Number</label>
            </div>  
            <p id = "error_reg" class="bounce-error" style="display : none">Invalid Registration Number</p>
            <div class="button-div1">
                <button type="button" class="btn-yn" >Continue from where you left</button>
            </div>     
        </div>
    </div>

    <div class="login-unit" id="mobile-entry-div" style="display: none;" >
        <div class="login-section">
            <div class="floating-label-content">
                <input class="floating-input" type="text" name="mobile_login"  id="mobile_login" placeholder=" ">
                <label class="floating-label">Mobile Number</label>
            </div>
            <div class="floating-label-content">
                <input class="floating-input" type="text" name="email_login"  id="email_login" placeholder=" ">
                <label class="floating-label">Email</label>
            </div>
            <div class="button-div1">
                <button type="button" class="btn-yn" onclick="sendOTP()">Send OTP</button>
            </div>

            <div class="otp_block" data-aos="zoom-in" id="otp_block" style="display: none;">
                <div class="otp_info">
                    <p id="expires1" style="display:none"> OTP expires in 
                        <span id="countdownExpire"></span>
                    <p id="expires2" style="display:none">OTP 
                        <span style="color:#ed2626; opacity:1; font-weight:bold;"> Expired !!!</span></p>
                </div>
                <div class="otp-div">
                	<div class="otp-subdiv">Enter the 4 digit OTP sent</div>
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(1)" id="a" maxlength="1">
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(2)" id="b" maxlength="1">
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(3)" id="c" maxlength="1">
                    <input class="input_otp" type="text" oninput="vaildateNum(this)" onkeyup="shiftInput1(4)" id="d" maxlength="1">
                    <div class="otp-subdiv">You can resend OTP in 30 sec</div>
                </div>
                <p id = "error_otp" class="bounce-error" style="display : none">Wrong OTP entered. Please try again.</p>
                <div class="button-div1">
                    <button type="button" class="btn-yn" onclick="validateOTP()">Verify and Proceed</button>
                </div>
                <div class="otp_info">
                    <p id="retry1" style="display:none";>Didn't receive OTP? Retry in 
                        <span id="countdownRetry"></span></p>
                    <p id="retry2" style="display:none">Didn't receive OTP?
                        <span style="color: #1eb7e6;font-weight: bold; text-decoration: underline; opacity:1" onclick="sendOTP()">
                        <input type="hidden" value="service">
                        Retry</span>
                    </p>
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