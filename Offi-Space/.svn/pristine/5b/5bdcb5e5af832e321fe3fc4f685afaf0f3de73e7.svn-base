package kr.co.offispace.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.josephoconnell.html.HTMLInputFilter;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.command.MailCriteriaCommand;
import kr.co.offispace.command.MailVOCommand;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.MailVO;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.mail.MailService;
import kr.co.offispace.util.GetAttachesByMultipartFileAdapter;

@RestController
@RequestMapping("/mail")
public class MailRestController {

	@Resource(name="mailService")
	private MailService service;

	@Resource(name="employeeService")
	private EmployeeService  employesService;

	@RequestMapping(value="/modifyImportance", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> modifyImportance(String mailCode){
		ResponseEntity<String> result = null;

		try {

			service.modifyMailImportance(mailCode);

			result = new ResponseEntity<String>("변경을 완료하였습니다.", HttpStatus.OK);

		} catch (SQLException e) {
			result = new ResponseEntity<String>("서버 장애로 변경이 불가합니다.",HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}

	@RequestMapping("/moveToTrash")
	@ResponseBody
	public ResponseEntity<String> moveToTrash(String mailCode, HttpSession session){
		ResponseEntity<String> entity = null;

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		try {
			service.modifyTrash(mailCode, loginUser.getEmpCode(), "Y");

			entity = new ResponseEntity<String>("성공", HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/permanentlyDelete")
	@ResponseBody
	public ResponseEntity<String> permanentlyDelete(String mailCode, HttpSession session){
		ResponseEntity<String> entity = null;

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		try {
			service.modifyTrash(mailCode, loginUser.getEmpCode(), "R");

			entity = new ResponseEntity<String>("성공", HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/restore")
	@ResponseBody
	public ResponseEntity<String> restore(String mailCode, HttpSession session){
		ResponseEntity<String> entity = null;

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		try {
			service.modifyTrash(mailCode, loginUser.getEmpCode(), "N");

			entity = new ResponseEntity<String>("성공", HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/moveToStore")
	@ResponseBody
	public ResponseEntity<String> moveToStore(String mailCode, HttpSession session){
		ResponseEntity<String> entity = null;

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		try {
			service.modifyStore(mailCode, loginUser.getEmpCode(), "Y");

			entity = new ResponseEntity<String>("성공", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/addReceiver")
	public ResponseEntity<EmployeeVO> addReceiver(String empCode) throws Exception {

		System.out.println("#########"+empCode);
		ResponseEntity<EmployeeVO> result=null;;

		EmployeeVO employee = employesService.getEmployeeByEmpCode(empCode);

		result=new ResponseEntity<EmployeeVO>(employee,HttpStatus.OK);

		return result;
	}

	@RequestMapping(value="chkMoveToTrash")
	public void chkMoveToTrash(@RequestParam(value="sendArray[]") List<String> mailCode, HttpSession session) throws Exception{

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		for(int i = 0; i < mailCode.size(); i++) {

			service.modifyTrash(mailCode.get(i), loginUser.getEmpCode(), "Y");
		}
	}

	@RequestMapping(value="chkMoveToStore")
	public void chkMoveToStore(@RequestParam(value="sendArray[]") List<String> mailCode, HttpSession session) throws Exception{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		for(int i = 0; i < mailCode.size(); i++) {

			service.modifyStore(mailCode.get(i), loginUser.getEmpCode(), "Y");
		}
	}

	@RequestMapping(value="chkRealRemove")
	public void chkRealRemove(@RequestParam(value="sendArray[]") List<String> mailCode, HttpSession session) throws Exception{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		for(int i = 0; i < mailCode.size(); i++) {

			service.modifyTrash(mailCode.get(i), loginUser.getEmpCode(), "R");
		}
	}

	@RequestMapping(value="chkRestore")
	public void chkRestore(@RequestParam(value="sendArray[]") List<String> mailCode, HttpSession session) throws Exception{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		for(int i = 0; i < mailCode.size(); i++) {

			service.modifyTrash(mailCode.get(i), loginUser.getEmpCode(), "N");
		}
	}

	@RequestMapping("mainCnt")
	public Map<String, Integer> mainCnt(HttpSession session) throws Exception{

		MailCriteria cri = new MailCriteria();

		cri.setLoginUser(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

		Map<String, Integer> cntMap = new HashMap<String, Integer>();

		cntMap = service.selectMailMailCount(cri);

		return cntMap;
	}

	@RequestMapping("/main/list")
	public ResponseEntity<List<MailVO>> list(MailCriteriaCommand criCmd, HttpSession session) throws Exception {

		MailCriteria mailCri = criCmd.toMailCriteria();

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		mailCri.setLoginUser(emp.getEmpCode()); // session의 로그인 유저를 담아줘야함

		ResponseEntity<List<MailVO>> mailList = null;

		Map<String, Object> dataMap = new HashMap<>();

		if(mailCri.getKindOfMail().equals("recieved")) {
			dataMap = service.getRecievedMailList(mailCri);
			mailList = new ResponseEntity<List<MailVO>>((List<MailVO>) dataMap.get("recievedMailList"), HttpStatus.OK);
		}else if(mailCri.getKindOfMail().equals("sendToMe")){
			dataMap = service.getSendToMeMailList(mailCri);
			mailList = new ResponseEntity<List<MailVO>>((List<MailVO>) dataMap.get("toMeList"), HttpStatus.OK);
		}else if(mailCri.getKindOfMail().equals("temporary")){
			dataMap = service.getSendTempMailList(mailCri);
			mailList = new ResponseEntity<List<MailVO>>((List<MailVO>) dataMap.get("sendTempMailList"), HttpStatus.OK);
		}else if(mailCri.getKindOfMail().equals("trash")){
			dataMap = service.getTrashMailList(mailCri);
			mailList = new ResponseEntity<List<MailVO>>((List<MailVO>) dataMap.get("mailList"), HttpStatus.OK);
		}


		return mailList;
	}

	@Resource(name = "mailFilesPath")
	private String mailFilesPath;

	@RequestMapping("/main/register")
	public ResponseEntity<String> mainRegister(MailVOCommand mailCmd) throws Exception{

		MailVO mail = mailCmd.toMailVO();

		List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(mailCmd.getUploadFiles(), mailFilesPath);

		mail.setAttachList(attachList);

		mail.setMailTitle(HTMLInputFilter.htmlSpecialChars(mail.getMailTitle()));

		String sort = service.transferMail(mail);

		ResponseEntity<String> entity = new ResponseEntity<String>(sort, HttpStatus.OK);

		return entity;
	}

}
