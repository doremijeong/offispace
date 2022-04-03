package kr.co.offispace.service.scheduler;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.SchedulerCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.SchedulerVO;

public interface SchedulerSerivce {

	public List<SchedulerVO> getScherdulerList(String empCode) throws SQLException;
	public List<SchedulerVO> getSchedulerDPTList(String teamCode) throws SQLException;
	public List<SchedulerVO> selectCMPSchedulerList()throws SQLException;
	
	public SchedulerVO getSchdeulrByEmpCode(String empCode) throws SQLException;
	public SchedulerVO getSchedulerByScdCode(String scdCode) throws SQLException;
	public SchedulerVO getSchedulerByCpScdGrCode() throws SQLException;
	
	public void modifyScheduler(SchedulerVO scheduler) throws SQLException;
	
	public String registerScheduler(SchedulerVO schedulerVO) throws SQLException;
	
	public void removeSchdeulr(String scdCode) throws SQLException;
	
	public SchedulerVO getSchedulerByScdDptCode(String scdDptCode) throws SQLException;

	public void registerSchedulerGroup(EmployeeVO employee) throws SQLException;
	
	public List<SchedulerVO> getPersonalSchedulerList(String empCode) throws SQLException;
}
