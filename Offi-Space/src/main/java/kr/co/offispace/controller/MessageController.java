package kr.co.offispace.controller;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.command.MessageCriteria;
import kr.co.offispace.command.MessageCriteriaCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.MessageVO;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.message.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;

	@Resource(name="employeeService")
	private EmployeeService  employesService;

	
	
	@RequestMapping("/main")
	public ModelAndView msgMain(ModelAndView mnv) throws Exception {
		String url = "message/main";
		List<EmployeeVO> empList = employesService.getEmployeeList();
		
		mnv.addObject("empList", empList);
		mnv.setViewName(url);
		
		return mnv;
	};
	
	//쪽지 메인 받은 쪽지 목록(동기)
	/*@RequestMapping("/main")
	public ModelAndView msgMain(MessageCriteria cri, ModelAndView mnv, HttpSession session) throws Exception {
		String url="message/main";

		List<EmployeeVO> empList = employesService.getEmployeeList();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		cri.setLoginUser(emp.getEmpId()); //session의 로그인 유저를 담아 준다.
		
		List<MessageVO> receivedMsgList = messageService.getReceivedMsgList(cri);
		
		mnv.addObject("receivedMsgList", receivedMsgList);
		mnv.addObject("empList", empList);
		mnv.setViewName(url);
		
		return mnv;
	};*/
	
	
	//쪽지 메인 받은 쪽지 목록(비동기)
	@RequestMapping(value="/getRecMsgMainList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVO> recMsgMain(MessageCriteria cri,  HttpSession session) throws Exception {

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		cri.setLoginUser(emp.getEmpId()); //session의 로그인 유저를 담아 준다.
		
		List<MessageVO> receivedMsgList = messageService.getReceivedMsgList(cri);
		
		return receivedMsgList;
	};
	
	
	//쪽지 메인 보낸 쪽지 목록(비동기)
	@RequestMapping(value="/getSendMsgMainList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVO> sendMsgMain(MessageCriteria cri,  HttpSession session) throws Exception {

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		cri.setLoginUser(emp.getEmpId()); //session의 로그인 유저를 담아 준다.
		
		List<MessageVO> sendMsgList = messageService.getSendMsgList(cri);
		
		return sendMsgList;
	};
	
	
	//쪽지 메인 개인보관함 쪽지 목록(비동기)
	@RequestMapping(value="/getPersonalMsgMainList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVO> personalMsgMain(MessageCriteria cri,  HttpSession session) throws Exception {

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		cri.setLoginUser(emp.getEmpId()); //session의 로그인 유저를 담아 준다.
		
		List<MessageVO> personalMsgList = messageService.getPersonalMsgList(cri);
		
		return personalMsgList;
	};
	
	
	//쪽지 메인 업무보관함 쪽지 목록(비동기)
	@RequestMapping(value="/getWorkMsgMainList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVO> workMsgMain(MessageCriteria cri,  HttpSession session) throws Exception {

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		cri.setLoginUser(emp.getEmpId()); //session의 로그인 유저를 담아 준다.
		
		List<MessageVO> workMsgList = messageService.getWorkMsgList(cri);
		
		return workMsgList;
	};
	
	
	/**
	 * 쪽지함들 목록 
	 * @param criCmd
	 * @param mnv
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public ModelAndView msgList(MessageCriteriaCommand criCmd, ModelAndView mnv, HttpSession session) throws Exception {
		String url = null;
		
		MessageCriteria msgCri = criCmd.toMsgCriteria();
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		List<EmployeeVO> empList = employesService.getEmployeeList();
		
		msgCri.setLoginUser(emp.getEmpId()); //session의 로그인 유저를 담아 준다.
		
		Map<String, Object> dataMap = messageService.getAllMsgList(msgCri);
		
		if(msgCri.getKindOfMsg().equals("recieved")) {
			url = "message/fromList";
		}else if(msgCri.getKindOfMsg().equals("send")){
			url = "message/toList";
		}else if(msgCri.getKindOfMsg().equals("personal")){
			url = "message/personal";
		}else if(msgCri.getKindOfMsg().equals("work")){
			url = "message/work";
		}else if(msgCri.getKindOfMsg().equals("trash")){
			url = "message/trash";
		}
		
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("empList", empList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	//쪽지 상세 보기
	@RequestMapping(value="/detail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> detail(String msgCode) throws Exception {
		
		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> message = new HashMap<String, Object>();
		
		try {
			MessageVO msg = messageService.getMsgByMsgCode(msgCode);
			
			message.put("msg", msg);
			
			result = new ResponseEntity<Map<String, Object>>(message, HttpStatus.OK);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	};
	
	
	//보낸 쪽지함에서 쪽지 상세 보기
		@RequestMapping(value="/toDetail")
		@ResponseBody
		public ResponseEntity<Map<String, Object>> toDetail(String msgCode) throws Exception {
			
			ResponseEntity<Map<String, Object>> result = null;
			Map<String, Object> message = new HashMap<String, Object>();
			
			try {
				MessageVO msg = messageService.getMsgByMsgCode(msgCode);
				
				message.put("msg", msg);
				
				result = new ResponseEntity<Map<String, Object>>(message, HttpStatus.OK);
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			return result;
		};
	
	
	//쪽지 읽음 처리
	@RequestMapping("/read")
	@ResponseBody
	public void updateRead(String msgCode) throws Exception {
		try {
			messageService.updateRead(msgCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	};
	
	
	//쪽지 휴지통 이동
	@RequestMapping("/bin")
	@ResponseBody
	public void updateBin(String msgCode) throws Exception {
		messageService.updateBin(msgCode);
	};
	
	
	//휴지통 이동
	@RequestMapping(value="/chkBoxBin", method = RequestMethod.POST)
	@ResponseBody
	public void updateChkBoxBin(@RequestParam(value="sendArray[]") List<String> msgCode) throws Exception {

		for(int i = 0; i < msgCode.size(); i ++) {
			messageService.updateBin(msgCode.get(i));
		}
	};
	
	
	//쪽지 영구 삭제
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deleteMsg(@RequestParam(value="sendArray[]") List<String> msgCode) throws Exception {
		
		for(int i = 0; i < msgCode.size(); i ++) {
			messageService.removeMsg(msgCode.get(i));
		}
	};
	
	
	//개인보관함 이동
	@RequestMapping(value="/chkBoxPersonal", method = RequestMethod.POST)
	@ResponseBody
	public void updatePersonal(@RequestParam(value="sendArray[]") List<String> msgCode) throws Exception {
		for(int i = 0; i < msgCode.size(); i ++) {
			messageService.updatePersonal(msgCode.get(i));
		}
	};
	
	
	//업무보관함 이동
	@RequestMapping(value="/chkBoxWork", method = RequestMethod.POST)
	@ResponseBody
	public void updateWork(@RequestParam(value="sendArray[]") List<String> msgCode) throws Exception {
		for(int i = 0; i < msgCode.size(); i ++) {
			messageService.updateWork(msgCode.get(i));
		}
	};
	
	
	//받은 쪽지함 이동
	@RequestMapping(value="/chkBoxFrom", method = RequestMethod.POST)
	@ResponseBody
	public void updateFrom(@RequestParam(value="sendArray[]") List<String> msgCode) throws Exception {
		for(int i = 0; i < msgCode.size(); i ++) {
			messageService.updateFrom(msgCode.get(i));
		}
	};
	
	
	//보낸 쪽지함 이동
	@RequestMapping(value="/chkBoxTo", method = RequestMethod.POST)
	@ResponseBody
	public void updateTo(@RequestParam(value="sendArray[]") List<String> msgCode) throws Exception {
		for(int i = 0; i < msgCode.size(); i ++) {
			messageService.updateTo(msgCode.get(i));
		}
	};

	
	@RequestMapping(value="/sendMsg", method=RequestMethod.POST)
	@ResponseBody
	public void sendMsg(MessageVO msg) throws Exception {
			
		String empId = msg.getMsgTo();
		
		EmployeeVO emp = employesService.getEmployee(empId);
		
		msg.setMsgToName(emp.getEmpName());
		msg.setMsgToPosition(emp.getPositionValue());
		msg.setMsgToTeam(emp.getTeamValue());
		
		messageService.sendMsg(msg);
	}

	
	
	@RequestMapping(value="/sendReplyMsg", method=RequestMethod.POST)
	@ResponseBody
	public void sendReplyMsg(MessageVO msg) throws Exception {
		
		String empId = msg.getMsgTo();
	
		EmployeeVO emp = employesService.getEmployee(empId);
		
		msg.setMsgToName(emp.getEmpName());
		msg.setMsgToPosition(emp.getPositionValue());
		msg.setMsgToTeam(emp.getTeamValue());
		
		messageService.sendMsg(msg);
		
	}
	
	@RequestMapping("msgMainCnts")
	@ResponseBody
	public Map<String, Integer> mainCnt(HttpSession session) throws Exception{

		MessageCriteria cri = new MessageCriteria();

		cri.setLoginUser(((EmployeeVO)session.getAttribute("loginUser")).getEmpId());

		Map<String, Integer> cntMap = new HashMap<String, Integer>();

		cntMap = messageService.selectMsgCounts(cri);

		return cntMap;
	}
	
}
