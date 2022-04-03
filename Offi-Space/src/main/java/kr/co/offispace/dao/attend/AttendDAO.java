package kr.co.offispace.dao.attend;

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

public interface AttendDAO {

	//개인근태상태값 별 갯수 조회(지각,조퇴,결근)
	public int selectAttPerCodeCntByEmpcode(AttendVO attendance) throws SQLException;
	
	//출근하기버튼 클릭시 IP확인 후 근태정보 등록
	public void insertAttend(AttendVO attend) throws SQLException;
	public void insertAttend(AttendCommand attend) throws SQLException;
	
	//출근시간가져오기
	public AttendCommand selectAttTimeByEmpCode(String empCode) throws SQLException;
	
	//퇴근하기버튼 클릭시 IP확인 후 퇴근시간으로 update
	public void updateAttLeavTimeByAttTime(AttendCommand attend) throws SQLException;
	public void updateLeave(AttendVO attend) throws SQLException;
	
	//퇴근시간 가져오기
	public AttendCommand selectAttLeavTimeByEmpCode(String empCode) throws SQLException;
	
	//출퇴근시간 가져오기
	public AttendCommand selectAttTime(String empCode) throws SQLException;
	
	//총근무시간, 초과시간, 실제근무시간 
	public void updateOtherAttTimesByEmpCode(AttendCommand attend) throws SQLException;
	
	//업무상태 변경
	public void updateAttJobStCodeByEmpCode(AttendVO attend) throws SQLException;
	
	//부서근태 개인근태상태 가져오기
	List<AttendVO> selectAttendPerStCode(AttendVO attend)throws SQLException;
	
	public void insertAttendType(AttendTypeVO attendType) throws SQLException;
	
	public int selectCountAttend(AttendVO attend) throws SQLException;
	
	public int selectCountAttendLeave(AttendVO attend) throws SQLException;
	
	public AttendVO selectAttendForLogin(AttendVO attend) throws SQLException;
	
	public List<AttendVO> selectTodaysTeamMemberAttend(AttendVO attend) throws SQLException;
	
	public List<AttendVO> selectMonthPersonalAttendList(AttendVO attend) throws SQLException;
	
	//연차내역리스트
	public List<YearVacationVO> selectYearVacationListByEmpCode(String empCode) throws SQLException;
	
	//연차내역 갯수 가져오기
	public YearVacationVO selectYearVacationByEmpCode(String empCode) throws SQLException;
	
	//연차 숫자 가져오기 (상단)
	public AnnualVO selectAnnual(AnnualVO annual) throws SQLException;
	
	//연차 사용내역 가져오기 (중단)
	public List<AnnualHistoryVO> selectAnnualHistoryList(AnnualVO annual) throws SQLException;
	
	//연차 발생내역 가져오기 (하단)
	public List<AnnualOccurVO> selectAnnualOccurList(AnnualVO annual) throws SQLException;
	
	//재택근무 신청사원 체크하기
	public WorkFromHomeVO selectWorkFromHomeByEmpCode(WorkFromHomeVO home) throws SQLException;
	
	//재택근무신청서
	public void insertWorkFromHome(WorkFromHomeVO home) throws SQLException;
	
	//재택근무인 부서원 리스트(불시에 재태근무확인)
	public List<WorkFromHomeVO> selectWorkFromHomeByTeamCode(WorkFromHomeVO home) throws SQLException;
	
	//부서장이 재택근무인 부서원에게 보낸 응답 시간 등록
	public void insertTeamsHomeCheck(WorkFromHomeAnswerVO home) throws SQLException;
	
	//부서원이 응답한 시간 update
	public void updateWorkFromHomeAnswerTime(WorkFromHomeAnswerVO answer) throws SQLException;
	
	//재택근무현황리스트
	public List<WorkFromHomeAnswerVO> selectWorkFromHomeAnswerListByTeamCode(String teamCode) throws SQLException;
	
	//재택근무현황 응답 갯수 리스트
	public int selectWorkFromHomeAnsCntByEmpCode(String empCode) throws SQLException;
	
	//재택근무응답 가져오기
	public WorkFromHomeAnswerVO selectWorkFromhomeAnswerByAnswerTimeAndEmpCode(WorkFromHomeAnswerVO answer) throws SQLException;
	
	//연차신청서등록
	public void insertAnnualHistory(AnnualHistoryVO annual) throws SQLException;
	
	/////////////////////////////부서재택근무현황 다시하는거
	//재택근무하는 사람만 가져오기 (그달의)
	public List<EmployeeVO> selectWorkFromHomeEmployeeList(String yearMonth) throws SQLException;
	
	//재택근무응답리스트 가져오기 (그달의)
	public List<WorkFromHomeAnswerVO> selectWorkFromHomeAnswerList(String yearMonth) throws SQLException;
	///////////////////////////////////
	
}
