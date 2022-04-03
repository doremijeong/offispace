package kr.co.offispace.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.AttendCommand;
import kr.co.offispace.dto.AnnualHistoryVO;
import kr.co.offispace.dto.AnnualOccurVO;
import kr.co.offispace.dto.AnnualVO;
import kr.co.offispace.dto.AnswerListVO;
import kr.co.offispace.dto.AttendVO;
import kr.co.offispace.dto.DateData;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.WorkFromHomeAnswerVO;
import kr.co.offispace.dto.WorkFromHomeVO;
import kr.co.offispace.service.attend.AttendService;
import kr.co.offispace.service.employee.EmployeeService;
import oracle.net.aso.a;
import oracle.net.aso.d;
import oracle.net.aso.s;

@Controller
@RequestMapping("/attend")
public class AttendController {
	
	@Autowired
	private AttendService attendService;
	
	@Autowired
	private EmployeeService employeeService;
	
	//재택근무현황페이지
	@RequestMapping("/answerPage")
	public ModelAndView answerPage(ModelAndView mnv, DateData dateData, HttpSession session) throws Exception{
		String url = "attend/answerPage";
		
		//달력시작
		Calendar cal = Calendar.getInstance();
		DateData calendarData;

		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		List<DateData> dateListForColor = new ArrayList<DateData>();
		
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
			dateListForColor.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
			dateListForColor.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		if(dateListForColor.size()%7!=0)
		{
			for (int i=0;i<index;i++) 
			{
				calendarData= new DateData(null, null, null, null);
				dateListForColor.add(calendarData);
			}
		}
		
		//달력 끝
		
		//로그인 유저 관련
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
//		//리스트 가져오기
//		List<WorkFromHomeAnswerVO> answerList = attendService.getWorkFromHomeAnswerList(loginUser.getTeamCode());
//		List<String> empCodeList=new ArrayList<String>();
//		List<EmployeeVO> employeeList=new ArrayList<EmployeeVO>();
//		
//		for(WorkFromHomeAnswerVO answer:answerList)
//		{
//			if(!empCodeList.contains(answer.getEmpCode()))
//			{
//				empCodeList.add(answer.getEmpCode());
//				int answerCnt = attendService.getWorkFromHomeAnsCntByEmpCode(answer.getEmpCode());
//				
//				EmployeeVO employee=new EmployeeVO();
//				employee.setEmpCode(answer.getEmpCode());
//				employee.setEmpName(answer.getEmpName());
//				employee.setEmpPassword(Integer.toString(answerCnt));
//				employeeList.add(employee);
//			}
//		}


		//재택근무자하는 사람 리스트 불러오기.
		String year = Integer.toString(today_info.get("search_year")).substring(2);
		String month = Integer.toString(today_info.get("search_month"));
		if (today_info.get("search_month") < 10) {
			month = "0" + month;
		}
		
		List<EmployeeVO> empList = attendService.getWorkFromHomeEmployeeList(year + "/" + month);
		List<WorkFromHomeAnswerVO> answerList = attendService.getWorkFromHomeAnswerList(year+"/"+month);
		
		Map<String, Map<Date, List<WorkFromHomeAnswerVO>>> all=new HashMap<>();
		
		for(EmployeeVO emp:empList)
		{
			Map<Date, List<WorkFromHomeAnswerVO>> map=new HashMap<Date, List<WorkFromHomeAnswerVO>>();
			
			for(WorkFromHomeAnswerVO answer:answerList)
			{
				if(emp.getEmpCode().equals(answer.getEmpCode()))
				{
					if(map.containsKey(answer.getWfhaDate()))
					{
						List<WorkFromHomeAnswerVO> temp = map.get(answer.getWfhaDate());
						temp.add(answer);
						map.put(answer.getWfhaDate(), temp);
					}
					else
					{
						List<WorkFromHomeAnswerVO> temp= new ArrayList<WorkFromHomeAnswerVO>();
						temp.add(answer);
						map.put(answer.getWfhaDate(), temp);
					}
				}
			}
			all.put(emp.getEmpCode(), map);
		}
		
		Set<String> keys = all.keySet();
		for(String k:keys)
		{
			for(WorkFromHomeAnswerVO answer:answerList)
			{
				if(k.equals(answer.getEmpCode()))
				{
					Map<Date, List<WorkFromHomeAnswerVO>> temp = all.get(k);
					Set<Date> deeps = temp.keySet();
					for(Date d:deeps)
					{
						if(d==answer.getWfhaDate())
						{
							answer.setContext(temp.get(d));
						}
					}
				}
			}
		}
		
		for(WorkFromHomeAnswerVO answer:answerList)
		{
			for(EmployeeVO emp:empList)
			{
				if(emp.getEmpCode().equals(answer.getEmpCode()))
				{
					List<WorkFromHomeAnswerVO> temp = answer.getContext();
					if(temp!=null) {
						answer.setTotal(temp.size());
						int each=0;
						for(WorkFromHomeAnswerVO t:temp)
						{
							if(t.getWfhaAnsTime()!=null) //응답을 했으면
							{
								each+=1;
							}
						}
						answer.setCnt(each);
					}
				}
			}
		}
		
		// 추가 심어주는 부분.
		mnv.addObject("empList", empList);
		mnv.addObject("answerList", answerList);
		mnv.addObject("dateListForColor", dateListForColor);
		
		//배열에 담음
		mnv.addObject("dateList",dateList);
		mnv.addObject("today_info", today_info);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/personalAttend",method=RequestMethod.GET)
	public ModelAndView main(ModelAndView mnv, DateData dateData, HttpSession session) throws Exception	{
		
		String url="attend/personalAttend";
		
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		
		//달력 시작
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		///////////////////////개인 근태 리스트 가져오기
		String year = Integer.toString(today_info.get("search_year")).substring(2);		
		String month = Integer.toString(today_info.get("search_month"));
		if(today_info.get("search_month")<10) {
			month="0"+month;
		}
		
		AttendVO attendPerson=new AttendVO();
		attendPerson.setEmpCode(loginUser.getEmpCode());
		
//		SimpleDateFormat format3=new SimpleDateFormat("yy/MM");
//		attendPerson.setAttDtSt(format3.format(new Date()));
		attendPerson.setAttDtSt(year+"/"+month);
//		System.out.println(year+"/"+month);
		List<AttendVO> personAttendList = attendService.getMonthPersonalAttendList(attendPerson);

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date standard = sdf.parse("2000/01/01 00:00:00");
		Calendar c = Calendar.getInstance();
		c.setTime(standard);
		
		int totalTime=0;
		
		for(AttendVO person:personAttendList)
		{
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			if(person.getAttTime()!=null) person.setAttTimeSt(format.format(person.getAttTime()));
			if(person.getAttLeavTime()!=null) person.setAttLeavTimeSt(format.format(person.getAttLeavTime()));
			if(person.getAttExWorkTime()!=null) person.setAttExWorkTimeSt(format.format(person.getAttExWorkTime()));
			if(person.getAttTotalWorkTime()!=null) person.setAttTotalWorkTimeSt(format.format(person.getAttTotalWorkTime()));
			
			//총시간 구하기 (추가~)
			if(person.getAttTotalWorkTime()!=null)
			{
				String time = format.format(person.getAttTotalWorkTime());
				System.out.println("앙"+time);
				String[] divide = time.split(":");
				
				c.add(Calendar.HOUR, Integer.parseInt(divide[0]));
				c.add(Calendar.MINUTE, Integer.parseInt(divide[1]));
				c.add(Calendar.SECOND, Integer.parseInt(divide[2]));

				//총시간 다시 구함..
				totalTime+=Integer.parseInt(divide[0]);
			}
////			
////			Date sum=new Date(c.getTimeInMillis());
////			
////			long total = (sum.getTime()-standard.getTime());
		}
		System.out.println("흐후ㅡ후후하"+new Date(c.getTimeInMillis()));
		/////////////////////////////////////////////////////////////
		System.out.println(new SimpleDateFormat("yyyy/MM/dd").format(standard));
		System.out.println(new SimpleDateFormat("yyyy/MM/dd").format(new Date(c.getTimeInMillis())));
//		long total = (c.getTimeInMillis()-standard.getTime());
		long total = (new Date(c.getTimeInMillis()).getTime()-standard.getTime());
		System.out.println(new SimpleDateFormat("yyyy/MM/dd").format(new Date(total)));
		System.out.println("하휴"+total/(24*60*60 ));
		for(int i=1;i<today_info.get("start");i++)
		{
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		for (int i=today_info.get("startDay");i<= today_info.get("endDay");i++) 
		{
			if(i==today_info.get("today"))
			{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}
			else
			{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			
			for(AttendVO person:personAttendList)
			{
				SimpleDateFormat format4=new SimpleDateFormat("d");
				if(calendarData.getDate().equals(format4.format(person.getAttDt())))
				{
					calendarData.setAttend(person);
					break;
				}
			}
			
			dateList.add(calendarData);
		}

		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0)
		{
			for (int i=0;i<index;i++) 
			{
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		//달력 끝
		
		
		//개근상 숫자 가져오기
		AttendVO attend=new AttendVO();
		
		attend.setEmpCode(loginUser.getEmpCode());
		attend.setAttDtSt(year+"/"+month);
		List<Integer> perStList = attendService.getAttPerStCodeCnt(attend);
		int late=perStList.get(0);
		int leave=perStList.get(1);
		int absence=perStList.get(2);
		
		//심어주는 부분
		mnv.setViewName(url);
		mnv.addObject("dateList", dateList);
		mnv.addObject("today_info", today_info);
		mnv.addObject("late",late);
		mnv.addObject("leave",leave);
		mnv.addObject("absence",absence);
		mnv.addObject("totalTime",totalTime);
		
		return mnv;
	}
	
//동기에서 비동기로 변경하기위해 주석처리 RestController에 비동기로 했음.
//	@RequestMapping(value="/modify", method=RequestMethod.GET, produces="application/text;charset=utf-8")
//	public String modifyJobStCode(HttpSession session, Model model,String attOption) throws Exception{
//		String url = "redirect:/index.do";
////		String url = "common/indexPage";
//
//		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
//		String empCode = loginUser.getEmpCode();
//		
//		AttendCommand attend = new AttendCommand();
//		attend.setEmpCode(empCode);
//		
//		attend.setAttJobStCode(attOption);
//		
//		System.out.println(attOption + "날라오니");
//		attendService.modifyAttJobStCodeByEmpCode(attend);
//		model.addAttribute("attend",attend);
//		session.setAttribute("attend", attend);
//		
//		return url;
//	}
	
	
	
	
	@RequestMapping("/departmentAttend")
	public ModelAndView departmentAttend(ModelAndView mnv, DateData dateData, HttpSession session) throws Exception {
		String url = "attend/departmentAttend";

		// 달력 시작
		Calendar cal = Calendar.getInstance();
		DateData calendarData;

		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null);
		}

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		List<DateData> dateListForColor = new ArrayList<DateData>();
		
		for(int i=1;i<today_info.get("start");i++)
		{
			calendarData= new DateData(null, null, null, null);
			dateListForColor.add(calendarData);
		}
		
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today");
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
			dateListForColor.add(calendarData);
		}
		
		int index = 7-dateList.size()%7;
		
		if(dateListForColor.size()%7!=0)
		{
			for (int i=0;i<index;i++) 
			{
				calendarData= new DateData(null, null, null, null);
				dateListForColor.add(calendarData);
			}
		}
		// 달력 끝

		//인사팀 리스트 불러오기
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String teamCode=loginUser.getTeamCode();
		List<EmployeeVO> empList = employeeService.getEmployeeListByTeamCode(teamCode);

		//attendList 부르기
		String year = Integer.toString(today_info.get("search_year")).substring(2);		
		String month = Integer.toString(today_info.get("search_month"));
		if(today_info.get("search_month")<10) {
			month="0"+month;
		}
		AttendVO attendPerson=new AttendVO();
		attendPerson.setAttDtSt(year+"/"+month);
		List<AttendVO> attendList = attendService.getAttendPerStCode(attendPerson);
		
		// 심어주는 부분
		mnv.setViewName(url);
		mnv.addObject("dateList", dateList);
		mnv.addObject("today_info", today_info);
		mnv.addObject("empList",empList);
		mnv.addObject("attendList",attendList);
		mnv.addObject("dateListForColor", dateListForColor);
 
		return mnv;
	}	
	
	
	
	
	@RequestMapping("/annual")
	public ModelAndView annual(ModelAndView mnv, DateData dateData, HttpSession session) throws Exception{
		String url = "attend/annual";
		
		//연차내역(해당사원이름가져오기)
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		String empCode = loginUser.getEmpCode();
		
		EmployeeVO emp = employeeService.getEmployeeByEmpCode(empCode);
		
		// 달력 시작
		Calendar cal = Calendar.getInstance();
		DateData calendarData;

		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null);
		}

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today");
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}
		// 달력 끝
		
		//연차 숫자 가져오기 (상단)
		AnnualVO paramAnnual = new AnnualVO();
		paramAnnual.setEmpCode(empCode);
		
		String year = Integer.toString(today_info.get("search_year")).substring(2);
		paramAnnual.setAnnYearSt(year);
		
		AnnualVO annual = attendService.getAnnual(paramAnnual);
		
		//연차 사용내역 가져오기 (중단)
		List<AnnualHistoryVO> annualHistory = attendService.getAnnualHistoryList(paramAnnual);
		
		//연차 발생내역 가져오기 (하단)
		List<AnnualOccurVO> annualOccur = attendService.getAnnualOccurList(paramAnnual);
		
		mnv.setViewName(url);
		mnv.addObject("today_info", today_info);
		mnv.addObject("emp",emp);
		mnv.addObject("annual",annual);
		mnv.addObject("annualHistory",annualHistory);
		mnv.addObject("annualOccur",annualOccur);
		//mnv.addObject("yearVacationList",yearVacationList);
		//mnv.addObject("yearVacation",yearVacation);
		
		
		return mnv;
	}
	
	
