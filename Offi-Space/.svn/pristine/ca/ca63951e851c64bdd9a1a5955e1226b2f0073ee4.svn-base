package kr.co.offispace.controller;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.digest.Sha2Crypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.offispace.command.ApprovalCriteria;
import kr.co.offispace.command.ApprovalProcessCommand;
import kr.co.offispace.command.ApvAgencyVOCommand;
import kr.co.offispace.dto.ApprovalFormVO;
import kr.co.offispace.dto.ApvAgencyVO;
import kr.co.offispace.dto.CommonCodeVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.JApprovalLineVO;
import kr.co.offispace.service.approval.ApprovalService;
import kr.co.offispace.service.commonCode.CommonCodeService;
import kr.co.offispace.service.employee.EmployeeService;

@RestController
@RequestMapping("/approval")
public class ApprovalRestController {

	@Resource(name="approvalService")
	private ApprovalService approvalService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private CommonCodeService commonCodeService;

	@RequestMapping("/getApprovalForm")
	public ResponseEntity<ApprovalFormVO> getApprovalForm(String apvFormCode) throws Exception{

		ApprovalFormVO approvalForm =  approvalService.getApvFormByFormCode(apvFormCode);

		ResponseEntity<ApprovalFormVO> result = new ResponseEntity<ApprovalFormVO>(approvalForm, HttpStatus.OK);

		return result;
	}

	@RequestMapping(value="/getTeamName",produces="application/text;charset=utf-8")
	public ResponseEntity<String> getTeamName(String comCode) throws Exception{

		CommonCodeVO commonCode = commonCodeService.getCommonCode(comCode);

		ResponseEntity<String> result = new ResponseEntity<String>(commonCode.getComCode1(), HttpStatus.OK);

		return result;
	}

