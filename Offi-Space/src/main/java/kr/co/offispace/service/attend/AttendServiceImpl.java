package kr.co.offispace.service.attend;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.co.offispace.command.AttendCommand;
import kr.co.offispace.dao.attach.AttachmentDAO;
import kr.co.offispace.dao.attend.AttendDAO;
import kr.co.offispace.dto.AnnualHistoryVO;
import kr.co.offispace.dto.AnnualOccurVO;
import kr.co.offispace.dto.AnnualVO;
import kr.co.offispace.dto.AttendTypeVO;
import kr.co.offispace.dto.AttendVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.dto.WorkFromHomeAnswerVO;
import kr.co.offispace.dto.WorkFromHomeVO;
import kr.co.offispace.dto.YearVacationVO;
import kr.co.offispace.service.notification.NotificationService;

public class AttendServiceImpl implements AttendService {

	private AttendDAO attendDAO;

	public void setAttendDAO(AttendDAO attendDAO) {
		this.attendDAO = attendDAO;
	}

	private NotificationService notificationService;
	public void setNotificationService (NotificationService notificationService) {
		this.notificationService = notificationService;
	}
	
	private AttachmentDAO attachmentDAO;
	public void setAttachDAO (AttachmentDAO attachmentDAO) {
		this.attachmentDAO = attachmentDAO;
	}
	
	@Override
	public List<Integer> getAttPerStCodeCnt(AttendVO attend) throws SQLException {

		List<Integer> list = new ArrayList<Integer>();

		// 지각
		attend.setAttPerStCode("AP0002");
		int num1 = attendDAO.selectAttPerCodeCntByEmpcode(attend);

		// 조퇴
		attend.setAttPerStCode("AP0003");
		int num2 = attendDAO.selectAttPerCodeCntByEmpcode(attend);

		// 결근
		attend.setAttPerStCode("AP0004");
		int num3 = attendDAO.selectAttPerCodeCntByEmpcode(attend);

		list.add(num1);
		list.add(num2);
		list.add(num3);

		return list;
	}

	@Override
	public void registerAttend(AttendVO attend) throws SQLException {
		attendDAO.insertAttend(attend);
	}

	@Override
	public void registerAttend(AttendCommand attend) throws SQLException {
		attendDAO.insertAttend(attend);
	}

	@Override
	public AttendCommand getAttTimeByEmpCode(String empCode) throws SQLException {
		return attendDAO.selectAttTimeByEmpCode(empCode);
	}

	@Override
	public void modifyAttLeavTimeByAttTime(AttendCommand attend) throws SQLException {
		attendDAO.updateAttLeavTimeByAttTime(attend);
	}

	@Override
	public AttendCommand getAttLeavTimeByEmpCode(String empCode) throws SQLException {
		return attendDAO.selectAttLeavTimeByEmpCode(empCode);
	}

	@Override
	public AttendCommand getAttTime(String empCode) throws SQLException {
		return attendDAO.selectAttTime(empCode);
	}

	@Override
	public void modifyOtherAttTimesByEmpCode(AttendCommand attend) throws SQLException {
		attendDAO.updateOtherAttTimesByEmpCode(attend);
	}

	@Override
	public void modifyAttJobStCodeByEmpCode(AttendVO attend) throws SQLException {
		attendDAO.updateAttJobStCodeByEmpCode(attend);
	}

	@Override
	public List<AttendVO> getAttendPerStCode(AttendVO attend) throws SQLException {

		List<AttendVO> attendList = attendDAO.selectAttendPerStCode(attend);
		for (AttendVO attend2 : attendList) {
			String pst = attend2.getAttPerStCode();
			String name = attend2.getEmpName();
			Date dt = attend2.getAttDt();
			String sdt = dt.toString().substring(8, 10);

//			System.out.println("개인근태상태: " + pst + "/" + "이름:"+ name +  "/" +"팀이름 : " + attend.getTeamValue() + "/" + "사원코드:" + attend.getEmpCode() );
			if(sdt.substring(0,1).equals("0")) 
			{
				String ssdt = sdt.replaceAll("0", "");
				attend2.setDt(ssdt);
			}
			else 
			{
				attend2.setDt(sdt);
			}

		}

		return attendList;
	}
	
	

