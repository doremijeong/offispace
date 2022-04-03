package kr.co.offispace.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.Sha2Crypt;
import org.apache.tomcat.util.bcel.classfile.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.ApprovalCriteria;
import kr.co.offispace.command.ApprovalCriteriaCommand;
import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.JobKeywordSearchCriteria;
import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.command.ReportCriteria;
import kr.co.offispace.command.ReportCriteriaCommand;
import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.dto.ApprovalLineVO;
import kr.co.offispace.dto.ApprovalVO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.AttendVO;
import kr.co.offispace.dto.CommonCodeVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.IPVO;
import kr.co.offispace.dto.JobVO;
import kr.co.offispace.dto.MailVO;
import kr.co.offispace.dto.MenuVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.dto.RegularReportStakeholersDTO;
import kr.co.offispace.dto.SchedulerVO;
import kr.co.offispace.dto.WorkFromHomeVO;
import kr.co.offispace.service.approval.ApprovalService;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.attend.AttendService;
import kr.co.offispace.service.commonCode.CommonCodeService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.ip.IPService;
import kr.co.offispace.service.job.JobService;
import kr.co.offispace.service.mail.MailService;
import kr.co.offispace.service.menu.MenuService;
import kr.co.offispace.service.notice.NoticeService;
import kr.co.offispace.service.notice.TeamNoticeService;
import kr.co.offispace.service.notification.NotificationService;
import kr.co.offispace.service.report.ReportService;
import kr.co.offispace.service.scheduler.SchedulerSerivce;
import oracle.security.o3logon.a;


