package kr.co.offispace.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.digest.Sha2Crypt;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.offispace.dto.ApprovalCertifyVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.service.approval.ApprovalService;

@RequestMapping("/approval")
@Controller
public class ApprovalSettingController {

	@Resource(name="approvalService")
	private ApprovalService approvalService;

	@RequestMapping(value = "/makeOtp")
	@ResponseBody
	public Map<String, String> otp(HttpSession session) throws Exception {

		Map<String, String> result = new HashMap<String, String>();

		byte[] buffer = new byte[5 + 5 * 5];
		new Random().nextBytes(buffer);
		Base32 codec = new Base32();
		byte[] secretKey = Arrays.copyOf(buffer, 10); // 16자 이상이여하므로 10으로 설정 필요
		byte[] bEncodedKey = codec.encode(secretKey);

		// 인증키 생성
		String encodedKey = new String(bEncodedKey);

		// DB에 encodedLey 저장해주기
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		ApprovalCertifyVO apvCertify = new ApprovalCertifyVO();
		apvCertify.setEmpCode(emp.getEmpCode());
		apvCertify.setOtpKey(encodedKey);
		
		// 바코드 주소 생성
		String QrUrl = getQRBarcodeURL(emp.getEmpId(), "offispace", encodedKey);

		approvalService.registerApprovalOtp(apvCertify);

		result.put("encodedKey", encodedKey);
		result.put("QrUrl", QrUrl);

		return result;
	}

	@RequestMapping(value = "/remakeOtp")
	@ResponseBody
	public Map<String, String> remakeOtp(HttpSession session) throws Exception {

		Map<String, String> result = new HashMap<String, String>();

		byte[] buffer = new byte[5 + 5 * 5];
		new Random().nextBytes(buffer);
		Base32 codec = new Base32();
		byte[] secretKey = Arrays.copyOf(buffer, 10); // 16자 이상이여하므로 10으로 설정 필요
		byte[] bEncodedKey = codec.encode(secretKey);

		// 인증키 생성
		String encodedKey = new String(bEncodedKey);

		// DB에 encodedLey 저장해주기
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		ApprovalCertifyVO apvCertify = new ApprovalCertifyVO();
		apvCertify.setEmpCode(emp.getEmpCode());
		apvCertify.setOtpKey(encodedKey);

		// 바코드 주소 생성
		String QrUrl = getQRBarcodeURL(emp.getEmpId(), "offispace.com", encodedKey);

		approvalService.modifyApprovalOtp(apvCertify);

		result.put("encodedKey", encodedKey);
		result.put("QrUrl", QrUrl);

		return result;
	}


	// 바코드 생성 함수
	// otp를 생성해주는 url만드는 메서드
	public static String getQRBarcodeURL(String user, String host, String secret) {
		String format = "http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&chld=H|0";

		// String format =
		// "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&amp;chld=H|0";

		return String.format(format, user, host, secret);
	}


	@RequestMapping("/makeApvPwd")
	@ResponseBody
	public ResponseEntity<String> makeApvPwd(String pwd, HttpSession session) throws Exception {

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		ApprovalCertifyVO apvCertify = new ApprovalCertifyVO();

		String encriptedPassword = Sha2Crypt.sha256Crypt(pwd.getBytes(), "$5$"+emp.getEmpCode());

		String encodedpwd = encriptedPassword.substring(encriptedPassword.lastIndexOf("$"));

		apvCertify.setEmpCode(emp.getEmpCode());
		apvCertify.setApvPassword(encodedpwd);


		approvalService.registerApprovalPwd(apvCertify);

		ResponseEntity<String> result = new ResponseEntity<String>(pwd, HttpStatus.OK);

		return result;
	}

	@RequestMapping("/remakeApvPwd")
	@ResponseBody
	public ResponseEntity<String> remakeApvPwd(String pwd, HttpSession session) throws Exception {

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		ApprovalCertifyVO apvCertify = new ApprovalCertifyVO();

		String encriptedPassword = Sha2Crypt.sha256Crypt(pwd.getBytes(), "$5$"+emp.getEmpCode());

		String encodedpwd = encriptedPassword.substring(encriptedPassword.lastIndexOf("$"));

		apvCertify.setEmpCode(emp.getEmpCode());
		apvCertify.setApvPassword(encodedpwd);
		
		approvalService.modifyApprovalPwd(apvCertify);

		ResponseEntity<String> result = new ResponseEntity<String>(pwd, HttpStatus.OK);

		return result;
	}

	@RequestMapping("/changeApvCertify")
	@ResponseBody
	public ResponseEntity<String> changeApvCertify(String apvCertify, HttpSession session) throws Exception {

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		ApprovalCertifyVO apvCertifyVO = new ApprovalCertifyVO();
		apvCertifyVO.setEmpCode(emp.getEmpCode());
		apvCertifyVO.setApvCertify(apvCertify);

		approvalService.modifyCertify(apvCertifyVO);

		ResponseEntity<String> result = new ResponseEntity<String>(apvCertify, HttpStatus.OK);

		return result;
	}
}