/*	근태타입설정
 * @RequestMapping("/attendSet")
	public String attendSet()throws Exception{
		String url = "attend/attendTypeSetting";
		
		return url;
	}
	@RequestMapping("/attTypeRegister")
	public String attTypeRegister(AttendCommand attendReq, RedirectAttributes rttr)throws Exception{
		String url = "redirect:/attend/departmentAttend";
		
		AttendTypeVO attendType = attendReq.toAttendTypeVO();

		attendService.registerAttendType(attendType);
		
		rttr.addFlashAttribute("from","register");
		
		return url;
	}
*/	
	
	
	@RequestMapping("/workFromHomeTeams")
	public ModelAndView teams(ModelAndView mnv, HttpSession session, WorkFromHomeVO home) throws Exception{
		String url = "attend/faceRecognitionForm";
		
		List<WorkFromHomeVO> list = attendService.getWorkFromHomeByTeamCode(home);
		
		mnv.addObject(list);
		mnv.setViewName(url);
		
		return mnv;
	}
		
	
	//달력 메소드 (참고용)
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "attend/calendar";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	안뇽하세요 저는 노프론트 입니다. 혹시 충돌 날 수도 있으니 이곳에서 안면인식을 시도해보고자합니다. 나중에 편집겠습니다 ! 
	@RequestMapping(value = "/faceRecognitionForm", method = RequestMethod.GET)
	public String faceRecognitionForm(){
		String url = "attend/faceRecognitionForm";
		return url;
	}
	
	
	
	
}