	@Override
	public void registerLeave(AttendVO attend) throws SQLException {
		attendDAO.updateLeave(attend);
	}

	@Override
	public void registerAttendType(AttendTypeVO attendType) throws SQLException {
		attendDAO.insertAttendType(attendType);
	}

	@Override
	public int checkAttend(AttendVO attend) throws SQLException {
		return attendDAO.selectCountAttend(attend);
	}

	@Override
	public int checkLeave(AttendVO attend) throws SQLException {
		return attendDAO.selectCountAttendLeave(attend);
	}

	@Override
	public AttendVO getAttendForLogin(AttendVO attend) throws SQLException {
		return attendDAO.selectAttendForLogin(attend);
	}

	@Override
	public List<AttendVO> getTodaysTeamMemberAttend(AttendVO attend) throws SQLException {
		return attendDAO.selectTodaysTeamMemberAttend(attend);
	}

	@Override
	public List<AttendVO> getMonthPersonalAttendList(AttendVO attend) throws SQLException {
		return attendDAO.selectMonthPersonalAttendList(attend);
	}

	@Override
	public List<YearVacationVO> getYearVacationListByEmpCode(String empCode) throws SQLException {
		return attendDAO.selectYearVacationListByEmpCode(empCode);
	}

	@Override
	public YearVacationVO getYearVacationByEmpCode(String empCode) throws SQLException {
		return attendDAO.selectYearVacationByEmpCode(empCode);
	}

	@Override
	public AnnualVO getAnnual(AnnualVO annual) throws SQLException {
		return attendDAO.selectAnnual(annual);
	}

	@Override
	public List<AnnualHistoryVO> getAnnualHistoryList(AnnualVO annual) throws SQLException {
		return attendDAO.selectAnnualHistoryList(annual);
	}

	@Override
	public List<AnnualOccurVO> getAnnualOccurList(AnnualVO annual) throws SQLException {
		return attendDAO.selectAnnualOccurList(annual);
	}

	@Override
	public WorkFromHomeVO getWorkFromHomeByEmpCode(WorkFromHomeVO home) throws SQLException {
		return attendDAO.selectWorkFromHomeByEmpCode(home);
	}

	@Override
	public void registerWorkFromHome(WorkFromHomeVO home) throws SQLException {
		attendDAO.insertWorkFromHome(home);
	}

	@Override
	public List<WorkFromHomeVO> getWorkFromHomeByTeamCode(WorkFromHomeVO home) throws SQLException {
		String from = home.getEmpCode();
		
		List<WorkFromHomeVO> list = attendDAO.selectWorkFromHomeByTeamCode(home);
		for (WorkFromHomeVO homeList : list) {
			
			NotificationVO notification = new NotificationVO(homeList.getWfhCode(),from,
					"common/faceRecognitionCheck.do",homeList.getEmpCode(),"재택근무인증 요청이 있습니다.","far fa-bell","재택근무 확인 요청");
//			notification.setNtMsec(15*60*1000);
			notification.setNtMsec(10*1000);
			notification.setNtImportant("Y");
			
			notificationService.registerNotification(notification);
			
			WorkFromHomeAnswerVO homeAnswer = new WorkFromHomeAnswerVO();
			homeAnswer.setEmpCode(homeList.getEmpCode());
			homeAnswer.setObserverCode(from);
			homeAnswer.setEmpName(homeList.getEmpName());
			homeAnswer.setTeamCode(homeList.getTeamCode());
			homeAnswer.setTeamValue(homeList.getTeamValue());
			
			LocalDate ld = LocalDate.now(); // 목적 : 오늘 날짜만 ! 시간은 00:00:00 (출근날짜)
			Date todayOnlyDate = java.sql.Date.valueOf(ld);
			homeAnswer.setWfhaDate(todayOnlyDate);
			
			attendDAO.insertTeamsHomeCheck(homeAnswer);
		}
		
		return list;
	}

