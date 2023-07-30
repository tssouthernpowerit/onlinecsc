package com.tsspdcl.onlinecsc.controller;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tsspdcl.onlinecsc.model.AdditionalPaymentModel;
import com.tsspdcl.onlinecsc.model.ApplicationDataModel;
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
import com.tsspdcl.onlinecsc.services.AdlPayUpdate;
import com.tsspdcl.onlinecsc.services.CSCDB;
import com.tsspdcl.onlinecsc.services.DBMethods;
import com.tsspdcl.onlinecsc.services.SelectNR;
import com.tsspdcl.onlinecsc.services.VerifyGstNo;

@Controller
@RequestMapping(path = "")
public class MainController {
	final static Logger logger = Logger.getLogger(MainController.class);
	private static String otp;

	@GetMapping("")
	public String login() {
		return "login";
	}

	/*
	 * @GetMapping("/login") public String get1() { return "login"; }
	 */

	@GetMapping("/invalidReg")
	public String get2(Model model) {
		model.addAttribute("invalid", "Invalid Registration Number");
		return "login";
	}

	@GetMapping(path = "/checkLoginRegno/{login_regno}")
	public ResponseEntity<String> checkLoginRegData(@PathVariable("login_regno") String login_regno) {

		String resp = "";
		DBMethods dbm = new DBMethods();
		String mbl = dbm.checkReg(login_regno);
		if (!mbl.equals("")) {
			otp = dbm.genOTP(mbl);
			resp = "******" + mbl.substring(6, 10);
			return new ResponseEntity<String>(resp, HttpStatus.OK);
		} else {
			resp = "";
			return new ResponseEntity<String>(resp, HttpStatus.OK);
		}

	}

	@GetMapping("/getOTP/{mobileno}")
	public ResponseEntity<String> getOTPMsg(@PathVariable("mobileno") String mobileno) {
		DBMethods dbm = new DBMethods();
		otp = dbm.genOTP(mobileno);
		if (!otp.equals("")) {
			return new ResponseEntity<String>("BBQES", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("BBQEX", HttpStatus.OK);
		}
	}

	@GetMapping("/validateOTP/{cotp}")
	public ResponseEntity<String> validateOTP(@PathVariable("cotp") String cotp) {

		if (cotp.equals(otp)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}

	}

	// Dummy
	@GetMapping("/entry")
	public String get4() {
		return "entry";
	}

	@GetMapping("/modal")
	public String modal() {
		return "modal";
	}

	/*
	 * @RequestMapping(value = "services", method = RequestMethod.GET) public
	 * ModelAndView OnlineCSCServices(HttpServletRequest request,
	 * HttpServletResponse response) { ModelAndView mav = new
	 * ModelAndView("services"); return mav; }
	 */

	@RequestMapping(value = "/services", method = RequestMethod.POST) 
	public String OnlineCSCServices(@RequestParam String mobileno, Model model) { 
		 model.addAttribute("mobileno", mobileno); 
		 return "services"; 
	}
	
	@PostMapping("/addpayment")
	public String getAddPayment() {
		return "AdditionalPayment";
	}

	@PostMapping("/newreg")
	public String newreg(@RequestParam String mobileno, Model model) {
		model.addAttribute("mobileno", mobileno);
		return "newregistration";
	}

	@PostMapping("/getPreReq")
	public ResponseEntity<PreReqModel> getPre(@RequestBody PreReqInputModel prim) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<PreReqModel>(dbm.genPreReq(prim), HttpStatus.OK);
	}

