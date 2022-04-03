package kr.co.offispace.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.ContactCriteria;
import kr.co.offispace.command.ContactCriteriaCommand;
import kr.co.offispace.command.RegisterEmployeeCommand;
import kr.co.offispace.dto.ApprovalCertifyVO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.CommonCodeVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.service.approval.ApprovalService;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.commonCode.CommonCodeService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.scheduler.SchedulerSerivce;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CommonCodeService commonCodeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private SchedulerSerivce scheulderService;
	
	@Resource(name="employeeImagesPath")
	private String employeeImagesPath;
	
	@Resource(name="fileDocumentPath")
	private String fileDocumentPath;

	@Resource(name="approvalService")
	private ApprovalService approvalService;

	@RequestMapping("/main")
	public String main() {
		String url = "admin/main";
		return url;
	}

	@RequestMapping("/HRManager")
	public ModelAndView HRManager(ContactCriteriaCommand cri2, HttpServletRequest request, ModelAndView mnv) throws Exception 
	{
		String url= "admin/HRManager";
		
		ContactCriteria cri = cri2.toContactCriteria();
		
		Map<String, Object> dataMap = employeeService.getEmployeeListPage(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registerEmployeeForm")
	public ModelAndView registerEmployeeForm(ModelAndView mnv) throws SQLException {
		String url = "admin/registerEmployeeForm";

		List<CommonCodeVO> headOfficeList = commonCodeService.getHeadOfficeList();
		List<CommonCodeVO> positionList = commonCodeService.getPositionList();
		List<CommonCodeVO> chargeList = commonCodeService.getChargeList();
		List<CommonCodeVO> authorityList = commonCodeService.getAuthorityList();

		mnv.addObject("headOfficeList", headOfficeList);
		mnv.addObject("positionList", positionList);
		mnv.addObject("chargeList", chargeList);
		mnv.addObject("authorityList", authorityList);

		mnv.setViewName(url);

		return mnv;
	}

	@ResponseBody
	@RequestMapping("/registerEmployee") 
	public ResponseEntity<String> registerEmployee( RegisterEmployeeCommand registerEmployeeCommand,
									HttpServletRequest request, 
									HttpServletResponse response,
									ModelAndView mnv,
									HttpSession session) {
		ResponseEntity<String> entity = new ResponseEntity<String>(HttpStatus.OK);
		System.out.println(registerEmployeeCommand);
		
		try {
			//사원 생성
			employeeService.registerEmployee(registerEmployeeCommand);
			
			//사원 파일 삽입
			EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
			
			String saveName=registerEmployeeCommand.getEmpPicture();
			String savePath=employeeImagesPath;
//			String register=loginUser.getEmpName();
			String register="등록자";
			String group=registerEmployeeCommand.getEmpCode();
			
			AttachmentVO attachment = getAttachmentVO(saveName, savePath, register, group);
			
			attachmentService.registerAttachment(attachment);
			
			//사원 개인 스케쥴그룹 생성
			EmployeeVO registerEmployee=new EmployeeVO();
			registerEmployee.setEmpCode(registerEmployeeCommand.getEmpCode());
			registerEmployee.setEmpName(registerEmployeeCommand.getEmpName());
			registerEmployee.setTeamCode(registerEmployeeCommand.getTeamCode());
			scheulderService.registerSchedulerGroup(registerEmployee);
			
			//사원 개인 폴더 (파일문서함용) 생성
			String realPath=fileDocumentPath+registerEmployeeCommand.getEmpName()+"/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
			
			File file=new File(realPath);
			file.mkdirs();
			
			// 전자결재 설정
			ApprovalCertifyVO certify = new ApprovalCertifyVO();
			certify.setEmpCode(registerEmployeeCommand.getEmpCode());
			approvalService.registerCertify(certify);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);			
		}
		

		return entity;
		
	}
	
	private AttachmentVO getAttachmentVO(String saveName,String savePath,String register,String group)
	{
		AttachmentVO attachment=new AttachmentVO();
		attachment.setAttachSavename(saveName);
		attachment.setAttachSavepath(savePath);
		attachment.setAttachExtension(saveName.substring(saveName.lastIndexOf(".")+1));
		attachment.setAttachRegister(register);
		attachment.setAttachGroup(group);
		
		return attachment;
	}
	
}