	@Override
	public void modifyWorkFromHomeAnswerTime(WorkFromHomeAnswerVO answer) throws SQLException {
		
//		WorkFromHomeAnswerVO homeAnswer = new WorkFromHomeAnswerVO();
//		homeAnswer.setWfhaAnsTime(answer.getWfhaAnsTime());
//		homeAnswer.setEmpCode(answer.getEmpCode());
		
		attendDAO.updateWorkFromHomeAnswerTime(answer);

		
		WorkFromHomeAnswerVO info = attendDAO.selectWorkFromhomeAnswerByAnswerTimeAndEmpCode(answer);
//		info.setWfhaAnsTime(homeAnswer.getWfhaAnsTime());
//		info.setEmpCode(homeAnswer.getEmpCode());
		
//		info.setWfhaAnsTime(answer.getWfhaAnsTime());
//		info.setEmpCode(answer.getEmpCode());
//		System.out.println(info.getAnswerCode()+"코드");
//		System.out.println(info.getObserverCode()+"감시자..");
		
//		System.out.println(answer.getWfhaAnsTime()+"시간좀가져와라");//Thu Feb 10 00:08:24 KST 2022
//		homeAnswer.setAnswerCode(info.getAnswerCode());
//		homeAnswer.setObserverCode(info.getObserverCode());
		
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
		String time = sdf.format(answer.getWfhaAnsTime());
		System.out.println(time + "어떻게오니");

			
		NotificationVO notification = new NotificationVO(info.getAnswerCode(), answer.getEmpCode(),
				"attend/answerPage.do", info.getObserverCode(), time + "에 근무응답확인이 되었습니다.",
				"far fa-bell", "인증확인도착");

		notificationService.registerNotification(notification);
	}

	@Override
	public List<WorkFromHomeAnswerVO> getWorkFromHomeAnswerListByTeamCode(String teamCode) throws SQLException {
		return attendDAO.selectWorkFromHomeAnswerList(teamCode);
	}

	@Override
	public int getWorkFromHomeAnsCntByEmpCode(String empCode) throws SQLException {
		return attendDAO.selectWorkFromHomeAnsCntByEmpCode(empCode);
	}

	@Override
	public WorkFromHomeAnswerVO getWorkFromhomeAnswerByAnswerTimeAndEmpCode(WorkFromHomeAnswerVO answer)
			throws SQLException {
		return attendDAO.selectWorkFromhomeAnswerByAnswerTimeAndEmpCode(answer);
	}

	@Override
	public void registerAnnualHistory(AnnualHistoryVO annual) throws SQLException {
		attendDAO.insertAnnualHistory(annual);
	}

	@Override
	public List<EmployeeVO> getWorkFromHomeEmployeeList(String yearMonth) throws SQLException {
		List<EmployeeVO> list = attendDAO.selectWorkFromHomeEmployeeList(yearMonth);
		for(EmployeeVO employee:list)
		{
			String attachSavename = attachmentDAO.selectSaveNameByEmpCode(employee.getEmpCode());
			employee.setAttachSavename(attachSavename);
		}
		return list;
	}

	@Override
	public List<WorkFromHomeAnswerVO> getWorkFromHomeAnswerList(String yearMonth) throws SQLException {
		List<WorkFromHomeAnswerVO> wfhaList = attendDAO.selectWorkFromHomeAnswerList(yearMonth);
		for (WorkFromHomeAnswerVO wfha: wfhaList) {
			Date dt = wfha.getWfhaDate();
			String sdt = dt.toString().substring(8, 10);
			if(sdt.substring(0,1).equals("0")) 
			{
				String ssdt = sdt.replaceAll("0", "");
				wfha.setDt(ssdt);
			}
			else 
			{
				wfha.setDt(sdt);
			}
		}
		
		return wfhaList;
	}


}
