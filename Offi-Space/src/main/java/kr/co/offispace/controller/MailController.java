package kr.co.offispace.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.command.MailCriteriaCommand;
import kr.co.offispace.command.MailVOCommand;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.MailVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.commonCode.CommonCodeService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.mail.MailService;
import kr.co.offispace.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Resource(name="mailService")
	private MailService service;

	@Resource(name="employeeService")
	private EmployeeService  employesService;

	@Resource(name="attachmentService")
	private AttachmentService attachService;

	@Autowired
	private CommonCodeService commonCodeService;

	@RequestMapping("/main")
	public String mailMain() throws Exception {
		String url="mail/main";
		
		return url;
	}

	@RequestMapping("/writeForm")
	public ModelAndView writeForm(ModelAndView mnv) throws Exception {

		String url="mail/writeForm";

		List<EmployeeVO> empList = employesService.getEmployeeList();

		mnv.addObject("empList", empList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/writeToMeForm")
	public String writeToMeForm() {
		String url="mail/writeToMeForm";
		return url;
	}

	@RequestMapping("/list")
	public ModelAndView list(MailCriteriaCommand criCmd, ModelAndView mnv, HttpSession session) throws Exception {
		String url = null;

		MailCriteria mailCri = criCmd.toMailCriteria();

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		mailCri.setLoginUser(emp.getEmpCode()); // session의 로그인 유저를 담아줘야함

		Map<String, Object> dataMap = new HashMap<>();


		if(mailCri.getKindOfMail().equals("recieved")) {
			dataMap = service.getRecievedMailList(mailCri);
			url = "mail/recievedList";
		}else if(mailCri.getKindOfMail().equals("send")){
			dataMap = service.getSendMailList(mailCri);
			url = "mail/sendList";
		}else if(mailCri.getKindOfMail().equals("sendToMe")){
			dataMap = service.getSendToMeMailList(mailCri);
			url = "mail/sendToMeList";
		}else if(mailCri.getKindOfMail().equals("temporary")){
			dataMap = service.getSendTempMailList(mailCri);
			url = "mail/temporaryList";
		}else if(mailCri.getKindOfMail().equals("store")){
			dataMap = service.getStoreMailList(mailCri);
			url = "mail/storeList";
		}else if(mailCri.getKindOfMail().equals("trash")){
			dataMap = service.getTrashMailList(mailCri);
			url = "mail/trashList";
		}else if(mailCri.getKindOfMail().equals("notRead")){
			dataMap = service.getNotReadMailList(mailCri);
			url = "mail/recievedList";
		}
		else if(mailCri.getKindOfMail().equals("import")){
			dataMap = service.getImportMailList(mailCri);
			url = "mail/recievedList";
		}

		List<EmployeeVO> empList = employesService.getEmployeeList();

		mnv.addObject("empList", empList);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(String mailCode, String kindOfMail, String from, ModelAndView mnv, HttpSession session) throws Exception{

		String url = null;

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		MailVO mail = service.getMailbyMailCode(mailCode, emp.getEmpCode());

		if(kindOfMail.equals("recieved") && from != null && from.equals("main")) {
			url = "mail/recievedDetailForMain";
		} else if(kindOfMail.equals("recieved")){
			url = "mail/recievedDetail";
		}else if(kindOfMail.equals("send")){
			url = "mail/sendDetail";
		}else if(kindOfMail.equals("sendToMe")){
			url = "mail/detailToMe";
		}else if(kindOfMail.equals("store")){
			url = "mail/detailStore";
		}else if(kindOfMail.equals("trash")){
			url = "mail/detailTrash";
		}

		mnv.setViewName(url);
		mnv.addObject("mail", mail);

		return mnv;
	}


	@RequestMapping(value="/tempGO")
	public ModelAndView changeTemp(String mailCode, ModelAndView mnv, HttpSession session) throws Exception{

		String url = null;

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		MailVO mail = service.getMailbyMailCode(mailCode, emp.getEmpCode());

		if(mail.getMailFrom().equals(mail.getMailTo())) {
			url = "mail/writeToMeForm";
		}else {
			url = "mail/writeForm";
		}

		List<EmployeeVO> empList = employesService.getEmployeeList();

		mnv.addObject("empList", empList);
		mnv.addObject("mail", mail);
		mnv.setViewName(url);

		return mnv;
	}

	@Resource(name = "mailFilesPath")
	private String mailFilesPath;

	@RequestMapping(value="/register")
	public String registerFromMe(MailVOCommand mailCmd, RedirectAttributes rttr) throws Exception{

		String url = null;

		MailVO mail = mailCmd.toMailVO();

		List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(mailCmd.getUploadFiles(), mailFilesPath);

		mail.setAttachList(attachList);

		mail.setMailTitle(HTMLInputFilter.htmlSpecialChars(mail.getMailTitle()));

		String sort = null;

		if(mailCmd.getDeleteFiles() != null && mailCmd.getDeleteFiles().length >0) {
			for (String atCode : mailCmd.getDeleteFiles()) {
				AttachmentVO attach = attachService.getAttachmentByAT(atCode);
				File deleteFile = new File(attach.getAttachSavepath(), attach.getAttachSavename());
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				attachService.removeAttachmentByAT(atCode);
			}
		}

		/*
		if(mailCmd.getAttached() != null && !mailCmd.getAttached().isEmpty()) {
			for (String atCode : mailCmd.getAttached()) {
				AttachmentVO attach = attachService.getAttachmentByAT(atCode);
				attachList.add(attach);
			}
		}*/

		if(mailCmd.getMailCode() != null && !mailCmd.getMailCode().isEmpty()) {

			sort = service.modifyMail(mail);

		}else if(mailCmd.getMailCode().isEmpty()) {

			sort = service.transferMail(mail);

		}

		if(mail.getMailTemp().equals("Y")) {
			url = "redirect:/mail/list.do?kindOfMail=temporary";
		} else if(sort.equals("FromMe")) {
			url = "redirect:/mail/list.do?kindOfMail=sendToMe";
		}else if(sort.equals("normal")) {
			url = "redirect:/mail/list.do?kindOfMail=send";
		}

		rttr.addFlashAttribute("from","regist");

		return url;
	}

	@RequestMapping("getFile")
	public String getFile(String atCode, Model model) throws Exception{
		String url = "downloadFile";

		AttachmentVO attach = attachService.getAttachmentByAT(atCode);

		model.addAttribute("savepath",attach.getAttachSavepath());
		model.addAttribute("savename",attach.getAttachSavename());


		return url;
	}


	@RequestMapping("/receiverListForm")
	public ModelAndView receiverList(ModelAndView mnv) throws Exception
	{
		String url="mail/receiverListForm";

		Map<String, Object> dataMap = commonCodeService.getOrganizationChart();

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);;

		return mnv;
	}

	@RequestMapping("/referencerListForm")
	public ModelAndView referencerList(ModelAndView mnv) throws Exception
	{
		String url="mail/referencerListForm";

		Map<String, Object> dataMap = commonCodeService.getOrganizationChart();

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/reply")
	public ModelAndView replyMail(String mailCode, ModelAndView mnv, HttpSession session) throws Exception
	{
		String url="mail/replyForm";

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		MailVO mail = service.getMailbyMailCode(mailCode, emp.getEmpCode());

		List<EmployeeVO> empList = employesService.getEmployeeList();

		mnv.addObject("empList", empList);
		mnv.addObject("mail", mail);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/relay")
	public ModelAndView relayMail(String mailCode, ModelAndView mnv, HttpSession session) throws Exception
	{
		String url="mail/relayForm";

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		MailVO mail = service.getMailbyMailCode(mailCode, emp.getEmpCode());

		List<EmployeeVO> empList = employesService.getEmployeeList();

		mnv.addObject("empList", empList);
		mnv.addObject("mail", mail);
		mnv.setViewName(url);


		return mnv;
	}

	@RequestMapping("/writeMailForMain")
	public ModelAndView writeMailForMain(ModelAndView mnv) throws Exception
	{
		String url="mail/writeFormForMain";

		List<EmployeeVO> empList = employesService.getEmployeeList();

		mnv.addObject("empList", empList);
		mnv.setViewName(url);

		return mnv;
	}
}