@Controller
public class CommonController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private AttachmentService attachmentService;

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private IPService IPService;

	@Autowired
	private AttendService attendService;

	@Autowired
	private ApprovalService approvalService;

	@Autowired
	private JobService jobService;

	@Autowired
	private ReportService reportService;

	@Autowired
	private MailService mailService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private TeamNoticeService teamNoticeService;
	
	@Autowired
	private SchedulerSerivce schedulerService;

	@RequestMapping("/index")
	public String index(@RequestParam(defaultValue="M000000")String mCode,Model model,HttpSession session,HttpServletRequest request) throws Exception
	{
		String url="common/indexPage";

		//로그인 세션 관련
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		AttachmentVO attachment = attachmentService.getAttachmentByAttachGroup(loginUser.getEmpCode());
				
		//메뉴 관련
		List<MenuVO> allMenuList = menuService.getAllMenuList();
		List<MenuVO> mainMenuList = menuService.getMainMenuList();
		MenuVO menu = menuService.getMenuByMcode(mCode); //window.onload를 위한 menu.

		//메뉴 권한 추가
		if(loginUser.getChargeCode().equals("R101"))
		{
			//사원이 못보는 리스트 추가. (관리자만 접근 가능한 탭)
			List<String> constraints = new ArrayList<String>();
			constraints.add("부서 근태 조회");
			constraints.add("재택 근무 현황");
			constraints.add("보고 관리");
			constraints.add("업무 관리");
			
			Iterator<MenuVO> all = allMenuList.iterator();
			while(all.hasNext())
			{
				MenuVO item = all.next();
				for(String con:constraints)
				{
					if(item.getMname().equals(con))
					{
						all.remove();
					}
				}
			}
			
			Iterator<MenuVO> main = mainMenuList.iterator();
			while(main.hasNext())
			{
				MenuVO item = main.next();
				for(String con:constraints)
				{
					if(item.getMname().equals(con))
					{
						main.remove();
					}
				}
			}
		}
				
		model.addAttribute("allMenuList",allMenuList);
		model.addAttribute("mainMenuList",mainMenuList);
		model.addAttribute("menu",menu);
		
		//아이피 확인
		System.out.println(request.getRemoteAddr()+"당신의 아이피 입니다.");
		System.out.println(request.getHeader("X-Forwarded-For")+"우와");


		if(attachment!=null && attachment.getAttachSavename()!=null)
		{
			model.addAttribute("attachment",attachment);
		}
		model.addAttribute("loginUser",loginUser);

		//알림 목록 가져오기
		Map<String,String> searchTypeEmpCode = new HashMap<String, String>();
		searchTypeEmpCode.put("searchType", "headerNotificationList");
		searchTypeEmpCode.put("empCode", loginUser.getEmpCode());

		List<NotificationVO> notificationList = notificationService.getNotificationList(searchTypeEmpCode);
		model.addAttribute("notificationList",notificationList);

		//경과 시간 가져오기
		if(session.getAttribute("attend")!=null) //출근한 상태라면
		{
			AttendVO attend = (AttendVO)session.getAttribute("attend");
			Date today = new Date();

			long elapsedTime = (today.getTime()-attend.getAttTime().getTime())/1000;
			model.addAttribute("elapsedTime",elapsedTime);

			//여기선 좀 오버..스펙
			Date temp = new Date(elapsedTime*1000);
			Calendar cc = Calendar.getInstance();
			cc.setTime(temp);
			cc.add(Calendar.HOUR, -9);
			if(elapsedTime>0) cc.add(Calendar.SECOND, -1);
			Date tempTime = new Date(cc.getTimeInMillis());
			SimpleDateFormat format2 = new SimpleDateFormat("HH:mm:ss");
			String temporaryTime = format2.format(tempTime);

			model.addAttribute("temporaryTime",temporaryTime);
		}

		//출근인지 퇴근인지 상태 체크.
		AttendVO attend = new AttendVO();
		attend.setEmpCode(loginUser.getEmpCode());
		LocalDate ld = LocalDate.now(); // 목적 : 오늘 날짜만 ! 시간은 00:00:00 (출근날짜)
		Date todayOnlyDate = java.sql.Date.valueOf(ld);
		attend.setAttDt(todayOnlyDate);

		int cka = attendService.checkAttend(attend);
		int ckb = attendService.checkLeave(attend);
		if (cka != 0) {
			model.addAttribute("checkAttend", "Y");
		} else {
			model.addAttribute("checkAttend", "N");
		}
		if (ckb != 0) {
			model.addAttribute("checkLeave", "Y");
		} else {
			model.addAttribute("checkLeave", "N");
		}

		//부서원 근무 현황
		List<EmployeeVO> employeeList = employeeService.getEmployeeListByTeamCode(loginUser.getTeamCode());
		for(int i=0;i<employeeList.size();i++)
		{
			if(employeeList.get(i).getEmpCode().equals(loginUser.getEmpCode()))
			{
				employeeList.remove(i);
				break;
			}
		}

		AttendVO attendTeam = new AttendVO();
		attendTeam.setTeamValue(loginUser.getTeamValue());
		attendTeam.setAttDt(todayOnlyDate);

		List<AttendVO> teamAttend = attendService.getTodaysTeamMemberAttend(attendTeam);

		for(EmployeeVO employee:employeeList)
		{
			boolean flag=false;
			for(AttendVO team:teamAttend)
			{
				if(employee.getEmpCode().equals(team.getEmpCode()))
				{
					flag=true;
				}
			}
			if(!flag) //출근을 안했다면
			{
				AttendVO newAttend=new AttendVO();
				newAttend.setEmpCode(employee.getEmpCode());
				newAttend.setEmpName(employee.getEmpName());
				newAttend.setTeamValue(employee.getTeamValue());
				teamAttend.add(newAttend);
			}
		}

		model.addAttribute("teamAttend",teamAttend);
		model.addAttribute("employeeList",employeeList);

		List<EmployeeVO> empList = employeeService.getEmployeeList();
		model.addAttribute("empList", empList);

		return url;
	}

	@ResponseBody
	@RequestMapping(value="/common/IPCheck",method=RequestMethod.GET,produces="application/text;charset=utf-8")
	public ResponseEntity<String> IPCheck(HttpSession session,HttpServletRequest request,String from) throws Exception
	{
		ResponseEntity<String> result=null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		//IP 체크 전 먼저 오늘날짜로 출근이 되었는지 확인.
		AttendVO attend=new AttendVO();
		attend.setEmpCode(loginUser.getEmpCode());
		LocalDate ld = LocalDate.now(); // 목적 : 오늘 날짜만 ! 시간은 00:00:00 (출근날짜)
		Date todayOnlyDate = java.sql.Date.valueOf(ld);
		attend.setAttDt(todayOnlyDate);

		if(from.equals("A")) //출근 체크
		{
			int ck = attendService.checkAttend(attend);
			if(ck!=0)
			{
				result=new ResponseEntity<String>("이미 출근을 완료하였습니다.",HttpStatus.INTERNAL_SERVER_ERROR);
				return result;
			}
		}
		else if(from.equals("B")) //퇴근 체크
		{
			int ck = attendService.checkLeave(attend);
			if(ck!=0)
			{
				result=new ResponseEntity<String>("이미 퇴근을 완료하였습니다.",HttpStatus.INTERNAL_SERVER_ERROR);
				return result;
			}
		}

		//IP확인 시작.
		String IPAddr=request.getRemoteAddr();

		IPVO IP=new IPVO();
		IP.setEmpCode(loginUser.getEmpCode());
		IP.setIPAddr(IPAddr);
		IP.setIPAvailable("Y"); //사용가능하다는 전재니까 하드코딩 가능.

		boolean flag = IPService.IPCheck(IP);

		if(flag) //ip 일치
		{
			if(from.equals("A")) //출근
			{
				result=new ResponseEntity<String>("출근하기에 성공하였습니다.",HttpStatus.OK);
			}
			else //퇴근
			{
				result=new ResponseEntity<String>("퇴근하기에 성공하였습니다.",HttpStatus.OK);
			}
		}
		else //ip 불일치
		{
			if(from.equals("A")) //출근
			{
				result=new ResponseEntity<String>("출근하기에 실패하였습니다.\n아이피 주소를 확인해 주세요.",HttpStatus.INTERNAL_SERVER_ERROR);
			}
			else //퇴근
			{
				result=new ResponseEntity<String>("퇴근하기에 실패하였습니다.\n아이피 주소를 확인해 주세요.",HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}


		return result;
	}


	//재택근무자 체크
	@ResponseBody
	@RequestMapping(value="/common/homeCheck",method=RequestMethod.GET,produces="application/text;charset=utf-8")
	public ResponseEntity<String> homeCheck(HttpSession session,HttpServletRequest request,String from) throws Exception{

		ResponseEntity<String> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");


		//재택근무자인지확인시작..
		WorkFromHomeVO home = new WorkFromHomeVO();
		home.setEmpCode(loginUser.getEmpCode());

		DateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Date nowDate = new Date();
		String attDtSt = sdf.format(nowDate);
		home.setAttDtSt(attDtSt);

		WorkFromHomeVO workFromHome = attendService.getWorkFromHomeByEmpCode(home);

		if (workFromHome != null) { //재택근무자이면,
				result = new ResponseEntity<String>("얼굴인식", HttpStatus.OK);
		} else { //재택근무자가 아닐때
				result = new ResponseEntity<String>("IP체크", HttpStatus.OK);
		}

		return result;
	}
	//재택근무자안면인식폼
	@RequestMapping("/common/faceRecognition")
	public String faceRecognition(HttpSession session, Model model,String from) throws Exception{
		String url = "attend/faceRecognitionForm";

		model.addAttribute("from",from);

		return url;
	}


	//재택근무자안면인식응답
	@RequestMapping("/common/faceRecognitionCheck")
	public String teamsHomeCheckFaceRecognition(HttpSession session, Model model,String from) throws Exception{
		String url = "attend/faceRecognitionCheck";

		return url;
	}



	/* 여기서부터 로그인꺼 */
	//로그인 폼
	@RequestMapping(value="/common/loginForm",method=RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="") String error, HttpServletResponse response)
	{
		String url="common/login";

		return url;
	}

	@RequestMapping(value="/common/initLogin",method=RequestMethod.GET)
	public ModelAndView initLogin(String empCode, ModelAndView mnv)
	{
		String url="common/initLogin";

		mnv.addObject("empCode", empCode);
		mnv.setViewName(url);

		return mnv;
	}


	@RequestMapping("/common/initloginGo")
	public String registerEmployee( EmployeeVO vo,
									HttpSession session,
									HttpServletRequest requset) throws Exception {

		String url = "/common/initlogin_success";

		/*비밀번호 암호화*/
		//String pwd = vo.getEmpPassword();
		//String encriptedPassword = Sha2Crypt.sha256Crypt(pwd.getBytes(), "$5$" + vo.getEmpCode());
		//String encodedpwd = encriptedPassword.substring(encriptedPassword.lastIndexOf("$"));
		//vo.setEmpPassword(encodedpwd);

		employeeService.setEmployeeFirstInformation(vo);
		return url;

	}

	@ResponseBody
	@RequestMapping(value="/common/employeeCheck",method=RequestMethod.POST)
	public String employeeCheck(String empId) throws Exception {

		String getId = employeeService.getEmpIdById(empId);

		if(getId != null) {
			return "fail"; //중복아이디가 존재
		}else {
			return "success"; //중복아이디 없음
		}

	}

	@RequestMapping("/security/accessDenied")
	public void accessDenied() {}


	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model) throws Exception{
		String url = "security/sessionOut";
		
		model.addAttribute("message", "세션이 만료되었습니다.\\n다시 로그인 하세요!!");
		return url;

	}

	@RequestMapping("/common/loginExpired")
	public String loginExpired(Model model) throws Exception{
		String url = "security/sessionOut";

		model.addAttribute("message", "중복 로그인이 확인되었습니다.\\n"
										+"다시 로그인하면 다른 장치에서 로그인은 취소됩니다.");
		return url;

	}

	/* 여기까지 로그인꺼 */


	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String main(Model model,HttpSession session,@RequestParam(defaultValue="C") String from, ApprovalCriteriaCommand apvCriCmd, ReportCriteriaCommand reportCriCmd) throws Exception	{

		String url="common/main";

		//로그인 세션관련
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String empCode = loginUser.getEmpCode();

		//아이프레임 리로드시 문제발생해결
		AttendVO imsi = new AttendVO();
		imsi.setEmpCode(empCode);
		LocalDate imsiLd = LocalDate.now(); //목적 : 오늘 날짜만 ! 시간은 00:00:00 (출근날짜)
	    Date imsiDate = java.sql.Date.valueOf(imsiLd);
		imsi.setAttDt(imsiDate);
		
		AttendVO checking = attendService.getAttendForLogin(imsi);
		Date chool=null;
		Date tae=null;
		if(checking!=null)
		{
			if(checking.getAttTime()!=null) chool=checking.getAttTime();
			if(checking.getAttLeavTime()!=null) tae=checking.getAttLeavTime();
		}
		//처음이면 -> 없으면 -> 걍 C
		//출근 -> 없으면 -> 출근
		//퇴근 -> 있어야하지 -> 퇴근
		//있으면 -> 걍 C
		
		//출퇴근과 관련되었다면
		if(!from.equals("C"))
		{
			if(from.equals("A") && chool==null) //출근관련
			{
				AttendVO attend=new AttendVO();

				//초기에 필요한 데이터 세팅 (받는건 아무것도 없으니까)
				attend.setEmpCode(empCode);
				attend.setEmpName(loginUser.getEmpName());
				attend.setTeamValue(loginUser.getTeamValue());

		        LocalDate ld = LocalDate.now(); //목적 : 오늘 날짜만 ! 시간은 00:00:00 (출근날짜)
		        Date todayOnlyDate = java.sql.Date.valueOf(ld);
				attend.setAttDt(todayOnlyDate);

				Date today=new Date(); //목적 : 오늘 날짜와 시간 (출근시간)
				attend.setAttTime(today);

				attendService.registerAttend(attend);

				//string값 세팅
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

				attend.setAttDtSt(format1.format(todayOnlyDate));
				attend.setAttTimeSt(format1.format(today));


				//세션에 출근 객체 저장(최초)
				session.setAttribute("attend",attend);

				model.addAttribute("alert","출근 성공하였습니다.");
			}
			else if(from.equals("B") && tae==null) //퇴근관련
			{
				AttendVO attend = (AttendVO)session.getAttribute("attend");

				Date today=new Date(); //목적 : 오늘 날짜와 시간 (퇴근시간)
				attend.setAttLeavTime(today);

				//근무시간. (연장시간은 일단x) . 총근무시간 세팅...
				long total = (today.getTime()-attend.getAttTime().getTime())/1000;
				long hour=total/(60*60);
				long minute=(total-hour*60*60)/60;
				long second=(total-hour*60*60-minute*60);

				SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy/MM/dd");
				Date only = format1.parse(format2.format(today)+" 00:00:00");

				Calendar cc = Calendar.getInstance();
				cc.setTime(only);
				cc.add(Calendar.HOUR, (int)hour);
				cc.add(Calendar.MINUTE, (int)minute);
				cc.add(Calendar.SECOND, (int)second);

				Date result = new Date(cc.getTimeInMillis());

				attend.setAttRealWorkTime(result);
				attend.setAttTotalWorkTime(result);
				//////////////////////////////////////
				//퇴근 완료했다면 (정상,지각,조퇴,결근)을 판단. -> 근데 한꺼번에 해도 되겠다.
				String ggs="AP0001"; //개근상 개인근태상태

				Date start = format1.parse(format2.format(today)+" 09:00:01"); //이시간 전 이면 출근 ㅇㅋ
				Date end = format1.parse(format2.format(today)+" 17:59:59"); //이시간 이후 면 퇴근 ㅇㅋ

				if(attend.getAttTime().after(start)) //지각 (늦게 출근)
				{
					ggs="AP0002";
				}
				if(attend.getAttLeavTime().before(end)) //조퇴 (일찍 퇴근)
				{
					ggs="AP0003";
				}
				attend.setAttPerStCode(ggs);
				///////////////////////////////////
				attendService.registerLeave(attend);


				//string값 세팅
				attend.setAttLeavTimeSt(format1.format(today));
				attend.setAttRealWorkTimeSt(format1.format(result));
				attend.setAttTotalWorkTimeSt(format1.format(result));

				// 퇴근시간 세션에 저장
				session.setAttribute("attend", attend);

				model.addAttribute("alert","퇴근 성공하였습니다.");

			}
		}

		//회원 사진 관련
		AttachmentVO attachment = attachmentService.getAttachmentByAttachGroup(empCode);

		if(attachment!=null && attachment.getAttachSavename()!=null) //어드바이스가 있어서 안해줘도 되지만, 매번 콘솔창에 오류 뜨는걸 일단 방지하기 위해서.
		{
			model.addAttribute("attachment",attachment);
		}
		model.addAttribute("loginUser",loginUser);

		//경과 시간 가져오기
		if(session.getAttribute("attend")!=null) //출근한 상태라면
		{
			AttendVO attend = (AttendVO)session.getAttribute("attend");
			Date today = new Date();

			long elapsedTime = (today.getTime()-attend.getAttTime().getTime())/1000;
			model.addAttribute("elapsedTime",elapsedTime);

			//여기선 좀 오버..스펙
			Date temp = new Date(elapsedTime*1000);
			Calendar cc = Calendar.getInstance();
			cc.setTime(temp);
			cc.add(Calendar.HOUR, -9);
			if(elapsedTime>0) cc.add(Calendar.SECOND, -1);
			Date tempTime = new Date(cc.getTimeInMillis());
			SimpleDateFormat format2 = new SimpleDateFormat("HH:mm:ss");
			String temporaryTime = format2.format(tempTime);

			model.addAttribute("temporaryTime",temporaryTime);
		}

		//출근인지 퇴근인지 상태 체크.
		AttendVO attend = new AttendVO();
		attend.setEmpCode(loginUser.getEmpCode());
		LocalDate ld = LocalDate.now(); // 목적 : 오늘 날짜만 ! 시간은 00:00:00 (출근날짜)
		Date todayOnlyDate = java.sql.Date.valueOf(ld);
		attend.setAttDt(todayOnlyDate);

		int cka = attendService.checkAttend(attend);
		int ckb = attendService.checkLeave(attend);
		if (cka != 0)
		{
			model.addAttribute("checkAttend","Y");
		}
		else
		{
			model.addAttribute("checkAttend","N");
		}
		if(ckb != 0)
		{
			model.addAttribute("checkLeave","Y");
		}
		else
		{
			model.addAttribute("checkLeave","N");
		}



		//부서원 근무 현황
		List<EmployeeVO> employeeList = employeeService.getEmployeeListByTeamCode(loginUser.getTeamCode());
		for(int i=0;i<employeeList.size();i++)
		{
			if(employeeList.get(i).getEmpCode().equals(loginUser.getEmpCode()))
			{
				employeeList.remove(i);
				break;
			}
		}
		
		//부서원 사진 관련
		for (EmployeeVO employee : employeeList) 
		{
			AttachmentVO temp = attachmentService.getAttachmentByAttachGroup(employee.getEmpCode());
			if(temp!=null) employee.setAttachSavename(temp.getAttachSavename());
			if(temp!=null) System.out.println(temp.getAttachSavename());
		}

		AttendVO attendTeam = new AttendVO();
		attendTeam.setTeamValue(loginUser.getTeamValue());
		attendTeam.setAttDt(todayOnlyDate);

		List<AttendVO> teamAttend = attendService.getTodaysTeamMemberAttend(attendTeam);

		for (EmployeeVO employee : employeeList) {
			boolean flag = false;
			for (AttendVO team : teamAttend) {
				if (employee.getEmpCode().equals(team.getEmpCode())) {
					flag = true;
				}
			}
			if (!flag) // 출근을 안했다면
			{
				AttendVO newAttend = new AttendVO();
				newAttend.setEmpCode(employee.getEmpCode());
				newAttend.setEmpName(employee.getEmpName());
				newAttend.setTeamValue(employee.getTeamValue());
				teamAttend.add(newAttend);
			}
		}
		model.addAttribute("teamAttend", teamAttend);
		model.addAttribute("employeeList", employeeList);


		//메인페이지 전자결재 리스트
		List<ApprovalVO> list = approvalService.getListForMain(loginUser.getEmpCode());

		List<ApprovalVO> realList = new ArrayList<>();

		for (ApprovalVO approvalVO : list) {
			ApprovalVO apv = approvalService.getApprovalByApvCode(approvalVO.getApvCode());
			if(apv.getNowEmp().getEmpCode().equals(loginUser.getEmpCode())) {
				realList.add(apv);
			}
			for(ApprovalLineVO apvLine : apv.getApvLineList()) {
				if(apvLine.getApvKindCode().equals("AK0002") && apvLine.getEmpCode().equals(loginUser.getEmpCode())) {
					realList.add(apv);
				}
			}
		}

		//apvRequestList(기안)
		ApprovalCriteria apvCri = apvCriCmd.toCriteria();
		apvCri.setLoginEmpCode(loginUser.getEmpCode());
		Map<String, Object> apvDataMap = approvalService.getRequestApvList(apvCri);
		//System.out.println("기안 아무것도 못가져오니..?" + apvDataMap);



		//카운트 가져오기
    	Map<String, Integer> apvCount = approvalService.getApvCount(loginUser.getEmpCode());

		model.addAttribute("apvCount", apvCount);
		model.addAttribute("apvList",realList);
		model.addAttribute("apvDataMap",apvDataMap);




		//업무 목록
	   	Map<String,Object> jobDataMap = new HashMap<>();
	   	JobKeywordSearchCriteria jobCri = new JobKeywordSearchCriteria();

	   	//수신업무 + 완료된 업무는 제외
    	jobCri.setNotDone("Y");
    	jobCri.setLoginEmpCode(loginUser.getEmpCode());
    	jobCri.setSearchType("received");
    	jobDataMap = jobService.getSortedJobList(jobCri);
    	List<JobVO> receivedJobList = (List<JobVO>) jobDataMap.get("sortedJobList");
    	List<JobVO> receivedIssueList = jobService.getSortedJobListForIssue(jobCri);

    	//업무리스트를 순서대로 합치기
    	List<JobVO>receivedAllList = new ArrayList<JobVO>();
    	for(int i = 0; i<(receivedIssueList.size()+receivedJobList.size()); i++) {
    		if(i<receivedIssueList.size()) {
    			receivedAllList.add(i, receivedIssueList.get(i));
    		}else {
    			receivedAllList.add(i, receivedJobList.get((i-receivedIssueList.size())));
    		}
    	}
    	//요청업무 + 완료업무 포함
    	jobCri.setNotDone("N");
    	jobCri.setSearchType("requested");
    	jobDataMap = jobService.getSortedJobList(jobCri);
    	List<JobVO> requestedJobList = (List<JobVO>) jobDataMap.get("sortedJobList");
    	List<JobVO> requestedIssueList = jobService.getSortedJobListForIssue(jobCri);
    	//업무리스트를 순서대로 합치기
    	List<JobVO> requestedAllList = new ArrayList<JobVO>();
    	for(int i = 0; i<(requestedIssueList.size()+requestedJobList.size()); i++) {
    		if(i<requestedIssueList.size()) {
    			requestedAllList.add(i, requestedIssueList.get(i));
    		}else {
    			requestedAllList.add(i, requestedJobList.get((i-requestedIssueList.size())));
    		}
    	}

    	model.addAttribute("receivedAllList",receivedAllList);
    	model.addAttribute("requestedAllList",requestedAllList);


    	// 최근 생성된 보고서
    	//정기보고서
    	List<RegularReportStakeholersDTO> regularReportListToWrite = reportService.getRegularReportListToWrite(loginUser.getEmpCode());


		ReportCriteria reportCri = reportCriCmd.toCriteria();

		reportCri.setLoginEmpCode(loginUser.getEmpCode());
		reportCri.setTeamCode(loginUser.getTeamCode());

		Map<String, Object> dataMap = reportService.getReportDocListByTeamCode(reportCri);

		model.addAttribute("regularReportListToWrite",regularReportListToWrite);
		model.addAttribute("dataMap",dataMap);

		// 안읽은 메일 리스트 가져오기

    	MailCriteria mailCri = new MailCriteria();
    	mailCri.setPerPageNum(10);
    	mailCri.setLoginUser(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());

    	List<MailVO> mailList = mailService.getNotReadMailListForMain(mailCri);

    	model.addAttribute("mailList", mailList);

    	// 공지 리스트 가져오기
    	Criteria noticeCri = new Criteria();
    	noticeCri.setPerPageNum(20);
    	Map<String, Object> noticeMap = noticeService.getNoticeImptList(noticeCri);
    	model.addAttribute("noticeMap", noticeMap);

    	TeamNoticeCriteria teamCri = new TeamNoticeCriteria();
    	teamCri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());
    	teamCri.setTeamCode(((EmployeeVO)session.getAttribute("loginUser")).getTeamCode());
    	Map<String, Object> teamNoticeMap = teamNoticeService.getTeamNoticeImptList(teamCri);
    	model.addAttribute("teamNoticeMap", teamNoticeMap);
    	
    	// 일정 리스트 가져오기
        List<SchedulerVO> schedulerList = schedulerService.getPersonalSchedulerList(loginUser.getEmpCode());
        model.addAttribute("schedulerList",schedulerList);

		return url;
	}

	@Autowired
	private CommonCodeService commonCodeService;

	@RequestMapping(value="/common/getCommonCodeList/{searchType}/{keyword}",method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<CommonCodeVO>> getCommonCodeList(@PathVariable("searchType")String searchType,
																@PathVariable("keyword")String keyword) throws SQLException{
		ResponseEntity<List<CommonCodeVO>> entity = null;


		Criteria cri = new Criteria();
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);

		List<CommonCodeVO> commonCodeList = commonCodeService.getCommonCodeList(cri);

		entity = new ResponseEntity<List<CommonCodeVO>>(commonCodeList,HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/common/testtt")
	private void testtt() throws Exception	{}

//
//	@RequestMapping(value="/common/login",method=RequestMethod.POST)
//	public String login(String id, String pwd, HttpSession session, RedirectAttributes rttr, Model model) throws Exception{
//
//		String url = "redirect:/index.do";
//
//		try {
//			memberService.login(id, pwd);
//
//			session.setAttribute("loginUser", memberService.getMember(id));
//
//		} catch (NotFoundIDException | InvalidPasswordException e) {
//			rttr.addFlashAttribute("message",e.getMessage());
//			url="redirect:/common/loginForm.do";
//
//
//		} catch(SQLException e) {
//			e.printStackTrace();
//			throw e;
//		}
//		return url;
//
//	}



}
