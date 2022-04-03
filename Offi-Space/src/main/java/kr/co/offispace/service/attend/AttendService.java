package kr.co.offispace.service.attend;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.AttendCommand;
import kr.co.offispace.dto.AnnualHistoryVO;
import kr.co.offispace.dto.AnnualOccurVO;
import kr.co.offispace.dto.AnnualVO;
import kr.co.offispace.dto.AttendTypeVO;
import kr.co.offispace.dto.AttendVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.WorkFromHomeAnswerVO;
import kr.co.offispace.dto.WorkFromHomeVO;
import kr.co.offispace.dto.YearVacationVO;
import oracle.net.ano.AnoComm;

public interface AttendService {

	public List<Integer> getAttPerStCodeCnt(AttendVO attend) throws SQLException;
	
	public void registerAttend(AttendVO attend) throws SQLException;
	public void registerAttend(AttendCommand attend) throws SQLException;
	public void registerLeave(AttendVO attend) throws SQLException;
	
	public AttendCommand getAttTimeByEmpCode(String empCode) throws SQLException;
	
	public void modifyAttLeavTimeByAttTime(AttendCommand attend) throws SQLException;
	
	public AttendCommand getAttLeavTimeByEmpCode(String empCode) throws SQLException;
	
	public AttendCommand getAttTime(String empCode) throws SQLException;
	
	public void modifyOtherAttTimesByEmpCode(AttendCommand attend) throws SQLException;
	
	public void modifyAttJobStCodeByEmpCode(AttendVO attend) throws SQLException;
	
	public List<AttendVO> getAttendPerStCode(AttendVO attend) throws SQLException;
	
	public void registerAttendType(AttendTypeVO attendType) throws SQLException;
	
	public int checkAttend(AttendVO attend) throws SQLException;
	
	public int checkLeave(AttendVO attend) throws SQLException;
	
	public AttendVO getAttendForLogin(AttendVO attend) throws SQLException;
	
	public List<AttendVO> getTodaysTeamMemberAttend(AttendVO attend) throws SQLException;
	
	public List<AttendVO> getMonthPersonalAttendList(AttendVO attend) throws SQLException;
	
	public List<YearVacationVO> getYearVacationListByEmpCode(String empCode) throws SQLException;
	
	public YearVacationVO getYearVacationByEmpCode(String empCode) throws SQLException;
	
	public AnnualVO getAnnual(AnnualVO annual) throws SQLException;

	public List<AnnualHistoryVO> getAnnualHistoryList(AnnualVO annual) throws SQLException;
	
	public List<AnnualOccurVO> getAnnualOccurList(AnnualVO annual) throws SQLException;
	
	public WorkFromHomeVO getWorkFromHomeByEmpCode(WorkFromHomeVO home) throws SQLException;
	
	public void registerWorkFromHome(WorkFromHomeVO home) throws SQLException;
	
	public List<WorkFromHomeVO> getWorkFromHomeByTeamCode(WorkFromHomeVO home) throws SQLException;
	
	public void modifyWorkFromHomeAnswerTime(WorkFromHomeAnswerVO answer) throws SQLException;
	
	public List<WorkFromHomeAnswerVO> getWorkFromHomeAnswerListByTeamCode(String teamCode) throws SQLException;
	
	public int getWorkFromHomeAnsCntByEmpCode(String empCode) throws SQLException;
	
	public WorkFromHomeAnswerVO getWorkFromhomeAnswerByAnswerTimeAndEmpCode(WorkFromHomeAnswerVO answer) throws SQLException;
	
	public void registerAnnualHistory(AnnualHistoryVO annual) throws SQLException;

	/////////////////////////////////////////////
	//재택근무하는 사람만 가져오기
	public List<EmployeeVO> getWorkFromHomeEmployeeList(String yearMonth) throws SQLException;
	
	//재택근무응답리스트 가져오기 (그달의)
	public List<WorkFromHomeAnswerVO> getWorkFromHomeAnswerList(String yearMonth) throws SQLException;
	/////////////////////////////////////////
}
