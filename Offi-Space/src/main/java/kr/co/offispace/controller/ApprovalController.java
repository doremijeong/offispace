package kr.co.offispace.controller;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.co.offispace.command.ApprovalCommand;
import kr.co.offispace.command.ApprovalCriteria;
import kr.co.offispace.command.ApprovalCriteriaCommand;
import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.CriteriaCommand;
import kr.co.offispace.dto.ApprovalCertifyVO;
import kr.co.offispace.dto.ApprovalFormVO;
import kr.co.offispace.dto.ApprovalLineVO;
import kr.co.offispace.dto.ApprovalVO;
import kr.co.offispace.dto.ApvAgencyVO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.JApprovalLineVO;
import kr.co.offispace.service.approval.ApprovalService;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.commonCode.CommonCodeService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.util.GetAttachesByMultipartFileAdapter;
import kr.co.offispace.util.LoggerHelper;

@Controller
public class ApprovalController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ApprovalController.class);

	@Resource(name="logApprovalsPath")
	private String savePathApprovals;

	@Resource(name = "apvFilesPath")
	private String apvFilesPath;

	@Resource(name="approvalService")
	private ApprovalService approvalService;

	@Resource(name="attachmentService")
	private AttachmentService attachService;

	@Autowired
	private CommonCodeService commonCodeService;

	@Autowired
	private EmployeeService employeeService;

	@RequestMapping("/approval/main")
	public ModelAndView approvalMain(ApprovalCriteriaCommand criCmd, HttpSession session, ModelAndView mnv) throws Exception {

		//apvList(결재)
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		List<ApprovalVO> list = approvalService.getListForMain(emp.getEmpCode());

		List<ApprovalVO> realList = new ArrayList<>();

		for (ApprovalVO approvalVO : list) {
			ApprovalVO apv = approvalService.getApprovalByApvCode(approvalVO.getApvCode());
			if(apv.getNowEmp().getEmpCode().equals(emp.getEmpCode()) && apv.getApvEmergency().equals("Y")) {
				apv.setKindCode("AK0001");
				realList.add(apv);
			}

			for(ApprovalLineVO apvLine : apv.getApvLineList()) {
				if(apvLine.getApvKindCode().equals("AK0002")
						&& apvLine.getEmpCode().equals(emp.getEmpCode())
						&& apv.getApvEmergency().equals("Y")) {
					apv.setKindCode("AK0002");
					realList.add(apv);
				}
			}
		}

		for (ApprovalVO approvalVO : list) {
			ApprovalVO apv = approvalService.getApprovalByApvCode(approvalVO.getApvCode());
			if(apv.getNowEmp().getEmpCode().equals(emp.getEmpCode()) && apv.getApvEmergency().equals("N")) {
				apv.setKindCode("AK0001");
				realList.add(apv);
			}

			for(ApprovalLineVO apvLine : apv.getApvLineList()) {
				if(apvLine.getApvKindCode().equals("AK0002")
						&& apvLine.getEmpCode().equals(emp.getEmpCode())
						&& apv.getApvEmergency().equals("N")) {
					apv.setKindCode("AK0002");
					realList.add(apv);
				}
			}
		}


		//apvRequestList(기안)
		ApprovalCriteria cri = criCmd.toCriteria();
		cri.setLoginEmpCode(emp.getEmpCode());
		Map<String, Object> dataMap = approvalService.getRequestApvList(cri);


		//카운트 가져오기
    	Map<String, Integer> apvCount = approvalService.getApvCount(emp.getEmpCode());


		String url = "/approval/main";

		mnv.setViewName(url);
		mnv.addObject("apvCount", apvCount);
		mnv.addObject("apvList",realList);
		mnv.addObject("dataMap",dataMap);
		return mnv;
	}

	@RequestMapping("/approval/detail")
	public String approvalDetail() {
		String url = "/approval/detail";
		return url;
	}

	@RequestMapping("/approval/detail2")
	public String approvalDetail2() {
		String url = "/approval/approval_detail";
		return url;
	}

	@RequestMapping("/approval/list_request")
	public String approvalRequestList() {
		String url = "/approval/list_request";
		return url;
	}


	@RequestMapping("/approval/insert")
	public ModelAndView approvalInsert(String apvFormCode, ModelAndView mnv) throws Exception {
		String url = "/approval/insert";

		List<ApprovalFormVO> apvFormGrList =  approvalService.getApvFormGr();
		List<List<ApprovalFormVO>> allApvFormList = new ArrayList<List<ApprovalFormVO>>();

		for (ApprovalFormVO apvFormGr : apvFormGrList) {
			List<ApprovalFormVO> apvFormList = approvalService.getApvFormByFormGr(apvFormGr.getApvFomGrCode());
			allApvFormList.add(apvFormList);
		}

		mnv.addObject("apvFormCode",apvFormCode);
		mnv.addObject("apvFormGrList",apvFormGrList);
		mnv.addObject("allApvFormList",allApvFormList);
		mnv.setViewName(url);

		return mnv;
	}

	// 전자결재 설정
	@RequestMapping("/approval/setting")
	public ModelAndView setting(HttpSession session, ModelAndView mnv) throws SQLException {
		String url = "/approval/settingForm";

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		ApprovalCertifyVO certify = approvalService.getCertify(emp.getEmpCode());

		String otpKey = approvalService.getOtpKeyByEmpCode(emp.getEmpCode());
		if(otpKey != null && !otpKey.isEmpty()){
			certify.setOtpKey(otpKey);
		}

		String pwd = approvalService.getApvPwdByEmpCode(emp.getEmpCode());
		if(pwd != null && !pwd.isEmpty()){
			System.out.println(pwd);
			certify.setApvPassword(pwd);
			System.out.println(pwd);
		}

		List<ApvAgencyVO> agencyList = approvalService.getAgencyList(emp.getEmpCode());

		List<JApprovalLineVO> jApvLineList = approvalService.jApvLineList(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		mnv.addObject("jApvLineList",jApvLineList);
		mnv.addObject("agencyList",agencyList);
		mnv.addObject("certify",certify);
		mnv.setViewName(url);

		return mnv;
	}



	//결재선 지정 폼
	@RequestMapping("/approval/approvalLineSet")
	public ModelAndView approvalLineSet(ModelAndView mnv, HttpSession session, HttpServletRequest request) throws SQLException {
		String url = "/approval/approvalLineSet";

		Map<String, Object> dataMap = commonCodeService.getOrganizationChart();

		List<EmployeeVO> employeeList = employeeService.getEmployeeList();

		List<JApprovalLineVO> jApvLineList = approvalService.jApvLineList(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		mnv.addAllObjects(dataMap);
		mnv.addObject("employeeList",employeeList);
		mnv.addObject("jApvLineList",jApvLineList);
		mnv.setViewName(url);

		return mnv;
	}


	//결재요청
	@RequestMapping("/approval/register")
	public String registerApproval(ApprovalCommand apvCmm, HttpSession session, RedirectAttributes rttr) throws Exception{
		String url = null;

		ApprovalVO apv = apvCmm.toApprovalVO();

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		apv.setEmpCode(emp.getEmpCode());

		LOGGER.debug("apvCmm {}",apvCmm);
		LOGGER.debug("apvCmm {}",apvCmm.getUploadFiles());


		if(apvCmm.getUploadFiles() != null && !apvCmm.getUploadFiles().isEmpty()) {

			List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(apvCmm.getUploadFiles(), apvFilesPath);
			apv.setAttachList(attachList);
		}

		if(apvCmm.getDeleteFiles() != null && !apvCmm.getDeleteFiles().isEmpty()) {
			for (String atCode : apvCmm.getDeleteFiles()) {
				AttachmentVO attach = attachService.getAttachmentByAT(atCode);
				File deleteFile = new File(attach.getAttachSavepath(), attach.getAttachSavename());
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				attachService.removeAttachmentByAT(atCode);
			}
		}

		if(apv.getApvCode() != null && !apv.getApvCode().isEmpty()) {
			approvalService.modifyApproval(apv);
		}else {
			approvalService.registerApproval(apv);
		}

		if(apv.getApvTemporary().equals("Y")) {
			url = "redirect:/approval/temp/list.do";
		}else if(apv.getApvTemporary().equals("N")) {
			// 결재 요청함 언제 나와 혜윤씌
			// 여기는 결재 요청함으로 redirect하는 곳이야 음하하하
			url = "redirect:/approval/request/list.do";
		}

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping("/approval/formPreview")
	public ModelAndView formPreview(String apvFormCode, ModelAndView mnv) throws Exception{

		String url = "approval/formPreview";

		ApprovalFormVO approvalForm =  approvalService.getApvFormByFormCode(apvFormCode);

		mnv.addObject("approvalForm",approvalForm);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/approval/temp/list")
	public ModelAndView tempList(ApprovalCriteriaCommand criCmd, HttpSession session, ModelAndView mnv) throws Exception{

		String url = "approval/list_temp";

		ApprovalCriteria cri = criCmd.toCriteria();
		cri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		Map<String, Object> dataMap = approvalService.getApprovalTempList(cri);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/approval/wait/list")
	public ModelAndView waitList(ApprovalCriteriaCommand criCmd, HttpSession session, ModelAndView mnv) throws Exception{

		String url = "approval/list_wait";

		ApprovalCriteria cri = criCmd.toCriteria();
		cri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		Map<String, Object> dataMap = approvalService.getApprovalByApvCode(cri);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}


	@RequestMapping("/approval/waitDetail")
	public ModelAndView waitDetail(ModelAndView mnv, HttpSession session, HttpServletRequest request, String from) throws SQLException {
		String url = "approval/detail_wait";
		String apvCode = request.getParameter("apvCode");
		//System.out.println("결재코드 가져오니 컨트롤러야아아아 : " + apvCode);
		ApprovalVO approval = approvalService.getApprovalByApvCode2(apvCode);

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		ApprovalCertifyVO certify = approvalService.getCertify(emp.getEmpCode());

		//결재 순서가져오려고 로그인 유저, 결재코드 담는 VO
		ApprovalLineVO apvLine = new ApprovalLineVO();
		apvLine.setEmpCode(emp.getEmpCode());
		apvLine.setApvCode(apvCode);

		int apvLineOrder = approvalService.getMyApvLineOrder(apvLine);

		if(from != null && !from.isEmpty()) {
			mnv.addObject("from", from);
		}
		mnv.addObject("approval",approval);
		mnv.addObject("apvLineOrder",apvLineOrder);
		mnv.addObject("certify",certify);
		mnv.setViewName(url);

		//전결 열람 로그 기록
		LoggerHelper.writeApprovalLog(request, apvCode, savePathApprovals);

		return mnv;
	}


	@RequestMapping("/approval/temp")
	public ModelAndView temp(ModelAndView mnv, String apvCode) throws Exception{

		String url = "approval/tempApv";

		ApprovalVO apv = approvalService.getApprovalByApvCode(apvCode);

		mnv.setViewName(url);
		mnv.addObject("apv",apv);

		return mnv;
	}


	//결재선 지정 폼
	@RequestMapping("/approval/approvalLineSetForSetting")
	public ModelAndView approvalLineSetForSetting(ModelAndView mnv, HttpSession session, HttpServletRequest request) throws SQLException {
		String url = "/approval/approvalLineSetSetting";

		Map<String, Object> dataMap = commonCodeService.getOrganizationChart();

		List<EmployeeVO> employeeList = employeeService.getEmployeeList();

		List<JApprovalLineVO> jApvLineList = approvalService.jApvLineList(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		mnv.addAllObjects(dataMap);
		mnv.addObject("employeeList",employeeList);
		mnv.addObject("jApvLineList",jApvLineList);
		mnv.setViewName(url);

		return mnv;
	}

	//결재선 지정 폼
	@RequestMapping("/approval/zozicdo")
	public ModelAndView zozicdo(ModelAndView mnv, HttpSession session, HttpServletRequest request) throws SQLException {
		String url = "/approval/zozicdo";

		Map<String, Object> dataMap = commonCodeService.getOrganizationChart();

		List<EmployeeVO> employeeList = employeeService.getEmployeeList();


		mnv.addAllObjects(dataMap);
		mnv.addObject("employeeList",employeeList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/approval/refuse/list")
	public ModelAndView refuseList(ApprovalCriteriaCommand criCmd, HttpSession session, ModelAndView mnv) throws Exception{

		String url = "approval/list_refuse";

		ApprovalCriteria cri = criCmd.toCriteria();
		cri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		Map<String, Object> dataMap = approvalService.getRefuseApvList(cri);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/approval/request/list")
	public ModelAndView requestList(ApprovalCriteriaCommand criCmd, HttpSession session, ModelAndView mnv) throws Exception{

		String url = "approval/list_request";

		ApprovalCriteria cri = criCmd.toCriteria();
		cri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		Map<String, Object> dataMap = approvalService.getRequestApvList(cri);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/approval/refuse/detail")
	public ModelAndView refuseDetail(String apvCode, ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "approval/detail_refuse";

		ApprovalVO approval = approvalService.getApprovalByApvCode(apvCode);

		mnv.addObject("approval",approval);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/approval/request/detail")
	public ModelAndView requestDetail(String apvCode, ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "approval/detail_request";

		ApprovalVO approval = approvalService.getApprovalByApvCode(apvCode);

		mnv.addObject("approval",approval);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/approval/dratfAgain")
	public ModelAndView dratfAgain(String apvCode, ModelAndView mnv) throws SQLException{

		String url = "/approval/againForm";

		ApprovalVO apv = approvalService.getApprovalByApvCode(apvCode);

		mnv.setViewName(url);
		mnv.addObject("apv",apv);

		return mnv;
	}

	@RequestMapping("/approval/modifyApv")
	public String modifyApv(ApprovalCommand apvCmm, HttpSession session) throws Exception{
		String url = "redirect:/approval/request/list.do";

		ApprovalVO apv = apvCmm.toApprovalVO();

		approvalService.modifyApvForAgain(apv);

		return url;
	}



		@RequestMapping("/approval/ref/list")
		public ModelAndView refList(ApprovalCriteriaCommand criCmd, HttpSession session, ModelAndView mnv) throws Exception{

			String url = "approval/list_ref";

			ApprovalCriteria cri = criCmd.toCriteria();
			cri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

			Map<String, Object> dataMap = approvalService.getRefApprovalByApvCode(cri);

			mnv.addObject("dataMap",dataMap);
			mnv.setViewName(url);

			return mnv;
		}


		@RequestMapping("/approval/refDetail")
		public ModelAndView refDetail(ModelAndView mnv, HttpSession session, HttpServletRequest request) throws SQLException {
			String url = "approval/detail_ref";
			String apvCode = request.getParameter("apvCode");
			ApprovalVO approval = approvalService.getApprovalByApvCode2(apvCode);

			EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

			mnv.addObject("approval",approval);
			mnv.setViewName(url);

			//전결 열람 로그 기록
			LoggerHelper.writeApprovalLog(request, apvCode, savePathApprovals);

			return mnv;
		}


		@RequestMapping("/approval/complete/list")
		public ModelAndView completeList(ApprovalCriteriaCommand criCmd, HttpSession session, ModelAndView mnv) throws Exception{

			String url = "approval/list_complete";

			ApprovalCriteria cri = criCmd.toCriteria();
			cri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

			Map<String, Object> dataMap = approvalService.getCompleteApprovalByApvCode(cri);

			mnv.addObject("dataMap",dataMap);
			mnv.setViewName(url);

			return mnv;
		}


		@RequestMapping("/approval/completeDetail")
		public ModelAndView completeDetail(ModelAndView mnv, HttpSession session, HttpServletRequest request) throws SQLException {
			String url = "approval/detail_complete";
			String apvCode = request.getParameter("apvCode");
			ApprovalVO approval = approvalService.getApprovalByApvCode2(apvCode);

			EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

			mnv.addObject("approval",approval);
			mnv.setViewName(url);

			//전결 열람 로그 기록
			LoggerHelper.writeApprovalLog(request, apvCode, savePathApprovals);

			return mnv;
		}


}