	@RequestMapping(value="/confirmPwd", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	public ResponseEntity<String> confirmPwd(String empCode, String pwd) throws SQLException{

		String empPwd = approvalService.getApvPwdByEmpCode(empCode);

		String encriptedPassword = Sha2Crypt.sha256Crypt(pwd.getBytes(), "$5$"+ empCode);

		String encodedpwd = encriptedPassword.substring(encriptedPassword.lastIndexOf("$"));

		ResponseEntity<String> entity = null;

		if(empPwd.equals(encodedpwd)) {
			String msg = "결재 인증에 성공했습니다.";
			entity = new ResponseEntity<String>(msg, HttpStatus.OK);
			return entity;
		}else if(!empPwd.equals(encodedpwd)) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;


	}

	@RequestMapping(value="/confirmOtp", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	public ResponseEntity<String> confirmOtp(String empCode, String code) throws Exception {

		String encodedKey = approvalService.getOtpKeyByEmpCode(empCode);

		ResponseEntity<String> entity = null;


		long codeCheck = Integer.parseInt(code);
		long l = new Date().getTime();
		long ll = l / 30000;

		boolean check_code = false;
		check_code = check_code(encodedKey, codeCheck, ll);

		if (!check_code) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			return entity;
		}

		String msg = "결재 인증에 성공했습니다.";
		entity = new ResponseEntity<String>(msg, HttpStatus.OK);

		return entity;
	}


	// 코드 체크 함수
	// SECERET은 OTP.jsp의 키인증 번호임
	private static boolean check_code(String secret, long code, long t)
			throws InvalidKeyException, NoSuchAlgorithmException {
		Base32 codec = new Base32();
		byte[] decodedKey = codec.decode(secret);

		int window = 3;
		for (int i = -window; i <= window; ++i) {
			long hash = verify_code(decodedKey, t + i);

			if (hash == code) {
				return true;
			}
		}

		return false;
	}

	// 코드 확인 함수
	private static int verify_code(byte[] key, long t) throws NoSuchAlgorithmException, InvalidKeyException {
		byte[] data = new byte[8];
		long value = t;
		for (int i = 8; i-- > 0; value >>>= 8) {
			data[i] = (byte) value;
		}

		SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
		Mac mac = Mac.getInstance("HmacSHA1");
		mac.init(signKey);
		byte[] hash = mac.doFinal(data);

		int offset = hash[20 - 1] & 0xF;

		long truncatedHash = 0;
		for (int i = 0; i < 4; ++i) {
			truncatedHash <<= 8;
			truncatedHash |= (hash[offset + i] & 0xFF);
		}

		truncatedHash &= 0x7FFFFFFF;
		truncatedHash %= 1000000;

		return (int) truncatedHash;
	}

	// 자주쓰는 결재선 등록
	@RequestMapping(value="/jLineRegister", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	public ResponseEntity<String> jLineRegister(String name,@RequestParam(value="lineArr[]") List<String> lineArr , HttpSession session) throws Exception {

		String jApvCode = approvalService.getJApvSeqNextval();

		JApprovalLineVO jApvLine = new JApprovalLineVO();
		jApvLine.setjApvLineCode(jApvCode);
		jApvLine.setjApvLineName(name);
		jApvLine.setEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		approvalService.registerJApvLine(jApvLine);

		for (String line : lineArr) {
			// 순서/empCode/종류
			String[] arr = line.split("/");
			jApvLine.setjApvLineInfoCode(jApvCode);
			jApvLine.setjApvLineInfoOrder(arr[0]);
			jApvLine.setjApvLineInfoEmpCode(arr[1]);
			jApvLine.setjApvLineInfoKind(arr[2]);

			approvalService.registerJApvLineInfo(jApvLine);
		}

		ResponseEntity<String> entity = new ResponseEntity<String>("자주쓰는 결재선 [" + name + "]을 등록하였습니다.", HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value="/getJApvLine")
	public ResponseEntity<List<JApprovalLineVO>> jLineRegister(String jApvLineCode) throws Exception {

		List<JApprovalLineVO> jApprovalLineList = approvalService.getJApvLineInfo(jApvLineCode);

		for (JApprovalLineVO jApprovalLineVO : jApprovalLineList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(jApprovalLineVO.getjApvLineInfoEmpCode());
			jApprovalLineVO.setEmp(emp);
		}

		ResponseEntity<List<JApprovalLineVO>> entity = new ResponseEntity<List<JApprovalLineVO>>(jApprovalLineList, HttpStatus.OK);

		return entity;
	}

	@RequestMapping("removeJApvLine")
	public ResponseEntity<String> removeJApvLine(String jApvLineCode) throws Exception {

		approvalService.removeJApprovalLine(jApvLineCode);
		return null;
	}

	//결재 승인,반려,합의 처리
	@RequestMapping(value="/modifyForApvProcessing", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	public ResponseEntity<String> modifyForApvProcessing(@RequestBody ApprovalProcessCommand apvProCmd) throws Exception{


		ResponseEntity<String> entity = new ResponseEntity<String>("결재처리 성공!",HttpStatus.OK);

		int lastOrder = approvalService.getLastApvOrder(apvProCmd.getApvCode());

		/*결재문서상태*/
		if(apvProCmd.getApvConfirm().equals("A")) {

			if(apvProCmd.getApvLineOrder() == lastOrder) {
				apvProCmd.setApvState("J103");
			}else{
				apvProCmd.setApvState("J102");
			}

		}else if(apvProCmd.getApvConfirm().equals("R")) {

			apvProCmd.setApvState("J104");

		}else if(apvProCmd.getApvConfirm().equals("Y")
				 || apvProCmd.getApvConfirm().equals("N")) {

			//합의자는 결재가 완료되면 결재대기함의 결재할 문서에서 결재문서를 볼 수 없기 때문에
			//합의자가 결재문서를 합의처리하면 항상 결재문서상태는 진행중이 되도록 한다.
			apvProCmd.setApvState("J102");

		}

		approvalService.modifyApprovalForProcess(apvProCmd);
		approvalService.modifyApprovalLineForProcess(apvProCmd);

		return entity;
	}

	@RequestMapping(value="/saveAgency", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	public ResponseEntity<String> saveAgency(@RequestBody ApvAgencyVOCommand agencyCmd) throws Exception{

		ApvAgencyVO agency = agencyCmd.toApvAgencyVO();

		approvalService.registerApvAgency(agency);

		ResponseEntity<String> entity = new ResponseEntity<String>("대결자 지정에 성공했습니다.", HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value="/getEmp")
	public ResponseEntity<EmployeeVO> getEmp(String empCode) throws Exception{

		EmployeeVO emp = employeeService.getEmployeeByEmpCode(empCode);

		ResponseEntity<EmployeeVO> entity = new ResponseEntity<EmployeeVO>(emp, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value="/mainCnt")
	public ResponseEntity<Map<String, Integer>> getMainCnt(String empCode) throws Exception{

		ApprovalCriteria cri = new ApprovalCriteria();
		cri.setLoginEmpCode(empCode);

		Map<String, Integer> map = approvalService.getMainCnt(cri);

		ResponseEntity<Map<String, Integer>> entity = new ResponseEntity<Map<String, Integer>>(map, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value="/agency")
	public ResponseEntity<ApvAgencyVO> agency(String empCode) throws Exception{

		ApvAgencyVO apv = approvalService.getAgency(empCode);

		ResponseEntity<ApvAgencyVO> entity = new ResponseEntity<ApvAgencyVO>(apv, HttpStatus.OK);

		return entity;
	}
}
