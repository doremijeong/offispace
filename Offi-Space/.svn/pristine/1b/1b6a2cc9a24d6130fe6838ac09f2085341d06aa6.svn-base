package kr.co.offispace.dao.scheduler;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.SchedulerCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.SchedulerVO;

public interface SchedulerDAO {

	//분류별 일정 조회
	List<SchedulerVO> selectSchedulerList(String empCode) throws SQLException;
	List<SchedulerVO> selectDPTSchedulerList(String teamCode) throws SQLException;
	List<SchedulerVO> selectCMPSchedulerList() throws SQLException;
	
	//일정분류코드
	SchedulerVO selectSchedulerByEmpCode(String empCode) throws SQLException;
	SchedulerVO selectSchedulerByScdDptCode(String scdDptCode) throws SQLException;
	SchedulerVO selectSchedulerByScdCode(String scdCode) throws SQLException;
	SchedulerVO selectSchedulerByscdCpGrCode() throws SQLException;
	
	//일정 수정하기
	public void updateScheduler(SchedulerVO scheduler) throws SQLException;
	
	//일정 등록하기
	public String insertScheduler(SchedulerVO schedulerVO) throws SQLException;
	
	//일정삭제하기
	void deleteScheduler(String scdCode) throws SQLException;
	
	//사원 최초 생성시 스케쥴_그룹 테이블에 한줄 추가
	public void insertSchedulerGroup(EmployeeVO employee) throws SQLException;
	
	public List<SchedulerVO> selectPersonalSchedulerList(String empCode) throws SQLException;
	
	
}
