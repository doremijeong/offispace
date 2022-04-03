package kr.co.offispace.service.scheduler;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.SchedulerCommand;
import kr.co.offispace.dao.scheduler.SchedulerDAO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.dto.SchedulerVO;
import kr.co.offispace.service.notification.NotificationService;

public class SchedulerServiceImpl implements SchedulerSerivce {

	private SchedulerDAO schedulerDAO;
	public void setSchedulerDAO(SchedulerDAO schedulerDAO) {
		this.schedulerDAO = schedulerDAO;
	}
	
	@Override
	public List<SchedulerVO> getScherdulerList(String empCode) throws SQLException {
		
		SchedulerVO schedulerVO = schedulerDAO.selectSchedulerByEmpCode(empCode);

		List<SchedulerVO> schedulerList = schedulerDAO.selectSchedulerList(empCode);
		for (SchedulerVO scheduler : schedulerList) {
			scheduler.setScdColor(schedulerVO.getScdColor());
		}
		return schedulerList;
	}

	@Override
	public SchedulerVO getSchedulerByScdCode(String scdCode) throws SQLException {
		return schedulerDAO.selectSchedulerByScdCode(scdCode);
	}

	@Override
	public void modifyScheduler(SchedulerVO scheduler) throws SQLException {
		schedulerDAO.updateScheduler(scheduler);
	}


	@Override
	public String registerScheduler(SchedulerVO schedulerVO) throws SQLException {

		return schedulerDAO.insertScheduler(schedulerVO);
		
		
	}

	@Override
	public void removeSchdeulr(String scdCode) throws SQLException {

		schedulerDAO.deleteScheduler(scdCode);
		
	}

	@Override
	public List<SchedulerVO> getSchedulerDPTList(String teamCode) throws SQLException {
		List<SchedulerVO> getSchedulerDPTList = schedulerDAO.selectDPTSchedulerList(teamCode);
		
		SchedulerVO schedulerVO = schedulerDAO.selectSchedulerByScdDptCode(teamCode);
		for (SchedulerVO scheduler : getSchedulerDPTList) {
			scheduler.setScdColor(schedulerVO.getScdColor());
		}
		return getSchedulerDPTList;
	}

	@Override
	public SchedulerVO getSchedulerByScdDptCode(String scdDptCode) throws SQLException {
		return schedulerDAO.selectSchedulerByScdDptCode(scdDptCode);
	}

	@Override
	public SchedulerVO getSchdeulrByEmpCode(String empCode) throws SQLException {
		return schedulerDAO.selectSchedulerByEmpCode(empCode);
	}

	@Override
	public List<SchedulerVO> selectCMPSchedulerList() throws SQLException {
		List<SchedulerVO> selectCMPSchedulerList = schedulerDAO.selectCMPSchedulerList();
		
		for (SchedulerVO scheduler : selectCMPSchedulerList) {
			scheduler.setScdColor("#4BC3D6");
		}
		
		return selectCMPSchedulerList;
	}

	@Override
	public SchedulerVO getSchedulerByCpScdGrCode() throws SQLException {
		return schedulerDAO.selectSchedulerByscdCpGrCode();
	}

	@Override
	public void registerSchedulerGroup(EmployeeVO employee) throws SQLException {
		schedulerDAO.insertSchedulerGroup(employee);
	}

	@Override
	public List<SchedulerVO> getPersonalSchedulerList(String empCode) throws SQLException {
		return schedulerDAO.selectPersonalSchedulerList(empCode);
	}
}