	@GetMapping("/checkUscno/{uscno}")
	public ResponseEntity<EbsResponseModel> checkUscData(@PathVariable("uscno") String uscno) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<EbsResponseModel>(dbm.checkUscno(uscno), HttpStatus.OK);
	}

	// Additional Payment
	@GetMapping("/checkNrno/{nrno}")
	public ResponseEntity<AdditionalPaymentModel> checkNRData(@PathVariable("nrno") String nrno) {
		//System.out.println("In Controller");
		AdlPayUpdate dbm = new AdlPayUpdate();
		return new ResponseEntity<AdditionalPaymentModel>(dbm.checkNrno(nrno), HttpStatus.OK);
	}

	@GetMapping("/getAreaName1/{uscno}/{area_code}")
	public ResponseEntity<AreaData> getAreacd(@PathVariable("uscno") String uscno,
			@PathVariable("area_code") String area_code) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<AreaData>(dbm.getAreaName1(uscno, area_code), HttpStatus.OK);
	}

	@GetMapping("/getCircleList")
	public ResponseEntity<ArrayList<CircleListModel>> getCircleData() {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<ArrayList<CircleListModel>>(dbm.getCircleList(), HttpStatus.OK);
	}

	@GetMapping("/getSectionList/{circle_id}")
	public ResponseEntity<ArrayList<SectionListModel>> getSectionData(@PathVariable String circle_id) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<ArrayList<SectionListModel>>(dbm.getSectionList(circle_id), HttpStatus.OK);
	}

	@GetMapping("/getAreaList/{section_id}")
	public ResponseEntity<EbsResponseModel> getAreaData(@PathVariable String section_id) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<EbsResponseModel>(dbm.getAreaList(section_id), HttpStatus.OK);
	}

	@GetMapping("/getAreaName2/{area_code}/{section_code}")
	public ResponseEntity<AreaData> getAreaName2(@PathVariable String area_code, @PathVariable String section_code) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<AreaData>(dbm.getAreaName2(area_code, section_code), HttpStatus.OK);
	}

	@GetMapping("/getSubCat/{category}")
	public ResponseEntity<?> getSubCatList(@PathVariable("category") String category) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<ArrayList<SubCatModel>>(dbm.genSubCategory(category), HttpStatus.OK);
	}

	@GetMapping("/getMcode")
	public ResponseEntity<?> getMunicipalCode() {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<ArrayList<MunicipalCodeModel>>(dbm.genMunicipalCode(), HttpStatus.OK);
	}

	@GetMapping("/getGov")
	public ResponseEntity<?> getGovCodeList() {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<ArrayList<GovtCodeModel>>(dbm.genGovtList(), HttpStatus.OK);

	}

	@GetMapping("/getHod/{govtcd}")
	public ResponseEntity<?> getHodCodeList(@PathVariable("govtcd") String govtcd) {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<ArrayList<HodCodeModel>>(dbm.genHodList(govtcd), HttpStatus.OK);
	}

	@GetMapping("/getSupNat")
	public ResponseEntity<?> getSupplyNature() {
		DBMethods dbm = new DBMethods();
		return new ResponseEntity<ArrayList<SupplyNatureModel>>(dbm.genSupplyNature(), HttpStatus.OK);

	}

	@PostMapping("/Modify")
	public String getEntryPage() {
		return "entry";
	}

	@PostMapping("/Modify1")
	public String getModifyPage(@RequestParam("login_regno") String login_regno, HttpServletRequest request,
			Model model) {
		ApplicationDataModel adm = new ApplicationDataModel();
		SelectNR snr = new SelectNR();
		adm = snr.select(login_regno);
		System.out.println(adm);
		model.addAttribute("adm", adm);
		return "entry1";
	}

	@GetMapping(value = "/verifyGSTNO/{gstno}")
	public ResponseEntity<String> verifyGstNo(@PathVariable("gstno") String gstno) throws SQLException {
		CSCDB db = new CSCDB();
		Connection con = db.getConnection();
		VerifyGstNo vgst = new VerifyGstNo();
		String result = vgst.getVerifyStat(con, gstno);

		return new ResponseEntity<String>(result, HttpStatus.OK);
	}

	@GetMapping(value = "/getDocument/{regno}/{code}")
	public void getDocument(HttpServletResponse response, @PathVariable("regno") String regno,
			@PathVariable("code") String code) throws Exception {
		if (code.equals("sdeed") || code.equals("iproof"))
			response.setContentType("application/pdf");
		if (code.equals("aphoto") || code.equals("lphoto"))
			response.setContentType("image/jpg");
		SelectNR snr = new SelectNR();
		InputStream inputStream = snr.selectFile(regno, code);
		if (inputStream != null)
			IOUtils.copy(inputStream, response.getOutputStream());
	}

	@GetMapping(value = "/getBlobPhoto/{id}")
	public ResponseEntity<Blob> getBlobPhoto(HttpServletResponse response, @PathVariable("id") String id)
			throws Exception {
		SelectNR snr = new SelectNR();
		Blob b = snr.selectFile1(id);
		return new ResponseEntity<Blob>(b, HttpStatus.OK);
	}

	@GetMapping("/error")
	public String get99() {
		return "error";
	}
	
	@GetMapping("/newLTMreg")
	public String newLTMreg() {
		//model.addAttribute("mobileno", mobileno);
		return "newLTMregistration";
	}
}
